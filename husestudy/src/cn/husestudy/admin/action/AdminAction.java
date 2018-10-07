package cn.husestudy.admin.action;

import org.apache.struts2.ServletActionContext;

import cn.husestudy.admin.service.AdminService;
import cn.husestudy.admin.vo.Admin;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AdminAction extends ActionSupport implements ModelDriven<Admin>{

	private static final long serialVersionUID = 1L;
	//模型驱动的使用对象
	private Admin admin = new Admin();
	
	@Override
	public Admin getModel() {
		return admin;
	}
	
	//注入AdminService
	private AdminService adminService;

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	
	//后台登入执行的方法
	public String login(){
		//调用service方法完成登入
		Admin existAdmin = adminService.login(admin);
		if (existAdmin == null) {
			this.addActionError("用户名或密码错误！");
			return "loginFail";
		} else {
			ServletActionContext.getRequest().getSession().setAttribute("existAdmin", existAdmin);
			return "loginSuccess";
		}
	}
	

}
