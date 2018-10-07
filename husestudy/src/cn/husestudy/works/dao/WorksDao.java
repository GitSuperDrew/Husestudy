package cn.husestudy.works.dao;

import java.util.HashSet;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.husestudy.user.vo.User;
import cn.husestudy.utils.PageHibernateCallback;
import cn.husestudy.works.vo.Works;

public class WorksDao extends HibernateDaoSupport{
    
    /**
     * dao层的保存作品操作：
     * @param works
     */
    public void save(Works works){
        getHibernateTemplate().save(works);
    }
    
    //测试：使用hibernate中的SQL-Query语句统计作品的总数量：
    public Long countWorks(){
    	Long query = Long.valueOf(getSession().createQuery("select count(*) from Works").uniqueResult().toString());
    	return query;
    }
    
    //更新视频：
    public void addVideo(String wvedio, String currwid){
    	getSession().createSQLQuery("update Works set wvedio= ? where wid = ?")
    	.setString(0,wvedio).setLong(1, Integer.parseInt(currwid)).executeUpdate();
    	//getHibernateTemplate().update(works);
    }
    
    /**
     * dao层：根据用户的ID统计作品个数
     * @param uid
     * @return
     */
    public int findCountByUid(Integer uid) {
        String hql = "select count(*) from Works w where w.user.uid = ?";
        List<Long> list = getHibernateTemplate().find(hql, uid);
        if (list != null && list.size() > 0) {
            return list.get(0).intValue();
        }
        return 0;
    }
    
    /**
     * dao层查询作品----分页查询：查询数据
     * @param uid
     * @param begin
     * @param limit
     * @return
     */
    public List<Works> findPageByUid(Integer uid,int begin,int limit){
        String hql = "from Works w where w.user.uid = ? order by w.wdate desc";
        List<Works> list = this.getHibernateTemplate().execute(
                new PageHibernateCallback<Works>(hql, new Object[]{uid}, begin, limit));
        if (list != null && list.size() > 0) {
            return list;
        }
        return null;
    }
    
    /**
     * dao层：根据用户的ID查询用户的作品（方法一）
     * @param uid 用户的ID
     * @return 作品集合
     */
    public List<Works> findAllWorksByUsername(User user){
        String hql = "from Works w where w.user.username = ? order by w.wdate desc";
        List<Works> list =  getHibernateTemplate().find(hql, user.getUsername());
        if (list != null && list.size() > 0) {
            return list;
        }
        return null;
    }
    
    /**
     * 根据用户ID，查询对应的所有的作品（方法二）
     * @param uid 用户编号
     * @return 作品集合
     */
    public HashSet<Works> findAllWorksByUid(Integer uid){
        String hql = "from Works w where uid = ? order by w.wdate desc";
        List<Works> list = getHibernateTemplate().find(hql, uid);
        HashSet<Works> set = new HashSet<Works>(list);
        if (set != null && set.size() > 0) {
            return set;
        }
        return set;
    }
    
    /**
     * dao层：根据作品的编号，查询作品具体信息。
     * @param wid 作品的编号
     * @return 作品具体信息
     */
    public Works findByWid(Integer wid){
        return getHibernateTemplate().get(Works.class,wid);
    }

    /**
     * 根据作品提交的时间，取出最新的作品。查询出最新的5个作品信息。
     * @param max 最大数量
     * @return 作品集合
     */
    public List<Works> findByWdate(Integer max){
    	String hql = "from Works w order by w.wdate desc";
    	List<Works> query = getSession().createQuery(hql).setFirstResult(0).setMaxResults(max).list();
    	if (query != null && query.size() > 0) {
			return query;
		}
    	return null;
    }
    
    /**
     * 查询出所有作品的ID：
     * @return 作品集合
     */
    public List<Integer> findAllWid(){
    	String hql = "select wid from Works";
    	List<Integer> widList = getHibernateTemplate().find(hql);
    	if (widList != null && widList.size() > 0) {
			return widList;
		}
    	return null;
    }
    
    /**
     * dao层：分页查询作品的方法
     * @param begin
     * @param limit
     * @return
     */
    public List<Works> findByPage(int begin,int limit){
        String hql = "from Works order by wdate desc";
        List<Works> list = this.getHibernateTemplate().execute(
                new PageHibernateCallback<Works>(hql, null, begin, limit));
        return list;
    }
    
    /**
     * 查找到最新的所有作品
     * @return 最新作品集合
     */
    public List<Works> findAll(){
        String hql = "from Works order by wdate desc";
        return getHibernateTemplate().find(hql);
    }
    
    /**
     * 查询出用户最新的6条数据
     * @param uid 用户的编号
     * @param max 最大的数量
     * @return
     */
    public List<Works> findNewSixWorks(Integer uid,Integer max){
    	String sql = "select * from works where uid = ? order by wdate desc";
		List<Works> sixWorksList = getSession().createSQLQuery(sql).setParameter(0, uid).setFirstResult(0).setMaxResults(max).list();
    	if (sixWorksList != null && sixWorksList.size() > 0) {
			return sixWorksList;
		}
    	return null;
    }
    
    /**
     * dao层修改作品信息的方法：
     * @param currworks 当前作品保存
     */
    public void update(Works currworks){
        getHibernateTemplate().update(currworks);
    }
    
    /**
     * dao层：统计作品的总数量
     * @return int类型的数目
     */
    public int findCount(){
        String hql = "select count(*) from Works";
        List<Long> list = this.getHibernateTemplate().find(hql);
        if (list != null && list.size() > 0) {
            return list.get(0).intValue();
        }
        return 0;
    }
    
    /**
     * 删除我的作品
     * @param works 作品
     */
    public void delete(Works works){
        getHibernateTemplate().delete(works);
    }
    


}
