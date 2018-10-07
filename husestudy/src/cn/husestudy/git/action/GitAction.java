package cn.husestudy.git.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import cn.husestudy.discuss.service.DiscussService;
import cn.husestudy.git.service.GitService;
import cn.husestudy.git.vo.Git;
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
 * 用户界面：收藏管理的Action
 * @author Drew
 *
 */
public class GitAction extends ActionSupport implements ModelDriven<Git>{

	private static final long serialVersionUID = 1L;
	//用于接受数据的模型驱动：
    private Git git = new Git();
    //注入收藏的GitService UserService WorksService
    private GitService gitService;        //收藏
    private UserService userService;    //用户
    private WorksService worksService;    //作品
    private DiscussService discussService;   //评论
    private SendMsgService sendMsgService;    //网站服务信息
    private User user;
    private Works works;
    private int page;
    
    
    public DiscussService getDiscussService() {
		return discussService;
	}
	public void setDiscussService(DiscussService discussService) {
		this.discussService = discussService;
	}
	public SendMsgService getSendMsgService() {
        return sendMsgService;
    }
    public void setSendMsgService(SendMsgService sendMsgService) {
        this.sendMsgService = sendMsgService;
    }
    public int getPage() {
        return page;
    }
    public void setPage(int page) {
        this.page = page;
    }
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    public void setGitService(GitService gitService) {
        this.gitService = gitService;
    }
    public Git getGit() {
        return git;
    }
    public GitService getGitService() {
        return gitService;
    }
    public UserService getUserService() {
        return userService;
    }
    public WorksService getWorksService() {
        return worksService;
    }
    public void setGit(Git git) {
        this.git = git;
    }
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
    public void setWorksService(WorksService worksService) {
        this.worksService = worksService;
    }


    @Override
    public Git getModel() {
        return git;
    }
    
    /**
     * 根据收藏编号，查询收藏具体信息。
     * @return  findByGid
     */
    public String findByGid(){
        git = gitService.findByGid(git.getGid());
        return "findByGid";
    }
    
    
    /**
     * 根据用户的用户名，查询出所有属于此用户的收藏信息。
     * @return  findAllGitByUsername
     */
    public String findByUid(){
        user = (User)ServletActionContext.getRequest().getSession().getAttribute("existUser");
        user = userService.findByUid(user.getUid());
        
        //1.根据用户的ID，查询用户的收藏：
        PageBean<Git> pageBean = gitService.findByUid(user.getUid(), page);
        ActionContext.getContext().getValueStack().set("pageBean", pageBean);
        //2.取出湘科院中5条最新的作品：
        List<Works> fiveWorks = worksService.findByWdate(5);
        ActionContext.getContext().getValueStack().set("fiveWorks", fiveWorks);
        
        //3.首先查询出评论数量最多的前5个wid,在根据wid进行查找作品：
        List<Integer> wids = discussService.findWidCountByWid();
        List<Works> worksListHot = new ArrayList<Works>();
        for (Integer wid : wids) {
            worksListHot.add(worksService.findByWid(wid));
        }
        ActionContext.getContext().getValueStack().set("worksListHot", worksListHot);
        //4.将（网站服务信息）存入值栈：
        List<Contact_Info> contact_InfoList = sendMsgService.contactInfo();
        ActionContext.getContext().getValueStack().set("contact_InfoList", contact_InfoList);
        
        return "findByUid";
    }
    
    /**
     * 无分页：查询所有的用户收藏模块：使用AJAX显示出所有的收藏条信息
     * @return findAll
     */
    public String findAll(){
        List<Git> gList = gitService.findAll();
        //将所有的收藏添加到值栈中
        ActionContext.getContext().getValueStack().set("gList", gList);
        return "findAll";
    }
    
    /**
     * 用户自己删除自己的收藏：
     * @return deleteSuccess
     */
    public String delete(){
        gitService.delete(git);
        return "deleteSuccess";
    }
    
    /**
     * 用户添加保存：
     * @return saveSuccess
     */
    public void save(){
    	//补充保存的时刻：
    	HttpServletRequest request = ServletActionContext.getRequest();
    	Integer wid = Integer.parseInt(request.getParameter("wid"));
    	
    	user = (User)ServletActionContext.getRequest().getSession().getAttribute("existUser");
        user = userService.findByUid(user.getUid());
        
        works = worksService.findByWid(wid);
        
        git.setGdate(new Date());
    	git.setUser(user);
    	git.setWorks(works);
    	
        gitService.save(git);
        //return "saveSuccess";
    }
    

}
