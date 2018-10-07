package cn.husestudy.reply.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.husestudy.reply.vo.Reply;
import cn.husestudy.utils.PageHibernateCallback;

public class ReplyDao extends HibernateDaoSupport{
	
	/**
	 * 保存回复信息
	 * @param reply
	 */
	public void save(Reply reply){
		getHibernateTemplate().save(reply);
	}
	
	/**
	 * 删除回复信息
	 * @param reply
	 */
	public void delete(Reply reply){
		getHibernateTemplate().delete(reply);
	}
	/**
	 * 查询出所有的回复
	 * @return
	 */
	public List<Reply> findAll(){
		String hql = "from Reply";
		List<Reply> list = getHibernateTemplate().find(hql);
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
	}
	/**
	 * 分页，查询所有回复信息
	 * @param reply_id 回复ID
	 * @param begin 起始页码
	 * @param limit 查询数量
	 * @return
	 */
	public List<Reply> findPageById(Integer reply_id,int begin,int limit){
		String hql = "from Reply r where r.reply_id = ? order by r.reply_time desc";
		List<Reply> list = getHibernateTemplate().execute(
				new PageHibernateCallback<Reply>(hql, new Object[]{reply_id}, begin, limit));
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
	}
	/**
	 * 根据回复记录ID，查询具体回复信息
	 * @param reply_id 回复编号
	 * @return
	 */
	public Reply findReplyById(String reply_id){
		String hql = "from Reply where reply_id = ?";
		List<Reply> list = getHibernateTemplate().find(hql,reply_id);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}
	/**
	 * 根据作品ID，查询出所有的回复
	 * @param wid 作品编号
	 * @return
	 */
	public List<Reply> findReplyByWid(Integer wid){
		String hql = "from Reply r where r.works.wid = ?";
		List<Reply> list = getHibernateTemplate().find(hql,wid);
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
	}
	/**
	 * 根据作品ID，计算此作品评论的所有的回复数量
	 * @param wid 作品编号
	 * @return int 类型的数值
	 */
	public int countReply(Integer wid){
		String hql = "select count(*) from Reply r where r.works.wid = ?";
		List<Long> list = getHibernateTemplate().find(hql,wid);
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}
	/**
	 * 查询出所有的回复信息数量
	 * @return
	 */
	public int findCount() {
		String hql = "select count(*) from Reply";
		List<Long> list = getHibernateTemplate().find(hql);
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}
	/**
	 * 分页显示回复信息
	 * @param begin
	 * @param limit
	 * @return
	 */
	public List<Reply> findByPage(int begin, int limit) {
		String hql = "from Reply order by reply_time desc";
		List<Reply> list = this.getHibernateTemplate().execute(
				new PageHibernateCallback<Reply>(hql, null, begin, limit));
		return list;
	}

}
