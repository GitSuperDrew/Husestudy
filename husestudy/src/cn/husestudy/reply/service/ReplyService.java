package cn.husestudy.reply.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.husestudy.reply.dao.ReplyDao;
import cn.husestudy.reply.vo.Reply;
import cn.husestudy.utils.PageBean;

/**
 * service回复信息层
 * @author Drew
 *
 */
@Transactional
public class ReplyService {

	//注入ReplyDao
	private ReplyDao replyDao;
	
	public ReplyDao getReplyDao() {
		return replyDao;
	}
	public void setReplyDao(ReplyDao replyDao) {
		this.replyDao = replyDao;
	}

	/**
	 * service：保存回复信息
	 * @param reply
	 */
	public void save(Reply reply){
		replyDao.save(reply);
	}
	/**
	 * service：删除回复信息
	 * @param reply
	 */
	public void delete(Reply reply){
		replyDao.delete(reply);
	}
	/**
	 * service:根据具体回复ID，查询具体回复信息
	 * @param reply_id
	 * @return
	 */
	public Reply findReplyById(String reply_id){
		return replyDao.findReplyById(reply_id);
	}
	/**
	 * 分页显示回复
	 * @param page
	 * @return
	 */
	public PageBean<Reply> findRepliesPage(Integer page){
		PageBean<Reply> pageBean = new PageBean<Reply>();
		pageBean.setPage(page);
		int limit = 2; //显示每页回复的数目
		pageBean.setLimit(limit);
		//设置总记录数
		int totalCount = replyDao.findCount();
		pageBean.setTotalCount(totalCount);
		int totalPage = 0;
		if (totalCount % limit == 0) {
			totalPage = totalCount / limit;
		} else {
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		int begin = (page - 1) * limit;
		List<Reply> list = replyDao.findByPage(begin,limit);
		pageBean.setList(list);
		return pageBean;
	}
	/**
	 * 根据作品编号，查询出所有的回复信息
	 * @param wid 作品编号
	 * @return
	 */
	public List<Reply> findReplyByWid(Integer wid) {
		return replyDao.findReplyByWid(wid);
	}
	/**
	 * 根据作品ID，计算此作品的评论是否有回复：
	 * @return
	 */
	public int countReply(Integer wid){
		return replyDao.countReply(wid);
	}
}
