package cn.husestudy.sendmsg.action;

import java.util.List;

import cn.husestudy.sendmsg.service.SendMsgService;
import cn.husestudy.sendmsg.vo.Contact_Info;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class Contact_InfoAction extends ActionSupport implements ModelDriven<Contact_Info>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//模型驱动使用的对象
	private Contact_Info contact_Info = new Contact_Info();
	public Contact_Info getContact_Info() {
		return contact_Info;
	}
	public void setContact_Info(Contact_Info contact_Info) {
		this.contact_Info = contact_Info;
	}
	
	//注入SendMsgService
	private SendMsgService sendMsgService;
	public SendMsgService getSendMsgService() {
		return sendMsgService;
	}
	public void setSendMsgService(SendMsgService sendMsgService) {
		this.sendMsgService = sendMsgService;
	}
	
	@Override
	public Contact_Info getModel() {
		return contact_Info;
	}
	
	/**
	 * 将数据传入到前台JSP页面
	 * @return
	 */
	public String findAllContactInfo(){
		//查询单个服务信息数据：
		List<Contact_Info> contact_InfoList = sendMsgService.contactInfo();
		//将数据存入到值栈中：
		ActionContext.getContext().getValueStack().set("contact_InfoList", contact_InfoList);
		//跳转到页面：
		return "findAllContactInfo";
	}
	

}
