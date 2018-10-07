package cn.husestudy.admin.vo;
/**
 * 管理员实体类
 * @author Drew
 create table admin(
	kid int(11) not null auto_increment,
    kname varchar(255) not null,
    kpassword varchar(25) not null,
    primary key(kid)
 )engine=InnoDB,charset=utf8;
 */
public class Admin {
	private Integer kid;
	private String kname;
	private String kpassword;
	public Integer getKid() {
		return kid;
	}
	public void setKid(Integer kid) {
		this.kid = kid;
	}
	public String getKname() {
		return kname;
	}
	public void setKname(String kname) {
		this.kname = kname;
	}
	public String getKpassword() {
		return kpassword;
	}
	public void setKpassword(String kpassword) {
		this.kpassword = kpassword;
	}
	

}
