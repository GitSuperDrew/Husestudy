package cn.husestudy.motto.vo;

import java.util.Date;


/**
 * 实体类：格言
 * @author Drew
 *
 */
public class Motto {
	
	private Integer motto_id;		//格言ID
	private String motto_author;	//格言作者
	private String motto_content;	//格言内容
	private String motto_message;	//格言信条
	private Date motto_time;		//格言上传时间
	
	
	
	public Integer getMotto_id() {
		return motto_id;
	}
	public String getMotto_author() {
		return motto_author;
	}
	public String getMotto_content() {
		return motto_content;
	}
	public String getMotto_message() {
		return motto_message;
	}
	public Date getMotto_time() {
		return motto_time;
	}
	public void setMotto_id(Integer motto_id) {
		this.motto_id = motto_id;
	}
	public void setMotto_author(String motto_author) {
		this.motto_author = motto_author;
	}
	public void setMotto_content(String motto_content) {
		this.motto_content = motto_content;
	}
	public void setMotto_message(String motto_message) {
		this.motto_message = motto_message;
	}
	public void setMotto_time(Date motto_time) {
		this.motto_time = motto_time;
	}
	
	

}
