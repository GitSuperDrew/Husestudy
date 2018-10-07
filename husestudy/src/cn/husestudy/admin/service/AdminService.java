package cn.husestudy.admin.service;

import org.springframework.transaction.annotation.Transactional;

import cn.husestudy.admin.dao.AdminDao;
import cn.husestudy.admin.vo.Admin;

@Transactional
public class AdminService {
	private AdminDao adminDao;

	public AdminDao getAdminDao() {
		return adminDao;
	}

	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}
	
	
	public Admin login(Admin admin){
		return adminDao.login(admin);
	}
	

}
