package cn.husestudy.major_user.service;

import java.util.HashSet;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.husestudy.major.vo.Major;
import cn.husestudy.major_user.dao.Major_UserDao;
import cn.husestudy.major_user.vo.Major_User;
import cn.husestudy.utils.PageBean;


/**
 * 业务层：中间表
 * @author Drew
 *
 */
@Transactional
public class Major_UserService {
	
	//注入Major_UserDao
	private Major_UserDao major_UserDao;

	public Major_UserDao getMajor_UserDao() {
		return major_UserDao;
	}

	public void setMajor_UserDao(Major_UserDao major_UserDao) {
		this.major_UserDao = major_UserDao;
	}
	
	/**
	 * 分页:查询操作
	 * @param page
	 * @return  pageBean(major_User)
	 */
	public PageBean<Major_User> findByPage(Integer page){
		PageBean<Major_User> pageBean = new PageBean<Major_User>();
		pageBean.setPage(page);
		
		//设置每页显示记录数：
		int limit = 10;
		pageBean.setLimit(limit);
		
		//设置总记录数：
		int totalCount = major_UserDao.findCount();
		pageBean.setTotalCount(totalCount);
		
		//设置总页数：
		int totalPage = 0;
		if (totalCount % limit == 0) {
			totalPage = totalCount /limit;
		}else {
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		//设置页面显示数据的集合：
		int begin = (page - 1) * limit;
		List<Major_User> list = major_UserDao.findByPage(begin, limit);
		pageBean.setList(list);
		return pageBean;
	}
	
	/**
	 * 业务层：保存
	 * @param major_User
	 */
	public void save(Major_User major_User){
		major_UserDao.save(major_User);
	}
	
	/**
	 * 业务层：删除
	 * @param major_User
	 */
	public void delete(Major_User major_User){
		major_UserDao.delete(major_User);
	}
	
	/**
	 * 业务层：修改
	 * @param major_User
	 */
	public void update(Major_User major_User){
		major_UserDao.update(major_User);
	}
	
	/**
	 * 业务层：根据中间表编号修改具体信息
	 * @param muid
	 * @return  Major_User
	 */
	public Major_User findByMuid(Integer muid){
		return major_UserDao.findByMuid(muid);
	}
	//根据mid,查询出所有的uid:
	public List<Major_User> findAllUidByMid(Major major){
		return major_UserDao.findAllUidByMid(major);
	}
	//根据mid，查询出所有的uid:
	public HashSet<Integer> findAllUidByMid(Integer mid){
		return major_UserDao.findAllUidByMid(mid);
	}
	
	/**
	 * 无分页-业务层：查询所有信息
	 * @return
	 */
	public List<Major_User> findAll(){
		return major_UserDao.findAll();
	}

}
