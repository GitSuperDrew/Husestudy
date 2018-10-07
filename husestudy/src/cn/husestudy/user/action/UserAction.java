package cn.husestudy.user.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import cn.husestudy.user.service.UserService;
import cn.husestudy.user.vo.User;
import cn.husestudy.utils.MailUitls;
import cn.husestudy.works.service.WorksService;
import cn.husestudy.works.vo.Works;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 用户模块的Action 类
 * @author Drew
 *
 */
public class UserAction extends ActionSupport implements ModelDriven<User>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//使用模型驱动的对象：
	private User user = new User();
	
	@Override
	public User getModel() {
		return user;
	}
	
	//接受验证码：
	private String checkcode;
	
	public void setCheckcode(String checkcode){
		this.checkcode = checkcode;
	}
	
	//注入UserService
	private UserService userService;
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	/**
	 * 跳转到注册页面的执行方法
	 * @return  "registPage"
	 */
	public String registPage(){
		return "registPage";
		}
	
	/**
	 * 跳转到 重新确认密码页面的执行方法
	 * @return repasswordPage
	 */
	public String repasswordPage(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String uid = request.getParameter("uid");
		user = userService.findByUid(Integer.parseInt(uid));
		ActionContext.getContext().getValueStack().set("user", user);
		return "repasswordPage";
	}
	
	//用户更新/修改密码
	public String checkUserEmail() throws IOException{
		//获取到前台传送过来的数据：username,email
		HttpServletRequest request = ServletActionContext.getRequest();
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		//提取数据库中的数据：通过用户名判断是否能够找到此用户。
		User user = userService.findByUsername(username);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		//判断数据库中是否存在此用户和与之对应的邮箱
		if (user != null) {
			response.getWriter().println("<font color='green'>用户名输入正确</font>");
			if (email.equals(user.getEmail())){
				MailUitls.sendRepassword(email,user.getUid());//使用邮箱工具类发送邮件:
				response.getWriter().println("<font color='green'>用户名和邮箱匹配正确,请到提交的邮箱中查看！</font>");
			}else{
				response.getWriter().println("<font color='red'>邮箱匹配错误</font>");
			}
		} else {
			response.getWriter().println("<font color='red'>不存在此用户</font>");
		}
		return NONE;
	}
	
	//用户在填写密码信息的时候可以提示成功，可以提示已经成功了。只需要获取到：username 和  password 就可以！
	public String repasswordEenter(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		userService.updatePassword(username,password);
		return "login";
	}
	
	/**
	 * Ajax进行异步校验用户名的执行方法
	 * @return
	 * @throws IOException
	 */
	public String findByName() throws IOException{
		//调用service进行查询：
		User existUser =  userService.findByUsername(user.getUsername());
		//获得response对象，页面输出：
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		// 判断
		if (existUser != null) {
			// 查询到该用户:用户名已经存在
			response.getWriter().println("<font color='red'>用户名已经存在</font>");
		} else {
			// 没查询到该用户:用户名可以使用
			response.getWriter().println("<font color='green'>用户名可以使用</font>");
		}
		return NONE;
	}
		
	
	
	/**
	 * 用户注册方法
	 */
	public String regist(){
		//判断验证程序代码：
		//从session中获取验证码的随机值
		String checkcode1 = (String) ServletActionContext.getRequest().getSession().getAttribute("checkcode");
		if (!checkcode.equals(checkcode1)) {
			this.addActionError("验证码输入错误！");
			return "checkcodeFail";
		}
		userService.save(user);
		this.addActionMessage("注册成功！请去邮箱激活！");
		return "msg";
	}
	/**
	 * 用户激活的方法
	 * @return  "msg"
	 */
	public String active(){
		//根据激活码查询用户
		User existUser = userService.findByCode(user.getCode());
		//判断
		if (existUser == null) {
			//激活码错误的
			this.addActionMessage("激活失败：激活码错误！");
		}else {
			//激活成功，修改用户的状态
			existUser.setState(1);
			existUser.setCode(null);
			userService.update(existUser);
			this.addActionMessage("激活成功：请去登录！");
		}
		return "msg";
	}
	
	/**
	 * 跳转到登录界面
	 * @return  "loginPage"
	 */
	public String loginPage(){
		return "loginPage";
	}
	
	
	/**
	 * 用户登录到（自己）的首页
	 * @return   "singleHomeOver"
	 */
	public String singleHomeOver(){
		Object user =  ServletActionContext.getRequest().getSession().getAttribute("existUser");
		List<Works> wuList = worksService.findAllWorksByUsername((User) user);
		ActionContext.getContext().getValueStack().set("wuList", wuList);
		return "singleHomeOver";
	}
	
	
	
	/** 
	 * 用户登录到（作品）的首页
	 * @return  "singleHome"
	 */
	public String singleHome(){
		return "singleHome";
	}
	
	
	
	//在用户处注入WorksService
	private WorksService worksService;
	
	public WorksService getWorksService() {
		return worksService;
	}

	public void setWorksService(WorksService worksService) {
		this.worksService = worksService;
	}

	
	
	/**
	 * 用户登录的方法
	 * @return
	 */
	public String login(){
		User existUser = userService.login(user);
		//判断
		if (existUser == null) {
			this.addActionError("登录失败：用户名或密码错误或用户未激活！");
			return LOGIN;
		}else {
			//登录成功：将用户信息存入到session中
			ServletActionContext.getRequest().getSession().setAttribute("existUser", existUser);
			//页面跳转
			return "loginSuccess";
		}
	}
	
	/**
	 * 用户退出的方法
	 * @return
	 */
	public String quit(){
		//销毁session
		ServletActionContext.getRequest().getSession().invalidate();
		return "quit";
	}
	
	/**
     * 查看 百度地图导航
     * @return map
     */
    public String map(){
    	return "map";
    }
}
