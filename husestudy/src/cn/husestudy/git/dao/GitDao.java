package cn.husestudy.git.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.husestudy.git.vo.Git;
import cn.husestudy.utils.PageHibernateCallback;

/**
 * dao层：操作数据库
 * @author Drew
 *
 */
public class GitDao extends HibernateDaoSupport{
	
	/**
	 * dao层：保存收藏
	 * @param git
	 */
	public void save(Git git){
		this.getHibernateTemplate().save(git);
	}
	
	/**
	 * dao层：删除收藏
	 * @param git
	 */
	public void delete(Git git){
		this.getHibernateTemplate().delete(git);
	}
	
	
	/**
	 * dao层：分页查询收藏---统计个数
	 * @param uid
	 * @return
	 */
	public int findCountByUid(Integer uid){
		String hql = "select count(*) from Git g where g.user.uid = ?";
		List<Long> list = this.getHibernateTemplate().find(hql,uid);
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}
	
	/**
	 * dao层：查询收藏---分页查询数据
	 * @param uid
	 * @param begin
	 * @param limit
	 * @return
	 */
	public List<Git> findPageByUid(Integer uid, int begin, int limit){
		String hql = "from Git g where g.user.uid = ? order by g.gdate desc";
		List<Git> list = this.getHibernateTemplate().execute(
				new PageHibernateCallback<Git>(hql, new Object[]{uid}, begin, limit));
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
	}
	
	/**
	 * dao层：根据收藏编号查询收藏信息
	 * @param gid
	 * @return
	 */
	public Git findByGid(Integer gid){
		return this.getHibernateTemplate().get(Git.class, gid);		
	}
	
	/**
	 * dao层：统计收藏个数
	 * @return
	 */
	public int findCount(){
		String hql = "select count(*) from Git";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}
	
	/**
	 * dao层：分页查询收藏
	 * @param begin
	 * @param limit
	 * @return
	 */
	public List<Git> findByPage(int begin, int limit){
		String hql = "from Git order by gdate desc";
		List<Git> list = this.getHibernateTemplate().execute(
				new PageHibernateCallback<Git>(hql, null, begin, limit));
		return list;
	}

	/**
	 * 无分页：查找所有的收藏
	 * @return
	 */
	public List<Git> findAll() {
		String hql = "from Git";
		return getHibernateTemplate().find(hql);
	}
	

}
