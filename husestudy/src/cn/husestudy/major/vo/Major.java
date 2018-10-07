package cn.husestudy.major.vo;

import java.util.HashSet;
import java.util.Set;

import cn.husestudy.college.vo.College;
import cn.husestudy.major_user.vo.Major_User;

/**
 * 专业实体类
 * @author Drew
 *
 */
public class Major {
	private Integer mid;
	private String mname;
	
	private College college;
	private Set<Major_User> major_User = new HashSet<Major_User>();
	
	public Set<Major_User> getMajor_User() {
		return major_User;
	}
	public void setMajor_User(Set<Major_User> major_User) {
		this.major_User = major_User;
	}
	
	public Integer getMid() {
		return mid;
	}
	public void setMid(Integer mid) {
		this.mid = mid;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public College getCollege() {
		return college;
	}
	public void setCollege(College college) {
		this.college = college;
	}
	
	

}
