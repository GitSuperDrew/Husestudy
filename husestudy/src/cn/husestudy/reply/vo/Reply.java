package cn.husestudy.reply.vo;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import cn.husestudy.discuss.vo.Discuss;
import cn.husestudy.user.vo.User;
import cn.husestudy.works.vo.Works;

/**
 * 实体类：回复表
 * @author Drew
 *
 */
public class Reply {
	
	private String reply_id;
	private String reply_content;
	private Date reply_time;
	
	//注入三个外键：wid,did,uid的实体类
	private Works works;
	private Discuss discuss;
	private User user;
	private Set<Reply> reply = new HashSet<Reply>();
	
	
	public Set<Reply> getReply() {
		return reply;
	}
	public void setReply(Set<Reply> reply) {
		this.reply = reply;
	}
	public String getReply_id() {
		return reply_id;
	}
	public String getReply_content() {
		return reply_content;
	}
	public Date getReply_time() {
		return reply_time;
	}
	public Works getWorks() {
		return works;
	}
	public Discuss getDiscuss() {
		return discuss;
	}
	public User getUser() {
		return user;
	}
	public void setReply_id(String reply_id) {
		this.reply_id = reply_id;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public void setReply_time(Date reply_time) {
		this.reply_time = reply_time;
	}
	public void setWorks(Works works) {
		this.works = works;
	}
	public void setDiscuss(Discuss discuss) {
		this.discuss = discuss;
	}
	public void setUser(User user) {
		this.user = user;
	}
	

}
