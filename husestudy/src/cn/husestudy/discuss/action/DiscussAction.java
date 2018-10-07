package cn.husestudy.discuss.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import cn.husestudy.discuss.service.DiscussService;
import cn.husestudy.discuss.vo.Discuss;
import cn.husestudy.sendmsg.service.SendMsgService;
import cn.husestudy.sendmsg.vo.Contact_Info;
import cn.husestudy.user.service.UserService;
import cn.husestudy.user.vo.User;
import cn.husestudy.utils.PageBean;
import cn.husestudy.works.service.WorksService;
import cn.husestudy.works.vo.Works;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class DiscussAction extends ActionSupport implements ModelDriven<Discuss>{

	private static final long serialVersionUID = 1L;
	//注入模型使用的对象：
    private Discuss discuss = new Discuss();            //模型驱动
    
    
    public Discuss getDiscuss() {
        return discuss;
    }
    public void setDiscuss(Discuss discuss) {
        this.discuss = discuss;
    }
    
    //注入DiscussService 和   WorksService
    private DiscussService discussService;              //评论的service
    private WorksService worksService;                   //作品的service
    private UserService userService;                    //用户的service
    private SendMsgService sendMsgService;                //网站服务信息的service
    
    private int page;                    //页码
    private Integer wid;
    private Integer uid;
    
    private User user;
    private Works works;
    
    
    public SendMsgService getSendMsgService() {
        return sendMsgService;
    }
    public void setSendMsgService(SendMsgService sendMsgService) {
        this.sendMsgService = sendMsgService;
    }
    public Works getWorks() {
        return works;
    }
    public void setWorks(Works works) {
        this.works = works;
    }
    public Integer getWid() {
        return wid;
    }
    public void setWid(Integer wid) {
        this.wid = wid;
    }
    public Integer getUid() {
        return uid;
    }
    public void setUid(Integer uid) {
        this.uid = uid;
    }
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    public int getPage() {
        return page;
    }
    public void setPage(int page) {
        this.page = page;
    }
    public DiscussService getDiscussService() {
        return discussService;
    }
    public void setDiscussService(DiscussService discussService) {
        this.discussService = discussService;
    }
    public WorksService getWorksService() {
        return worksService;
    }
    public void setWorksService(WorksService worksService) {
        this.worksService = worksService;
    }
    public UserService getUserService() {
        return userService;
    }
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
    
    
    @Override
    public Discuss getModel() {
        return discuss;
    }
    
    
    /**
     * 分页查询：根据（作品ID），查询出所有的的评论
     * @return
     */
    public String findByWid(){
        //根据作品的ID查询评论：
        PageBean<Discuss> pageBean = discussService.findByPageWid(wid, page);
        //将pageBean存入到值栈中:
        ActionContext.getContext().getValueStack().set("pageBean", pageBean);
        //跳转到页面：
        return "findByWid";
    }
    
    /**
     * 分页查询：根据（用户ID），查询出所有的评论
     * @return
     */
    public String findByUid(){
        user = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
        user = userService.findByUid(user.getUid());
        //1.根据（用户ID），查询评论：
        PageBean<Discuss> pageBean = discussService.findByPageUid(user.getUid(), page);
        //将pageBean存入到值栈中：
        ActionContext.getContext().getValueStack().set("pageBean", pageBean);
        
        //2.查询所有此用户的评论：并将其插入到值栈中：====================外加一个方法：
        List<Discuss> discusses = discussService.findAllByUid(user.getUid());
        ActionContext.getContext().getValueStack().set("discusses", discusses);
        
        //3.取出湘科院中5条最新的作品：
        List<Works> fiveWorks = worksService.findByWdate(5);
        ActionContext.getContext().getValueStack().set("fiveWorks", fiveWorks);
        
        //4.首先查询出评论数量最多的前5个wid,在根据wid进行查找作品：
        List<Integer> wids = discussService.findWidCountByWid();
        List<Works> worksListHot = new ArrayList<Works>();
        for (Integer wid : wids) {
            worksListHot.add(worksService.findByWid(wid));
        }
        ActionContext.getContext().getValueStack().set("worksListHot", worksListHot);
        //5.将（网站服务信息）存入值栈中：
        List<Contact_Info> contact_InfoList = sendMsgService.contactInfo();
        ActionContext.getContext().getValueStack().set("contact_InfoList", contact_InfoList);
        
        //跳转到页面：
        return "findByUid";
    }
    
    /**
     * 根据评论ID，查询出此评论的具体信息
     * @return
     */
    public String findByDid(){
        //将某一个评论添加到模型驱动对象中。
        discuss = discussService.findByDid(discuss.getDid());
        return "findByDid";
    }
    
    
    /**
     * 根据已经登录的用户ID和作品的ID，来实现提交评论????????????????????????自动刷新页面：discussArea.jsp
     * @return
     * @throws ParseException
     */
    public String sendMessage() throws ParseException{
        //插入当前提交的时间：
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String nowTime = sdf.format(date);
        Date time = sdf.parse(nowTime);
        discuss.setDdate(time);
        
        //存入已经登录的用户的ID：
        User existUser = (User)ServletActionContext.getContext().getSession().get("existUser");
        discuss.setUser(existUser);
        
        //获取到用户当前展示的作品：
        Works existWorks = (Works) ServletActionContext.getContext().getSession().get("detialsWork");
        discuss.setWorks(existWorks);
        discuss.setGood(0L); //赋初始值为0
        discuss.setBad(0L);  //赋初始值为0
        //保存当前评论的实体：
        discussService.save(discuss);
        //跳转到提交成功的页面:
        return "sendMessageSuccess";
    }
    
    
    //点赞数量增加：
    public void goodAdd(){
    	//action获取从页面的请求存储域中那数据：
    	HttpServletRequest request = ServletActionContext.getRequest();
    	Integer did =Integer.parseInt(request.getParameter("did"));
    	Integer goodNum = Integer.parseInt(request.getParameter("good"));
    	discussService.goodAdd(did,goodNum);
    }
    //不支持数量增加：
    public void badAdd(){
    	//action获取从页面的请求存储域中那数据：
    	HttpServletRequest request = ServletActionContext.getRequest();
    	Integer did =Integer.parseInt(request.getParameter("did"));
    	Integer badNum = Integer.parseInt(request.getParameter("bad"));
    	discussService.badAdd(did,badNum);
    }
    
    /**
     * 用户保存评论：
     * @return
     */
    public String save(){
        discussService.save(discuss);
        return "saveSuccess";
    }
    
    /**
     * 用户删除评论：
     * @return
     */
    public String delete(){
        Discuss existDiscuss = discussService.findByDid(discuss.getDid());
        discussService.delete(existDiscuss);
        return "deleteSuccess";
    }
    
    /**
     * 用户编辑评论：
     * @return
     */
    public String edit(){
        //找到一个discuss存放到模型驱动中，在进行页面的跳转。
        discuss = discussService.findByDid(discuss.getDid());
        return "editSuccess";
    }
    
    /**
     * 修改用户自己对作品的评价：???????????????????不能编辑，一旦编辑就会出现。。。保存不了wid,而uid是从session中取出来的。
     * @return
     */
    public String update(){
        discuss.setDdate(new Date());
        
        User eUser = (User) ServletActionContext.getContext().getSession().get("existUser");
        discuss.setUser(eUser);
        
        discuss.setWorks(discuss.getWorks());
        
        Long good = discussService.findCountGoodById(discuss.getDid());
        discuss.setGood(good); 
        Long bad = discussService.findCountBadById(discuss.getDid());
        discuss.setBad(bad);
        
        discussService.update(discuss);
        return "updateSuccess";
    }

}
