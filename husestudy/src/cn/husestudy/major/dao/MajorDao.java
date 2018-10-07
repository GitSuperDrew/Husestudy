package cn.husestudy.major.dao;

import java.util.HashSet;
import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.husestudy.college.vo.College;
import cn.husestudy.major.vo.Major;
import cn.husestudy.utils.PageHibernateCallback;

/**
 * 专业（二级分类的dao层的代码）
 * @author Drew
 *
 */
public class MajorDao extends HibernateDaoSupport{

	/**
	 * dao中统计专业总数的方法：
	 * @return 
	 */
	public int findCount(){
		String hql = "select count(*) from Major";   //注意：Major是一个实体类，非数据库中的表明
		List<Long> list = getHibernateTemplate().find(hql);
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}		
		return 0;
	}
	
	/**
	 * dao中分页查询的方法
	 * @param begin
	 * @param limit
	 * @return
	 */
	public List<Major> findByPage(int begin, int limit){
		String hql = "from Major";
		List<Major> list = getHibernateTemplate().execute(
				new PageHibernateCallback<Major>(hql, null, begin, limit));
		return list;
	}
	
	/**
	 * dao中保存专业信息的方法：
	 * @param major
	 */
	public void save(Major major){
		getHibernateTemplate().save(major);
	}
	
	/**
	 * dao层--删除专业信息的方法：
	 * @param major
	 */
	public void delete(Major major){
		getHibernateTemplate().delete(major);
	}
	
	/**
	 * dao层中根据mid查询专业的方法：
	 * @param mid
	 * @return
	 */
	public Major findByMid(Integer mid){
		return getHibernateTemplate().get(Major.class, mid);
	}
	
	//根据cid查询属于此学院的专业：
	public HashSet<Major> findAllMajorByCid(Integer cid){
		String hql = "from Major m where m.college.cid = ?";
		List<Major> list = getHibernateTemplate().find(hql, cid);
		HashSet<Major> set = new HashSet<Major>(list);
		if (set != null && set.size() > 0) {
			return set;
		}
		return null;
	}
	/**
	 * 根据学院ID，查询出属于此学院的所有专业ID
	 * @param cid
	 * @return
	 */
	public List<Integer> findAllMidByCid(Integer cid){
		String hql = "select m.mid from Major m where m.cid = ?";
		List<Integer> list = getSession().createSQLQuery(hql).setParameter(0, cid).list();
		System.out.println(list.size());
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
	}
	
	/**
	 * dao层中修改专业的方法：
	 * @param major
	 */
	public void update(Major major){
		getHibernateTemplate().update(major);
	}
	
	/**
	 * dao中的查询所有专业的方法：
	 * @return
	 */
	public List<Major> findAll(){
		String hql = "from Major";
		List<Major> list = getHibernateTemplate().find(hql);
		return list;
	}

}
