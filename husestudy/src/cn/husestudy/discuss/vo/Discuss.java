package cn.husestudy.discuss.vo;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import cn.husestudy.reply.vo.Reply;
import cn.husestudy.user.vo.User;
import cn.husestudy.works.vo.Works;
/**
 * 评论实体类
 * @author Drew
 *
 */
public class Discuss {
	
	private Integer did;
	private String dcontent;
	private Date ddate;
	private Long good;
	private Long bad;
	
	
	private Works works;
	private User user;
	
	
	private Set<Discuss> discuss=new HashSet<Discuss>();
	private Set<Reply> reply = new HashSet<Reply>();
	
	
	public Set<Reply> getReply() {
		return reply;
	}
	public void setReply(Set<Reply> reply) {
		this.reply = reply;
	}
	public Set<Discuss> getDiscuss() {
		return discuss;
	}
	public void setDiscuss(Set<Discuss> discuss) {
		this.discuss = discuss;
	}
	public void setDid(Integer did) {
		this.did = did;
	}
	public void setDcontent(String dcontent) {
		this.dcontent = dcontent;
	}
	public void setDdate(Date ddate) {
		this.ddate = ddate;
	}
	public void setGood(Long good) {
		this.good = good;
	}
	public void setBad(Long bad) {
		this.bad = bad;
	}
	public void setWorks(Works works) {
		this.works = works;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Integer getDid() {
		return did;
	}
	public String getDcontent() {
		return dcontent;
	}
	public Date getDdate() {
		return ddate;
	}
	public Long getGood() {
		return good;
	}
	public Long getBad() {
		return bad;
	}
	public Works getWorks() {
		return works;
	}
	public User getUser() {
		return user;
	}
	
	

}
