package cn.husestudy.git.vo;

import java.util.Date;

import cn.husestudy.user.vo.User;
import cn.husestudy.works.vo.Works;

/**
 * 收藏表：git
 * @author Drew
 *
 */
public class Git {
	private int gid;
	private Date gdate;
	
	private Works works;
	private User user;
	
	
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	public Date getGdate() {
		return gdate;
	}
	public void setGdate(Date gdate) {
		this.gdate = gdate;
	}
	public Works getWorks() {
		return works;
	}
	public void setWorks(Works works) {
		this.works = works;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
}
