package cn.husestudy.interceptor;

import org.apache.struts2.ServletActionContext;



import cn.husestudy.admin.vo.Admin;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

/**
 * 权限拦截
 * @author Drew
 *
 */
public class PrivilegeInterceptor extends MethodFilterInterceptor{

	private static final long serialVersionUID = 1L;

	@Override
	protected String doIntercept(ActionInvocation actionInvocation) throws Exception {
		// 判断是否登录,如果登录,放行,没有登录,跳转到登录页
		Admin adminUser = (Admin) ServletActionContext.getRequest()
				.getSession().getAttribute("existAdmin");
		if(adminUser != null){
			// 已经登录
			return actionInvocation.invoke();
		}else{
			// 跳转到登录页
			ActionSupport support = (ActionSupport) actionInvocation.getAction();
			support.addActionError("您还没有登录!没有权限访问!");
			return ActionSupport.LOGIN;
		}
	}

}
