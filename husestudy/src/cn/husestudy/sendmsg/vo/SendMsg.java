package cn.husestudy.sendmsg.vo;

import java.util.Date;

/**
 * 用户反馈给管理员的信息
 * @author Drew
 *
 */
public class SendMsg {
	
	private Integer sendmsg_id;
	private String sendmsg_name;
	private String sendmsg_email;
	private String sendmsg_message;
	private Date sendmsg_sdate;
	
	
	public Integer getSendmsg_id() {
		return sendmsg_id;
	}
	public void setSendmsg_id(Integer sendmsg_id) {
		this.sendmsg_id = sendmsg_id;
	}
	public String getSendmsg_name() {
		return sendmsg_name;
	}
	public void setSendmsg_name(String sendmsg_name) {
		this.sendmsg_name = sendmsg_name;
	}
	public String getSendmsg_email() {
		return sendmsg_email;
	}
	public void setSendmsg_email(String sendmsg_email) {
		this.sendmsg_email = sendmsg_email;
	}
	public String getSendmsg_message() {
		return sendmsg_message;
	}
	public void setSendmsg_message(String sendmsg_message) {
		this.sendmsg_message = sendmsg_message;
	}
	public Date getSendmsg_sdate() {
		return sendmsg_sdate;
	}
	public void setSendmsg_sdate(Date sendmsg_sdate) {
		this.sendmsg_sdate = sendmsg_sdate;
	}
	
	

}
