package cn.husestudy.college.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.husestudy.college.vo.College;
import cn.husestudy.utils.PageHibernateCallback;

/**
 * 一级分类（学院）的持久层对象
 * @author Drew
 *
 */
public class CollegeDao extends HibernateDaoSupport{
	
	/**
	 * dao层的查询所有的学院
	 * @return
	 */
	public List<College> findAll() {
		String hql = "from College order by cid desc";
		List<College> list = getHibernateTemplate().find(hql);
		return list;
	}
	
	/**
	 * 统计后台学院数量：
	 * @return
	 */
	public int findCount() {
		String hql = "select count(*) from College";
		@SuppressWarnings("unchecked")
		List<Long> list = getHibernateTemplate().find(hql);
		if(list != null && list.size() > 0){
			return list.get(0).intValue();
		}
		return 0;
	}
	
	/**
	 * 统计学院数量
	 * @param begin
	 * @param limit
	 * @return
	 */
	public List<College> findByPage(int begin, int limit) {
		String hql = "from College";
		List<College> list =  getHibernateTemplate().execute(new PageHibernateCallback<College>(hql, null, begin, limit));
		if(list != null && list.size() > 0){
			return list;
		}
		return null;
	}
	
	
	/**
	 * dao中保存学院的方法：
	 * @param college
	 */
	public void save(College college){
		getHibernateTemplate().save(college);
	}
	
	/**
	 * dao中根据学院id查询一级分类：
	 * @param cid
	 * @return
	 */
	public College findByCid(Integer cid){
		return getHibernateTemplate().get(College.class, cid);
	}
	
	/**
	 * dao中删除学院（一级分类）
	 * @param college
	 */
	public void delete(College college){
		getHibernateTemplate().delete(college);
	}
	
	/**
	 * dao中修改学院信息（一级分类）
	 * @param college
	 */
	public void update(College college){
		getHibernateTemplate().update(college);
	}

	public List<Integer> findAllCid() {
		List<Integer> list = getSession().createSQLQuery("select cid from College").list();
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
	}

}
