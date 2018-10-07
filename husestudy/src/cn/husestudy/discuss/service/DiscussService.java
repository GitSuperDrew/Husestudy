package cn.husestudy.discuss.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.husestudy.discuss.dao.DiscussDao;
import cn.husestudy.discuss.vo.Discuss;
import cn.husestudy.utils.PageBean;

/**
 * 业务层：处理评论的方法
 * @author Drew
 *
 */
@Transactional
public class DiscussService {
	//注入DiscussDao
	private DiscussDao discussDao;

	public void setDiscussDao(DiscussDao discussDao) {
		this.discussDao = discussDao;
	}
	
	/**
	 * service：保存评论
	 * @param discuss
	 */
	public void save(Discuss discuss){
		discussDao.save(discuss);
	}
	
	/**
	 * service:查询出good的数量
	 * @param did
	 * @return
	 */
	public Long findCountGoodById(Integer did){
		return discussDao.findCountGoodByDid(did);
	}
	
	/**
	 * service：查询书bad数量
	 * @param did
	 * @return
	 */
	public Long findCountBadById(Integer did){
		return discussDao.findCountBadByDid(did);
	}
	
	/**
	 * service:删除评论
	 * @param discuss
	 */
	public void delete(Discuss discuss){
		discussDao.delete(discuss);
	}
	
	/**
	 * service：用户自己修改自己的评论
	 * @param discuss
	 */
	public void update(Discuss discuss){
		discussDao.update(discuss);
	}
	
	/**
	 * service：根据评论编号显示具体评论
	 * @param did
	 * @return
	 */
	public Discuss findByDid(Integer did){
		return discussDao.findByDid(did);
	}
	
	/**
	 * 分页显示：根据作品的ID，查询对应的评论；
	 * @param wid
	 * @param page
	 * @return
	 */
	public PageBean<Discuss> findByPageWid(Integer wid, Integer page){
		PageBean<Discuss> pageBean = new PageBean<Discuss>();
		//设置当前页数：
		pageBean.setPage(page);
		//设置每页显示记录数：
		int limit = 5;
		pageBean.setLimit(limit);
		//设置总记录数：
		int totalCount = 0;
		totalCount = discussDao.findCountWid(wid);
		pageBean.setTotalCount(totalCount);
		//设置总页数：
		int totalPage = 0;
		if (totalCount % limit == 0) {
			totalPage = totalCount / limit;
		}else {
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		//设置每页显示数据的集合：
		int begin = (page-1)*limit;
		List<Discuss> list = discussDao.findByPageWid(wid, begin, limit);
		pageBean.setList(list);
		return pageBean;
	}
	
	/**
	 * 分页显示：根据用户的ID，查询对应的所有评论；
	 * @param uid
	 * @param page
	 * @return
	 */
	public PageBean<Discuss> findByPageUid(Integer uid, Integer page){
		PageBean<Discuss> pageBean = new PageBean<Discuss>();
		//设置当前页数：
		pageBean.setPage(page);
		//设置每页显示记录数：
		int limit = 12;
		pageBean.setLimit(limit);
		//设置总记录数：
		int totalCount = 0;
		totalCount = discussDao.findCountUid(uid);
		pageBean.setTotalCount(totalCount);
		//设置总页数：
		int totalPage = 0;
		if (totalCount % limit == 0) {
			totalPage = totalCount / limit;
		}else {
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		//每页显示的数据集合：
		int begin = (page - 1) * limit;
		List<Discuss> list = discussDao.findByPageUid(uid, begin, limit);
		pageBean.setList(list);
		return pageBean;
	}
	
	/**
	 * 根据用户ID，查询出所有的评论：
	 * @param uid
	 * @return
	 */
	public List<Discuss> findAllByUid(Integer uid){
		return discussDao.findAllByUid(uid);
	}
	
	/**
	 * 业务层：查询所有作品
	 * @param page
	 * @return
	 */
	public PageBean<Discuss> findByPage(Integer page){
		PageBean<Discuss> pageBean = new PageBean<Discuss>();
		pageBean.setPage(page);	//设置参数
		int limit = 10;  //设置每页显示的记录数
		pageBean.setLimit(limit);
		//设置总记录数
		int totalCount = discussDao.findCount();
		pageBean.setTotalCount(totalCount);
		int totalPage = 0;
		if (totalCount % limit == 0) {
			totalPage = totalCount / limit;
		}else {
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		int begin = (page - 1) * limit;
		List<Discuss> list = discussDao.findByPage(begin, limit);
		pageBean.setList(list);
		return pageBean;
	}
	
	/**
	 * 查询出此作品的所有的评论
	 * @param wid	作品的ID
	 * @return
	 */
	public int findCountWid(Integer wid){
		 return discussDao.findCountWid(wid);
		
	}
	//指定取出数据5条：
	public List<Integer> findWidCountByWid(){
		//只取出5条数据
		return discussDao.findWidCountByWid(5);
	}
	
	/**
	 * 根据评论的ID，查询出作品的ID。
	 * @param did
	 * @return
	 */
	public Discuss findWorkByDid(Integer did){
		return discussDao.findWorkByDid(did);
	}
	
	/**
	 * discussService:无分页，查询所有的评论
	 * @return
	 */
	public List<Discuss> findAll(){
		return discussDao.findAll();
	}
	
	//点赞数量SQL控制：
	public void goodAdd(Integer did,Integer goodNum){
		discussDao.goodAdd(did,goodNum);
	}
	
	public void badAdd(Integer did, Integer badNum){
		discussDao.badAdd(did,badNum);
	}
}
