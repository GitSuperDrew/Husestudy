package cn.husestudy.discuss.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.husestudy.discuss.vo.Discuss;
import cn.husestudy.utils.PageHibernateCallback;

/**
 * dao层：评论
 * @author Drew
 *
 */
public class DiscussDao extends HibernateDaoSupport{
	
	/**
	 * dao层：保存评论
	 * @param discuss
	 */
	public void save(Discuss discuss){
		this.getHibernateTemplate().save(discuss);
	}
	
	/**
	 * DAO：根据（用户）的ID，统计出有关此用户写出的评论的数量
	 * @param uid	用户的ID
	 * @return  	评论的总共条数
	 */
	public int findCountUid(Integer uid) {
		String hql = "select count(*) from Discuss d where d.user.uid = ?";
		List<Long> list = this.getHibernateTemplate().find(hql, uid);
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}
	
	/**
	 * DAO：根据（作品）的编号，统计出有关对此作品的评论的数量
	 * @param wid
	 * @return
	 */
	public int findCountWid(Integer wid){
		String hql = "select count(*) from Discuss d where d.works.wid = ?";
		List<Long> list = getHibernateTemplate().find(hql,wid);
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}
	
	/**
	 * 根据作品的ID，查询出wid---count(wid):分组查询
	 * @return wid的list集合
	 */
	public List<Integer> findWidCountByWid(Integer limit){
		String hql = "select d.works.wid from Discuss d group by d.works.wid order by count(d.works.wid) desc";
		List<Integer> list = getSession().createQuery(hql).setFirstResult(0).setMaxResults(limit).list();
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
	}
	
	/**
	 * DAO分页：根据用户的编号，查询出有关此作品的所有评论
	 * @param uid     	用户的编号
	 * @param begin		起始页码
	 * @param limit		每页的数量
	 * @return   List<Discuss>
	 */
	public List<Discuss> findByPageUid(Integer uid,int begin,int limit){
		String hql = "from Discuss d where d.user.uid = ? order by d.ddate desc";
		List<Discuss> list = this.getHibernateTemplate().execute(
				new PageHibernateCallback<Discuss>(hql, new Object[]{uid}, begin, limit));
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
	}
	
	/**
	 * DAO分页：根据作品的编号，查询出有关此作品的所有评论
	 * @param wid
	 * @param begin
	 * @param limit
	 * @return
	 */
	public List<Discuss> findByPageWid(Integer wid,int begin,int limit){
		String hql = "from Discuss d where d.works.wid = ? order by d.ddate desc";
		List<Discuss> list = this.getHibernateTemplate().execute(
				new PageHibernateCallback<Discuss>(hql, new Object[]{wid}, begin, limit));
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
	}
	
	/**
	 * dao层：根据评论的编号查询作品
	 * @param did
	 * @return Discuss
	 */
	public Discuss findByDid(Integer did){
		if(did == null){
			return null;
		}
		return getHibernateTemplate().get(Discuss.class, did);
	}
	
	/**
	 * 根据用户ID，查询所有的评论：
	 * @param uid
	 * @return
	 */
	public List<Discuss> findAllByUid(Integer uid){
		String hql = "from Discuss d where d.user.uid = ?";
		List<Discuss> list = getHibernateTemplate().find(hql, uid);
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
	}
	
	/**
	 * dao层：分页查询评论的方法
	 * @param begin
	 * @param limit
	 * @return List<Discuss>
	 */
	public List<Discuss> findByPage(int begin,int limit){
		String hql = "from Discuss order by ddate desc";
		List<Discuss> list = this.getHibernateTemplate().execute(
				new PageHibernateCallback<Discuss>(hql, null, begin, limit));
		return list;
	}
	
	/**
	 * discussDao层：无分页查询所有的评论
	 * @return  List<Discuss>
	 */
	public List<Discuss> findAll(){
		String hql = "from Discuss order by ddate desc";
		return getHibernateTemplate().find(hql);
	}
	
	/**
	 * dao层：修改评论信息
	 * @param discuss
	 */
	public void update(Discuss discuss){
		getHibernateTemplate().update(discuss);
	}
	
	/**
	 * dao层：统计评论的总数量
	 * @return
	 */
	public int findCount(){
		String hql = "select count(*) from Discuss";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}
	
	/**
	 * 根据评论的ID，找出对应的作品
	 * @param did
	 * @return
	 */
	public Discuss findWorkByDid(Integer did){
		String hql = "from Discuss where did = ?";
		List<Discuss> list = getHibernateTemplate().find(hql, did);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}
	
	/**
	 * 持久层：直接对数据库的单个评论进行点赞增加1
	 * @param did   此评论的ID
	 * @param wid	当前展示作品的ID
	 * @param uid	已经登录用户的ID
	 */
	public void updateGoodByDid(Integer did,Integer wid,Integer uid){
		String hql = "select good from Discuss where did = ? and wid = ? and uid = ?";
		List<Long> list = getHibernateTemplate().find(hql,did,wid,uid);
		if (list != null && list.size() > 0) {
			Discuss discuss = getHibernateTemplate().get(Discuss.class, did);
			discuss.setGood(discuss.getGood() + 1);
			getHibernateTemplate().update(discuss);
		}
	}
	//点赞数量：
	public void goodAdd(Integer did, Integer goodNum){
		getSession().createSQLQuery("update Discuss set good = ? where did = ?").setInteger(0, goodNum).setInteger(1, did).executeUpdate();
	}
	//不支持数量底层控制：
	public void badAdd(Integer did, Integer badNum){
		getSession().createSQLQuery("update Discuss set bad = ? where did = ?").setInteger(0, badNum).setInteger(1, did).executeUpdate();
	}
	
	/**
	 * 持久层：直接对数据库的单个评论进行不支持的增加1
	 * @param did   此评论的ID
	 * @param wid	当前展示作品的ID
	 * @param uid	已经登录用户的ID
	 */
	public void updateBadByDid(Integer did,Integer wid,Integer uid){
		String hql = "select bad from Discuss where did = ? and wid = ? and uid = ?";
		List<Long> list = getHibernateTemplate().find(hql,did,wid,uid);
		if (list != null && list.size() > 0) {
			Discuss discuss = getHibernateTemplate().get(Discuss.class, did);
			discuss.setGood(discuss.getBad() + 1);
			getHibernateTemplate().update(discuss);
		}
	}
	
	/**
	 * dao层：根据评论的ID，统计此作品的点赞数量
	 * @param did
	 * @return
	 */
	public Long findCountGoodByDid(Integer did){
		String hql = "select good from Discuss where did = ?";
		List<Long> list = getHibernateTemplate().find(hql,did);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return 0l;
	}
	
	/**
	 * dao层：根据评论的ID，统计此作品的差评数量：
	 * @param did
	 * @return
	 */
	public Long findCountBadByDid(Integer did){
		String hql = "select bad from Discuss where did = ?";
		List<Long> list = getHibernateTemplate().find(hql,did);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return 0l;
	}
	
	/**
	 * dao层：删除评论
	 * @param discuss
	 */
	public void delete(Discuss discuss){
		getHibernateTemplate().delete(discuss);
	}


}
