package cn.husestudy.git.service;

import java.util.List;

import cn.husestudy.git.dao.GitDao;
import cn.husestudy.git.vo.Git;
import cn.husestudy.utils.PageBean;

/**
 * 业务层：处理收藏表Git的方法
 * @author Drew
 *
 */
public class GitService {
	
	//注入GitDao
	private GitDao gitDao;

	public void setGitDao(GitDao gitDao) {
		this.gitDao = gitDao;
	}
	
	/**
	 * 业务层：保存收藏信息
	 * @param git 收藏的具体信息
	 */
	public void save(Git git){
		this.gitDao.save(git);
	}
	
	/**
	 * 业务层：删除收藏信息
	 * @param git 收藏编号
	 */
	public void delete(Git git){
		this.gitDao.delete(git);
	}
	
	/**
	 * 业务层：根据收藏编号查询收藏信息
	 * @param gid 收藏编号
	 * @return 此收藏编号的具体信息
	 */
	public Git findByGid(Integer gid){
		return gitDao.findByGid(gid);
	}
	
	/**
	 * 分页显示：根据用户的ID查询用户的收藏信息：
	 * @param uid
	 * @param page
	 * @return
	 */
	public PageBean<Git> findByUid(Integer uid, Integer page){
		PageBean<Git> pageBean = new PageBean<Git>();
		//设置当前页数：
		pageBean.setPage(page);
		//设置每页显示记录数：
		int limit = 20;
		pageBean.setLimit(limit);
		//设置总记录数：
		int totalCount = 0;
		totalCount = gitDao.findCountByUid(uid);
		//设置总页数：
		int totalPage = 0;
		if (totalCount % limit == 0) {
			totalPage = totalCount / limit;
		}else {
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		//设置每页显示数据的集合：
		int begin = (page - 1) * limit;
		List<Git> list = gitDao.findPageByUid(uid, begin, limit);
		pageBean.setList(list);
		return pageBean;
	}
	
	/**
	 * 业务层：分页查询所有收藏信息
	 * @param page
	 * @return
	 */
	public PageBean<Git> findByPage(Integer page){
		PageBean<Git> pageBean = new PageBean<Git>();
		//设置参数
		pageBean.setPage(page);
		//设置每页显示的记录数
		int limit = 20; 
		pageBean.setLimit(limit);
		//设置总记录数
		int totalCount = gitDao.findCount();
		pageBean.setTotalCount(totalCount);
		int totalPage = 0;
		if (totalCount % limit == 0) {
			totalPage = totalCount / limit;
		}else {
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		int begin = (page - 1) * limit;
		List<Git> list = gitDao.findByPage(begin, limit);
		pageBean.setList(list);
		return pageBean;
	}
	
	/**
	 * 业务层---无分页：查询所有的收藏
	 * @return
	 */
	public List<Git> findAll(){
		return gitDao.findAll();
	}
	
	
	
	/**
	 * 分页：查询所有收藏
	 * @param page
	 * @return
	 */
	public PageBean<Git> findAll(Integer page){
		PageBean<Git> pageBean = new PageBean<Git>();
		pageBean.setPage(page);
		
		int limit = 10;
		pageBean.setLimit(limit);
		
		int totalCount = gitDao.findCount();
		pageBean.setTotalCount(totalCount);
		
		// 设置总页数
		int totalPage = 0;
		if(totalCount % limit == 0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		// 设置每页显示数据集合
		int begin = (page - 1) * limit;
		List<Git> list = gitDao.findByPage(begin, limit);
		pageBean.setList(list);
		return pageBean;
	}
	

}
