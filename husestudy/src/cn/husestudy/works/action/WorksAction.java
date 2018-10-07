package cn.husestudy.works.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import cn.husestudy.college.service.CollegeService;
import cn.husestudy.college.vo.College;
import cn.husestudy.discuss.service.DiscussService;
import cn.husestudy.discuss.vo.Discuss;
import cn.husestudy.reply.service.ReplyService;
import cn.husestudy.reply.vo.Reply;
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

/**
 * 用户界面的作品管理的action类
 * @author Drew
 *
 */
public class WorksAction  extends ActionSupport implements ModelDriven<Works>{

    private static final long serialVersionUID = 1L;
    //用于接受数据的模型驱动：
    private Works works = new Works();
    //注入作品的service
    private WorksService worksService;
    //接受学院（一级分类）的cid
    private Integer cid;
    //接受专业（二级分类）
    private Integer mid;
    //接收 --作品的评论
    private Discuss discuss;
    //接收user的实体类
    private User user;
    
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    public Discuss getDiscuss() {
        return discuss;
    }
    public void setDiscuss(Discuss discuss) {
        this.discuss = discuss;
    }
    public void setWorks(Works works) {
        this.works = works;
    }
    public void setWorksService(WorksService worksService) {
        this.worksService = worksService;
    }
    public void setCid(Integer cid) {
        this.cid = cid;
    }
    public void setMid(Integer mid) {
        this.mid = mid;
    }
    
    //注入（学院）一级分类的service
    private CollegeService collegeService;
    //接受当前页数：
    private int page;
    

    public void setCollegeService(CollegeService collegeService) {
        this.collegeService = collegeService;
    }
    public void setPage(int page) {
        this.page = page;
    }
    
    public Works getWorks() {
        return works;
    }
    public WorksService getWorksService() {
        return worksService;
    }
    public Integer getCid() {
        return cid;
    }
    public Integer getMid() {
        return mid;
    }
    public CollegeService getCollegeService() {
        return collegeService;
    }
    public int getPage() {
        return page;
    }
    @Override
    public Works getModel() {
        return works;
    }
    
    
    //注入DiscussService
    private DiscussService discussService;
    //注入SendMsgService
    private SendMsgService sendMsgService;
    //注入ReplyService
    private ReplyService replyService;
    
    
    public ReplyService getReplyService() {
		return replyService;
	}
	public void setReplyService(ReplyService replyService) {
		this.replyService = replyService;
	}
	public DiscussService getDiscussService() {
        return discussService;
    }
    public void setDiscussService(DiscussService discussService) {
        this.discussService = discussService;
    }
    
    //注入UserService
    private UserService userService;
    
    public UserService getUserService() {
        return userService;
    }
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
    public SendMsgService getSendMsgService() {
        return sendMsgService;
    }
    public void setSendMsgService(SendMsgService sendMsgService) {
        this.sendMsgService = sendMsgService;
    }
    
    
    /**
     * 根据作品的ID进行查询商品：执行方法
     * @return "findByWid"
     */
    public String findByWid(){
        works = worksService.findByWid(works.getWid());
        return "findByWid";
    }
    
    /**
     * 用户查询出所有的作品
     * @return
     */
    public String findAll(){
        List<Works> wuList = worksService.findAll();
        ActionContext.getContext().getValueStack().set("wuList", wuList);
        return "findAll";
    }

    /**
     * 分页：根据用户的ID，查询此用户的所有的作品。从session中获取用户信息！
     * @return
     */
    public String findAllWorksByUsername(){
        user = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
        user = userService.findByUid(user.getUid());
        findAllOthers(user);
        return "findAllWorksByUsername";
    }
    
    /**
     * 分页：根据用户ID，查询此用户所有的作品。从请求request中获取用户信息！
     * @return
     */
    public String findByUsername(){
    	Integer uid = Integer.valueOf(ServletActionContext.getRequest().getParameter("uid"));
    	user = userService.findByUid(uid);
    	findAllOthers(user);
    	return "findByUsername";
    }
    /**
     * 公共方法：查询出网页其他的必要信息，提供给findByUsername和findAllWorksByUsername两个方法。
     * @param user
     */
    public void findAllOthers(User user){
      //根据用户的ID，查询作品
        PageBean<Works> pageBean = worksService.findByUid(user.getUid(), page);
        ActionContext.getContext().getValueStack().set("pageBean", pageBean);
      //将（网站服务信息）存入值栈：
        List<Contact_Info> contact_InfoList = sendMsgService.contactInfo();
        ActionContext.getContext().getValueStack().set("contact_InfoList", contact_InfoList);
      //取出湘科院中5条最新的作品：
        List<Works> fiveWorks = worksService.findByWdate(5);
        ActionContext.getContext().getValueStack().set("fiveWorks", fiveWorks);
      //首先查询出评论数量最多的前5个wid,在根据wid进行查找作品：
        List<Integer> wids = discussService.findWidCountByWid();
        List<Works> worksListHot = new ArrayList<Works>();
        for (Integer wid : wids) {
            worksListHot.add(worksService.findByWid(wid));
        }
        ActionContext.getContext().getValueStack().set("worksListHot", worksListHot);
    }
    
    /**
     * 根据收藏表传过来的用户ID，查询出所有的属于此用户的作品
     * @return findAllWorksFromGitUid
     */
    public String findAllWorksFromGitUid(){
        HttpServletRequest request = ServletActionContext.getRequest();
        Integer uid = Integer.parseInt(request.getParameter("uid"));
        user = userService.findByUid(uid);
        //根据用户的ID，分页查询出所有的作品：
        PageBean<Works> pageBean = worksService.findByUid(user.getUid(), page);
        ActionContext.getContext().getValueStack().set("pageBean", pageBean);
      //将（网站服务信息）存入值栈：
        List<Contact_Info> contact_InfoList = sendMsgService.contactInfo();
        ActionContext.getContext().getValueStack().set("contact_InfoList", contact_InfoList);
      //取出湘科院中5条最新的作品：
        List<Works> fiveWorks = worksService.findByWdate(5);
        ActionContext.getContext().getValueStack().set("fiveWorks", fiveWorks);
      //首先查询出评论数量最多的前5个wid,在根据wid进行查找作品：
        List<Integer> wids = discussService.findWidCountByWid();
        List<Works> worksListHot = new ArrayList<Works>();
        for (Integer wid : wids) {
            worksListHot.add(worksService.findByWid(wid));
        }
        ActionContext.getContext().getValueStack().set("worksListHot", worksListHot);
        return "findAllWorksFromGitUid";
    }
    
    
    //文件上传需要的三个属性：
    private File upload;        //上传的文件(跟我们表单上的name值一样)
    private File uploadVedio;    //上传视频的路径(跟我们表单上的name值一样)
    private String uploadFileName;        //接受文件上传的文件名
    private String uploadVedioName;        //接受视频文件的文件名
    private String uploadContentType;//接受文件上传的MIME的类型
    
    public void setUpload(File upload) {
        this.upload = upload;
    }
    public void setUploadVedio(File uploadVedio) {
        this.uploadVedio = uploadVedio;
    }
    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }
    public void setUploadVedioName(String uploadVedioName) {
        this.uploadVedioName = uploadVedioName;
    }
    public void setUploadContentType(String uploadContentType) {
        this.uploadContentType = uploadContentType;
    }
    public File getUpload() {
        return upload;
    }
    public File getUploadVedio() {
        return uploadVedio;
    }
    public String getUploadFileName() {
        return uploadFileName;
    }
    public String getUploadVedioName() {
        return uploadVedioName;
    }
    public String getUploadContentType() {
        return uploadContentType;
    }
    
    /**
     * 跳转到：作品添加页面：
     * @return
     */
    public String addPage(){
        return "addPage";
    }
    
    /**
     * 保存作品的方法：
     * @return   saveSuccess
     * @throws IOException
     */
    public String save() throws IOException{
        //将提交的数据添加到数据库中：
        works.setWdate(new Date());
        //获取当前存在于session中的用户existUser
        User existUser = (User)ServletActionContext.getContext().getSession().get("existUser");
        works.setUser(existUser);
        
        if (upload != null) {
            //将作品图片上传到服务器上。获得上传图片的服务器端的路径：
            String path = ServletActionContext.getServletContext().getRealPath("/works");
            //创建文件类型对象：
            File diskFile = new File(path + "//" + uploadFileName);
            //文件上传：
            FileUtils.copyFile(upload, diskFile);
            works.setWimage("works/" + uploadFileName);
        } else {
            works.setWimage("works/blogpost1.jpg");
        }
        if(uploadVedio != null){
            String pathString = ServletActionContext.getServletContext().getRealPath("/vedio");//获得服务器路径
            File diskFileVedioFile = new File(pathString + "//" + uploadVedioName);//创建文件类型对象
            FileUtils.copyFile(uploadVedio, diskFileVedioFile);//文件上传
            works.setWvedio("vedio/" + uploadVedioName);
        }else{
            works.setWvedio("vedio/video.jpg");
        }
        worksService.save(works);
        return "saveSuccess";
    }
    
    //测试：使用hibernate中的SQL-Query语句统计作品的总数量：
    public String countWorks(){
        Long countWorks = worksService.countWorks();
        ActionContext.getContext().getSession().put("countWorks", countWorks);
        return "countWorks";
    }
    
    
    /**
     * 修改作品(不保存视频的修改)的方法
     * @return  updateSuccess
     * @throws IOException
     */
    public String update() throws IOException{
        //将信息修改到数据库：
        works.setWdate(new Date());
        //获取当前存在于session中的用户existUser
        User existUser = (User)ServletActionContext.getContext().getSession().get("existUser");
        works.setUser(existUser);
        
        //上传：
        if (upload != null) {
            String delPath = ServletActionContext.getServletContext().getRealPath("/"+works.getWimage());
            File file = new File(delPath);
            file.delete();
            //获得上传图片的服务器端路径。
            String path = ServletActionContext.getServletContext().getRealPath("/works");
            //创建文件类型对象：
            File diskFile = new File(path + "//" + uploadFileName);
            //文件上传：
            FileUtils.copyFile(upload, diskFile);
            
            works.setWimage("works/"+uploadFileName);
        } else {
            works.setWimage("works/blogpost1.jpg");
        }
        if (uploadVedio != null) {
            String delPathString = ServletActionContext.getServletContext().getRealPath("/" + works.getWvedio());
            File file = new File(delPathString);
            file.delete();
            String pathVedio = ServletActionContext.getServletContext().getRealPath("/vedio");
            File diskFileVedioFile = new File(pathVedio + "//" + uploadVedioName);
            FileUtils.copyFile(uploadVedio, diskFileVedioFile);
            works.setWvedio("vedio/"+uploadVedioName);
        }else {
            works.setWvedio("vedio/video.jpg");
        }
        worksService.update(works);
        return "updateSuccess";
    }
    
    
    /**
     * 删除作品的方法：
     * @return    deleteSuccess
     */
    public String delete(){
        //根据id查询作品的信息
        works = worksService.findByWid(works.getWid());
        //删除作品的图片：
        String path = ServletActionContext.getServletContext().getRealPath("/" + works.getWimage());
        File file = new File(path);
        file.delete();
        //删除作品在数据中的记录：
        worksService.delete(works);
        //页面跳转：
        return "deleteSuccess";
    }
    /**
     * 编辑作品：跳转到编辑页面
     * @return
     */
    public String edit(){
        //根据作品的ID查询作品的信息
        works = worksService.findByWid(works.getWid());
        return "editSuccess";
    }
    
    /**
     * 跳转到作品的详情页面：① 作品的详细信息；② 作品的所有评论；
     * @return
     */
    public String detials(){
        //1.显示出具体作品信息：
        works = worksService.findByWid(works.getWid());
        ActionContext.getContext().getSession().put("detialsWork", works);
        
        //2.将对象显示到作品的详情页面：
        PageBean<Discuss> pageBean = discussService.findByPageWid(works.getWid(), page);
        //将pageBean存入到值栈中:
        ActionContext.getContext().getValueStack().set("pageBean", pageBean);
        
        //3.根据WID查询所有的评论的数量
        Integer countWid = discussService.findCountWid(works.getWid());
        ActionContext.getContext().getValueStack().set("countWid", countWid);
        
       //5.取出湘科院中5条最新的作品：
        List<Works> fiveWorks = worksService.findByWdate(5);
        ActionContext.getContext().getValueStack().set("fiveWorks", fiveWorks);
        
        //6.首先查询出评论数量最多的前5个wid,在根据wid进行查找作品：
        List<Integer> wids = discussService.findWidCountByWid();
        List<Works> worksListHot = new ArrayList<Works>();
        for (Integer wid : wids) {
            worksListHot.add(worksService.findByWid(wid));
        }
        ActionContext.getContext().getValueStack().set("worksListHot", worksListHot);
        
        //7.将（网站服务信息）存入值栈：
        List<Contact_Info> contact_InfoList = sendMsgService.contactInfo();
        ActionContext.getContext().getValueStack().set("contact_InfoList", contact_InfoList);
        
        //8.将此用户的最新的6条作品查询：List<Works> sixWorks = worksService.findNewSixWorks(works.getUser().getUid(), 6);
        List<Works> sixWorks = worksService.findByWdate(6);
        ActionContext.getContext().getValueStack().set("sixWorks", sixWorks);
        
        //9.计算此作品中的评论是否有回复：
        /*int wid = works.getWid();
        int countReplyByWid = replyService.countReply(24);
        ActionContext.getContext().getSession().put("countReplyByWid", countReplyByWid);*/
        
        return "detialsSuccess";
    }
    
}
