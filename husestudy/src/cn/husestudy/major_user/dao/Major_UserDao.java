package cn.husestudy.major_user.dao;

import java.util.HashSet;
import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.husestudy.major.vo.Major;
import cn.husestudy.major_user.vo.Major_User;
import cn.husestudy.utils.PageHibernateCallback;

/**
 * 专业-用户：中间表
 * @author Drew
 *
 */
public class Major_UserDao extends HibernateDaoSupport{
	
	/**
	 * dao :统计中间表的总数量
	 * @return
	 */
	public int findCount(){
		String hql = "select count(*) from Major_User";
		List<Long> list = getHibernateTemplate().find(hql);
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}
	
	/**
	 * dao:分页查询所有
	 * @param begin
	 * @param limit
	 * @return
	 */
	public List<Major_User>  findByPage(int begin , int limit){
		String hql = "from Major_User";
		List<Major_User> list = getHibernateTemplate().execute(new PageHibernateCallback<Major_User>(hql, null, begin, limit));
		return list;
	}
	
	/**
	 * dao:保存中间表信息
	 * @param major_User
	 */
	public void save(Major_User major_User){
		getHibernateTemplate().save(major_User);
	}
	
	/**
	 * dao:删除中间表信息
	 * @param major_User
	 */
	public void delete(Major_User major_User){
		getHibernateTemplate().delete(major_User);
	}
	
	/**
	 * dao:修改中间表信息
	 * @param major_User
	 */
	public void update(Major_User major_User){
		getHibernateTemplate().update(major_User);
	}
	
	/**
	 * 无分页：查询所有
	 * @return
	 */
	public List<Major_User> findAll(){
		String hql = "from Major_User";
		List<Major_User> list = getHibernateTemplate().find(hql);
		return list;
	}

	/**
	 * 根据中间表的id查询
	 * @param muid
	 * @return
	 */
	public Major_User findByMuid(Integer muid) {
		return getHibernateTemplate().get(Major_User.class, muid);
	}
	
	/**
	 * 根据专业ID，查询出所属的用户：
	 * @param mid
	 * @return
	 */
	public List<Major_User> findAllUidByMid(Major major){
		String hql = "from Major_User mu where mu.major.mid = ?";
		List<Major_User> list = getHibernateTemplate().find(hql, major.getMid());
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
	}
	//根据mid，查询出所有的uid
	public HashSet<Integer> findAllUidByMid(Integer mid){
		String hql = "select mu.user.uid from Major_User mu where mu.major.mid = ?";
		List<Integer> list = getHibernateTemplate().find(hql, mid);
		HashSet<Integer> set = new HashSet<Integer>(list);
		if (set != null && set.size() > 0) {
			return set;
		}
		return null;
	}

}
