package cn.husestudy.major_user.vo;

import cn.husestudy.major.vo.Major;
import cn.husestudy.user.vo.User;

/**
 * 中间表（实体）：专业--用户
 * @author Drew
 *
 */
public class Major_User {
	
	private Integer muid;  //主键：专业---用户编号
	private Major major;   //外键：专业
	private User user;		//外键：用户
	
	
	public Major getMajor() {
		return major;
	}
	public void setMajor(Major major) {
		this.major = major;
	}
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	public Integer getMuid() {
		return muid;
	}
	public void setMuid(Integer muid) {
		this.muid = muid;
	}
	
	
	

}
