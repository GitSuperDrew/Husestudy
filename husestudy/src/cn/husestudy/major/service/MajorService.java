package cn.husestudy.major.service;

import java.util.HashSet;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.husestudy.major.dao.MajorDao;
import cn.husestudy.major.vo.Major;
import cn.husestudy.utils.PageBean;

/**
 * 业务层：二级分类的业务层代码；专业
 * @author Drew
 *
 */
@Transactional
public class MajorService {
	
	//注入MajorDao
	private MajorDao majorDao;

	public void setMajorDao(MajorDao majorDao) {
		this.majorDao = majorDao;
	}
	
	/**
	 * 二级分类带有分页的查询操作：
	 * @param page
	 * @return
	 */
	public PageBean<Major> findByPage(Integer page){
		PageBean<Major> pageBean = new PageBean<Major>();
		pageBean.setPage(page);
		
		//设置每页显示记录数：
		int limit = 10;
		pageBean.setLimit(limit);
		
		//设置总记录数：
		int totalCount = majorDao.findCount();
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
		List<Major> list = majorDao.findByPage(begin, limit);
		pageBean.setList(list);
		return pageBean;
	}
	
	/**
	 * 业务层：保存专业信息的操作；
	 * @param major
	 */
	public void save(Major major){
		majorDao.save(major);
	}
	
	/**
	 * 业务层：删除专业信息的方法；
	 * @param major
	 */
	public void delete(Major major){
		majorDao.delete(major);
	}
	
	/**
	 * 业务层：修改专业信息；
	 * @param major
	 */
	public void update(Major major){
		majorDao.update(major);
	}
	
	/**
	 * 业务层：根据专业编号修改专业信息
	 * @param mid
	 * @return
	 */
	public Major findByMid(Integer mid){
		return majorDao.findByMid(mid);
	}
	//根据cid，查询出所有的专业的具体信息：
	public HashSet<Major> findAllMajorByCid(Integer cid){
		return majorDao.findAllMajorByCid(cid);
	}
	//根据cid，查询出所有专业的mid:
	public List<Integer> findAllMidByCid(Integer cid){
		return majorDao.findAllMidByCid(cid);
	}
	/**
	 * 业务层：查询所有专业（无分页）
	 * @return
	 */
	public List<Major> findAll(){
		return majorDao.findAll();
	}
	          
}
