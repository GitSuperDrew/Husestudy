package cn.husestudy.admin.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.husestudy.admin.vo.Admin;

/**
 * 管理员连接数据库
 * @author Drew
 *
 */
public class AdminDao extends HibernateDaoSupport{
	
	public Admin login(Admin admin){
		String hql = "from Admin where kname = ? and kpassword = ?";
		List<Admin> list = this.getHibernateTemplate().find(hql, admin.getKname(),admin.getKpassword());
		if(list != null && list.size() >0){
			return list.get(0);
		}
		return null;
	}

}
