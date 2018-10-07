package cn.husestudy.college.vo;

import java.util.HashSet;
import java.util.Set;

import cn.husestudy.major.vo.Major;

/**
 * 学院实体
 * @author Drew
 create table college(
	cid int(11) not null auto_increment,
    cname varchar(255),
	primary key(cid)
)engine=InnoDB,charset=utf8;
 
 */
public class College {
	private Integer cid;
	private String cname;
	private Set<Major> major = new HashSet<Major>();
	
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public Set<Major> getMajor() {
		return major;
	}
	public void setMajor(Set<Major> major) {
		this.major = major;
	}
	
	
	
	

}
