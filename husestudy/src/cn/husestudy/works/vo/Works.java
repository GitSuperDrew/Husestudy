package cn.husestudy.works.vo;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.struts2.ServletActionContext;

import cn.husestudy.discuss.vo.Discuss;
import cn.husestudy.git.vo.Git;
import cn.husestudy.reply.vo.Reply;
import cn.husestudy.user.vo.User;

/**
 * 实体类：作品表
 * @author Drew
 create table works(
	wid int(11) not null auto_increment,
    wname varchar(255) not null,
    wcontent text,
    wimage varchar(255),
    wvedio varchar(255),
    wdate datetime,
    uid int(11),
    primary key(wid),
    key uid (uid),
    constraint works_ibfk_1 foreign key(uid) references user(uid)
)engine=InnoDB,charset=utf8;
 */

public class Works {
	
	private Integer wid;	//作品的编号
	private String wname;    //作品的名字
	private String wcontent; //作品的内容
	private String wimage;  //上传的图片的存储地址
	private String wvedio;  //上传的视频的存储地址
	private Date wdate;		//作品上传时间
	
	private User user;     //外键：用户编号
	
	Set<Discuss> discuss = new HashSet<Discuss>();
	Set<Git> git = new HashSet<Git>();
	Set<Reply> reply = new HashSet<Reply>();
	
	public Set<Reply> getReply() {
		return reply;
	}
	public void setReply(Set<Reply> reply) {
		this.reply = reply;
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
	
	public Integer getWid() {
		return wid;
	}
	public void setWid(Integer wid) {
		this.wid = wid;
	}
	public String getWname() {
		return wname;
	}
	public void setWname(String wname) {
		this.wname = wname;
	}
	public String getWcontent() {
		return wcontent;
	}
	public void setWcontent(String wcontent) {
		this.wcontent = wcontent;
	}
	
	public Date getWdate() {
		return wdate;
	}
	public void setWdate(Date date) {
		this.wdate = date;
	}
	public String getWimage() {
		return wimage;
	}
	public void setWimage(String wimage) {
		this.wimage = wimage;
	}
	public String getWvedio() {
		return wvedio;
	}
	public void setWvedio(String wvedio) {
		this.wvedio = wvedio;
	}
	
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
	

}
