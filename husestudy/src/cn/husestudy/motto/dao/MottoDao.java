package cn.husestudy.motto.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.husestudy.motto.vo.Motto;

/**
 * 持久层：操作格言方法类
 * @author Drew
 *
 */
public class MottoDao extends HibernateDaoSupport{
	
	//注入实体类Motto
	private Motto motto;

	public Motto getMotto() {
		return motto;
	}
	public void setMotto(Motto motto) {
		this.motto = motto;
	}
	
	/**
	 * 保存格言：
	 * @param motto
	 */
	public void save(Motto motto){
		getHibernateTemplate().save(motto);
	}
	
	/**
	 * 删除格言：
	 * @param motto
	 */
	public void delete(Motto motto){
		getHibernateTemplate().delete(motto);
	}
	
	/**
	 * 修改格言：
	 */
	public void update(Motto motto){
		getHibernateTemplate().update(motto);
	}
	
	/**
	 * 查询所有的格言：
	 * @return 格言list
	 */
	public List<Motto> findAll(){
		String hql = "from Motto";
		List<Motto> list = getHibernateTemplate().find(hql);
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
	}
	
	/**
	 * 获取任意的一个格言显示到首页上
	 * @return  motto
	 */
	public Motto getAnyMotto(){
		String hql = "from Motto order by rand()";
		//创建查询对象：
		Query query = getSession().createQuery(hql);
		//对查询语句设置起始行和最大查询行数：
		query.setFirstResult(0);
		query.setMaxResults(1);
		//返回前一条数据：
		return (Motto) query.list().get(0);
	}
	
	/**
	 * 根据格言ID查询出具体的信息：②
	 * @param motto_id  格言的ID
	 * @return  一条具体的格言信息
	 */
	public Motto findByMottoId(Integer motto_id){
		return this.getHibernateTemplate().get(Motto.class,motto_id);
	}
	
	/**
	 * 统计格言的总数量
	 * @return  int类型的数据
	 */
	public int findCount(){
		String hql = "select count(*) from Motto";
		List<Long> list = getHibernateTemplate().find(hql);
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}
	
	/**
	 * 获取所有的格言的ID，用于action生成随机的一个ID
	 * @return  list<Integer>
	 */
	public List<Integer> findAllMid(){
		String hql = "select motto_id from Motto";
		List<Integer> list = getHibernateTemplate().find(hql);
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
	}

}
