package cn.husestudy.major_user.adminaction;

import java.util.List;

import cn.husestudy.major_user.service.Major_UserService;
import cn.husestudy.major_user.vo.Major_User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class Major_UserAdminAction  extends ActionSupport implements ModelDriven<Major_User>{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//模型驱动使用的对象
	private Major_User major_User = new Major_User();

	public Major_User getMajor_User() {
		return major_User;
	}
	public void setMajor_User(Major_User major_User) {
		this.major_User = major_User;
	}
	@Override
	public Major_User getModel() {
		return major_User;
	}
	
	//注入属性：page 和  major_UserService
	private Integer page;
	private Major_UserService major_UserService;

	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	
	public Major_UserService getMajor_UserService() {
		return major_UserService;
	}
	public void setMajor_UserService(Major_UserService major_UserService) {
		this.major_UserService = major_UserService;
	}
	
	/**
	 * 无分页：响应查询所有
	 * @return
	 */
	public String findAll(){
		List<Major_User> muList = major_UserService.findAll();
		ActionContext.getContext().getValueStack().set("muList", muList);
		return "findAll";
	}
	
	/**
	 * 添加中间表信息
	 * @return
	 */
	public String save(){
		major_UserService.save(major_User);
		return "saveSuccess";
	}
	
	/**
	 * 删除中间表信息
	 * @return
	 */
	public String delete(){
		major_UserService.delete(major_User);
		return "deleteSuccess";
	}
	
	/**
	 * 修改中间表信息
	 * @return
	 */
	public String update(){
		major_UserService.update(major_User);
		return "updateSuccess";
	}
	
	/**
	 * 编辑中间表信息
	 * @return
	 */
	public String edit(){
		major_User = major_UserService.findByMuid(major_User.getMuid());
		List<Major_User> muList = major_UserService.findAll();
		ActionContext.getContext().getValueStack().set("muList", muList);
		return "editSuccess";
	}

}
