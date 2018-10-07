package cn.husestudy.sendmsg.vo;

/**
 * 创建网站服务的工作时间：
 * @author Drew
 *
 */
public class Contact_Info {
	
	private Integer infoId;  	//ID
	private String addr;		//粗略地址
	private String address;		//详细地址
	private String school;		//学校
	private String email;		//联系邮箱
	private String emailwebsite;//邮箱登录网址
	private String phone;		//联系电话
	private String whour;		//工作时间
	private String weekend;		//休息日
	
	
	
	public Integer getInfoId() {
		return infoId;
	}
	public String getAddr() {
		return addr;
	}
	public String getAddress() {
		return address;
	}
	public String getSchool() {
		return school;
	}
	public String getEmail() {
		return email;
	}
	public String getEmailwebsite() {
		return emailwebsite;
	}
	public String getPhone() {
		return phone;
	}
	public String getWhour() {
		return whour;
	}
	public String getWeekend() {
		return weekend;
	}
	public void setInfoId(Integer infoId) {
		this.infoId = infoId;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setEmailwebsite(String emailwebsite) {
		this.emailwebsite = emailwebsite;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setWhour(String whour) {
		this.whour = whour;
	}
	public void setWeekend(String weekend) {
		this.weekend = weekend;
	}
	
	
	
	
}
