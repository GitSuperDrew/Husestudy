package cn.husestudy.husefile.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.husestudy.husefile.vo.Husefile;
import cn.husestudy.utils.PageHibernateCallback;

public class HusefileDao extends HibernateDaoSupport{
	/**
	 * 保存文件
	 * @param file
	 */
	public void save(Husefile husefile){
		getHibernateTemplate().save(husefile);
	}
	
	/**
	 * 删除文件
	 * @param file
	 */
	public void delete(Husefile husefile){
		getHibernateTemplate().delete(husefile);
	}
	
	/**
	 * 更新文件
	 * @param file
	 */
	public void update(Husefile husefile){
		getHibernateTemplate().update(husefile);
	}
	
	/**
	 * 查询出所有的文件
	 * @return
	 */
	public List<Husefile> findAllFileHusefiles(){
		String hql = "from Husefile";
		List<Husefile> list = getHibernateTemplate().find(hql);
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
	}
	
	/**
	 * 统计文件总数量
	 * @return int类型数目
	 */
	public int findCount(){
		int query = Integer.valueOf(getSession().createQuery("select count(*) from Husefile").uniqueResult().toString());
		return query;
	}
	
	/**
	 * 根据文件编号，查询具体信息
	 * @param file_id
	 * @return
	 */
	public Husefile findByFid(String file_id){
		return getHibernateTemplate().get(Husefile.class, file_id);
	}
	
	/**
	 * 分页查询文件的方法
	 * @param begin
	 * @param limit
	 * @return
	 */
	public List<Husefile> findByPage(int begin,int limit){
		String hql = "from Husefile order by file_date desc";
		List<Husefile> list = this.getHibernateTemplate().execute(
				new PageHibernateCallback<Husefile>(hql, null, begin, limit));
		return list;
	}

}
