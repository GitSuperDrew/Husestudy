package cn.husestudy.reply.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import cn.husestudy.discuss.service.DiscussService;
import cn.husestudy.reply.service.ReplyService;
import cn.husestudy.reply.vo.Reply;
import cn.husestudy.user.service.UserService;
import cn.husestudy.utils.PageBean;
import cn.husestudy.works.service.WorksService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class ReplyAction extends ActionSupport implements ModelDriven<Reply>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//注入模型驱动实体类：
	private Reply reply = new Reply();
	
	public Reply getReply() {
		return reply;
	}
	public void setReply(Reply reply) {
		this.reply = reply;
	}
	@Override
	public Reply getModel() {
		return reply;
	}
	
	//注入响应的service业务层：
	private ReplyService replyService; 
	private WorksService worksService;
	private DiscussService discussService;
	private UserService userService;
	
	
	public WorksService getWorksService() {
		return worksService;
	}
	public DiscussService getDiscussService() {
		return discussService;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setWorksService(WorksService worksService) {
		this.worksService = worksService;
	}
	public void setDiscussService(DiscussService discussService) {
		this.discussService = discussService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public ReplyService getReplyService() {
		return replyService;
	}
	public void setReplyService(ReplyService replyService) {
		this.replyService = replyService;
	}
	/**
	 * 保存回复信息成功
	 * @return "saveSuccess"
	 */
	public String save(){
		replyService.save(reply);
		return "saveSuccess";
	}
	/**
	 * 删除回复信息成功
	 * @return "deleteSuccess"
	 */
	public String delete(){
		replyService.delete(reply);
		return "deleteSuccess";
	}
	/**
	 * 根据回复ID，查询出具体的回复信息
	 * @return "findReplyById"
	 */
	public String findReplyById(){
		String reply_id = ServletActionContext.getRequest().getParameter("reply_id");
		reply =  replyService.findReplyById(reply_id);
		ActionContext.getContext().getValueStack().set("reply", reply);
		return "findReplyById";
	}
	/**
	 * 分页：根据
	 * @return "findRepliesPage"
	 */
	private int page;
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	/**
	 * 分页显示回复信息
	 * @return "findRepliesPage"
	 */
	public String findRepliesPage(){
		PageBean<Reply> pageBeanReplys =  replyService.findRepliesPage(page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBeanReplys);
		return "findRepliesPage";
	}

}
