package cn.husestudy.sendmsg.adminaction;


import java.util.List;

import cn.husestudy.sendmsg.service.SendMsgService;
import cn.husestudy.sendmsg.vo.Contact_Info;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class Contact_InfoAdminAction extends ActionSupport implements ModelDriven<Contact_Info> {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//注入模型使用的对象
	private Contact_Info contact_Info = new Contact_Info();
	
	public Contact_Info getContact_Info() {
		return contact_Info;
	}
	public void setContact_Info(Contact_Info contact_Info) {
		this.contact_Info = contact_Info;
	}
	
	@Override
	public Contact_Info getModel() {
		return contact_Info;
	}
	
	//注入业务层需要使用的对象：SendMsgService
	private SendMsgService sendMsgService;
	
	public SendMsgService getSendMsgService() {
		return sendMsgService;
	}
	public void setSendMsgService(SendMsgService sendMsgService) {
		this.sendMsgService = sendMsgService;
	}
	
	
	/**
	 * 响应层：查询所有==实现网站服务管理的信息
	 * @return	contactInfo
	 */
	public String contactInfo(){
		List<Contact_Info> contact_Info = sendMsgService.contactInfo();
		ActionContext.getContext().getValueStack().set("contact_Info", contact_Info);
		return "contactInfo";
	}
	
	/**
	 * 跳转到contact_info的编辑页面
	 * @return   editContactInfoSuccess
	 */
	public String editContactInfo(){
		//根据编号查询响应的数据放入到session中
		contact_Info = sendMsgService.findContactInfoById(contact_Info.getInfoId());
		//跳转到登录界面
		return "editContactInfoSuccess";
	}
	
	/**
	 * 更新编辑的contact_info的信息
	 * @return  updateContactInfo
	 */
	public String updateContactInfo(){
		sendMsgService.updateContactInfo(contact_Info);
		return "updateContactInfoSuccess";
	}
	
	public String saveContactInfo(){
		sendMsgService.saveContactInfo(contact_Info);
		return "saveContactInfoSuccess";
	}

	
}
