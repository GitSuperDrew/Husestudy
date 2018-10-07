package cn.husestudy.discuss.adminaction;

import java.util.List;


import cn.husestudy.discuss.service.DiscussService;
import cn.husestudy.discuss.vo.Discuss;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class DiscussAdminAction extends ActionSupport implements ModelDriven<Discuss>{

	private static final long serialVersionUID = 1L;
	//模型驱动使用的类对象
	private Discuss discuss = new Discuss();
	
	public Discuss getDiscuss() {
		return discuss;
	}

	public Integer getPage() {
		return page;
	}

	public DiscussService getDiscussService() {
		return discussService;
	}

	public void setDiscuss(Discuss discuss) {
		this.discuss = discuss;
	}

	@Override
	public Discuss getModel() {
		return null;
	}
	
	private Integer page;
	public void setPage(Integer page) {
		this.page = page;
	}
	
	private DiscussService discussService;
	public void setDiscussService(DiscussService discussService) {
		this.discussService = discussService;
	}
	
	/**
	 * 分页显示所有的评论信息
	 * @return findAll
	 */
/*	public String findAll(){
		PageBean<Discuss> pageBean = discussService.findByPage(page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findAll";
	}*/
	//无分页：查询所有的评论
	public String findAll(){
		List<Discuss> dList = discussService.findAll();
		ActionContext.getContext().getValueStack().set("dList", dList);
		return "findAll";
	}
	
	
	/**
	 * 删除评论：
	 * @return  "deleteSuccess"
	 */
	public String delete(){
		//根据ID查询评论的信息：
		Discuss existDiscuss = discussService.findByDid(discuss.getDid());
		//删除数据库中的评论的记录：
		discussService.delete(existDiscuss);
		//页面跳转：
		return "deleteSuccess";
	}

	/**
	 * 保存评论的方法
	 * @return "saveSuccess"
	 */
	public String save() {
		discussService.save(discuss);
		return "saveSuccess";
	}
	
	

}
