package cn.husestudy.user.vo;

import java.util.HashSet;
import java.util.Set;

import cn.husestudy.discuss.vo.Discuss;
import cn.husestudy.git.vo.Git;
import cn.husestudy.husefile.vo.Husefile;
import cn.husestudy.major.vo.Major;
import cn.husestudy.major_user.vo.Major_User;
import cn.husestudy.reply.vo.Reply;
import cn.husestudy.works.vo.Works;

/**
 * 用户实体类
 * @author Drew
 */
public class User {
	private Integer uid;
	private String username;
	private String password;
	private String name;
	private String job;
	private String phone;
	private String email;
	private Integer state;
	private String code;
	
	// 二级分类的外键:使用二级分类的对象.
	private Major major;
	public Major getMajor() {
		return major;
	}
	public void setMajor(Major major) {
		this.major = major;
	}
	
	//多个专业
	private Set<Major_User> major_User = new HashSet<Major_User>();
	public Set<Major_User> getMajor_User() {
		return major_User;
	}
	public void setMajor_User(Set<Major_User> major_User) {
		this.major_User = major_User;
	}

	// 定义一些个实体类，用于存储一些多方数据集合
 	private Set<Works> works = new HashSet<Works>();
 	private Set<Husefile> husefile = new HashSet<Husefile>();
 	private Set<Git> git = new HashSet<Git>();
 	private Set<Discuss> discuss = new HashSet<Discuss>();
 	private Set<Reply> reply = new HashSet<Reply>();
	
 	
 	public Set<Reply> getReply() {
		return reply;
	}
	public void setReply(Set<Reply> reply) {
		this.reply = reply;
	}
	public Set<Works> getWorks() {
		return works;
	}
	public void setWorks(Set<Works> works) {
		this.works = works;
	}
	
	public Set<Husefile> getHusefile() {
		return husefile;
	}
	public void setHusefile(Set<Husefile> husefile) {
		this.husefile = husefile;
	}
	public Set<Git> getGit() {
		return git;
	}
	public void setGit(Set<Git> git) {
		this.git = git;
	}
	public Set<Discuss> getDiscuss() {
		return discuss;
	}
	public void setDiscuss(Set<Discuss> discuss) {
		this.discuss = discuss;
	}
	
	
	
	
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
}
