package cn.husestudy.husefile.vo;

import java.util.Date;

import cn.husestudy.user.vo.User;

/**
 * 学校的文件中心
 * @author Drew
 *
 */
public class Husefile {
	private String file_id; //文件编号
	private String file_name; //文件名字
	private String file_addr; //存放地址
	private Date file_date; //上传时间
	private Date update_time; //更新时间
	private User user; //外键：用户编号
	
	
	public String getFile_id() {
		return file_id;
	}
	public String getFile_name() {
		return file_name;
	}
	public String getFile_addr() {
		return file_addr;
	}
	public Date getFile_date() {
		return file_date;
	}
	public Date getUpdate_time() {
		return update_time;
	}
	public User getUser() {
		return user;
	}
	public void setFile_id(String file_id) {
		this.file_id = file_id;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public void setFile_addr(String file_addr) {
		this.file_addr = file_addr;
	}
	public void setFile_date(Date file_date) {
		this.file_date = file_date;
	}
	public void setUpdate_time(Date update_time) {
		this.update_time = update_time;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
}
