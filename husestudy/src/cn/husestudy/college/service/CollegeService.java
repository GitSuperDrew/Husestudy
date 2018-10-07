package cn.husestudy.college.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.husestudy.college.dao.CollegeDao;
import cn.husestudy.college.vo.College;
import cn.husestudy.utils.PageBean;

/**
 * 学院的业务层对象：
 * @author Drew
 *
 */
@Transactional
public class CollegeService {
	
	//注入CollegeDao
	private CollegeDao collegeDao;
	

	public void setCollegeDao(CollegeDao collegeDao) {
		this.collegeDao = collegeDao;
	}
	
	public PageBean<College> findByPage(Integer page){
		PageBean<College> pageBean = new PageBean<College>();
		// 设置当前页数:
		pageBean.setPage(page);
		// 设置每页显示记录数:
		int limit = 10;
		pageBean.setLimit(limit);
		// 设置总记录数:
		int totalCount = 0;
		totalCount = collegeDao.findCount();
		pageBean.setTotalCount(totalCount);
		// 设置总页数:
		int totalPage = 0;
		// Math.ceil(totalCount / limit);
		if (totalCount % limit == 0) {
			totalPage = totalCount / limit;
		} else {
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		// 每页显示的数据集合:
		// 从哪开始:
		int begin = (page - 1) * limit;
		List<College> list = collegeDao.findByPage(begin, limit);
		pageBean.setList(list);
		return pageBean;
	}
	
	
	
	/**
	 * 业务层：查询所有的学院；
	 * @return
	 */
	public List<College> findAll() {
		return collegeDao.findAll();
	}
	
	/**
	 * 业务层：保存学院信息；
	 * @param college
	 */
	public void save(College college){
		collegeDao.save(college);
	}
	
	/**
	 * 业务层：根据学院编号的cid查询学院的信息
	 * @param cid
	 * @return
	 */
	public College findByCid(Integer cid){
		return collegeDao.findByCid(cid);
	}
	
	/**
	 * 业务层：删除学院；
	 * @param college
	 */
	public void delete(College college){
		collegeDao.delete(college);
	}
	
	/**
	 * 业务层：修改学院信息；
	 * @param college
	 */
	public void update(College college){
		collegeDao.update(college);
	}
	
	/**
	 * 业务层：查询所有学院ID
	 * @return 学院ID集合
	 */
	public List<Integer> findAllCid() {
		return collegeDao.findAllCid();
	}

}
