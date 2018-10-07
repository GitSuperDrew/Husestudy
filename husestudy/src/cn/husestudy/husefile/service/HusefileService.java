package cn.husestudy.husefile.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.husestudy.husefile.dao.HusefileDao;
import cn.husestudy.husefile.vo.Husefile;
import cn.husestudy.utils.PageBean;

/**
 * 业务层：处理文件的方法
 * @author Drew
 *
 */
@Transactional
public class HusefileService {
    //注入FileDao
	private HusefileDao husefileDao;

	public HusefileDao getHusefileDao() {
		return husefileDao;
	}

	public void setHusefileDao(HusefileDao husefileDao) {
		this.husefileDao = husefileDao;
	}

	/**
	 * 保存文件
	 * @param file
	 */
	public void save(Husefile file){
		husefileDao.save(file);
	}
	
	/**
	 * 删除文件
	 */
	public void delete(Husefile file){
		husefileDao.delete(file);
	}
	
	/**
	 * 更新文件
	 * @param file
	 */
	public void update(Husefile file){
		husefileDao.update(file);
	}
	
	/**
	 * 根据文件编号修改文件具体信息
	 * @param file_id
	 * @return
	 */
	public Husefile findByFid(String file_id){
		return husefileDao.findByFid(file_id);
	}
	
	/**
	 * 分页显示文件的数目
	 * @param page
	 * @return
	 */
	public PageBean<Husefile> findByPage(Integer page){
		PageBean<Husefile> pageBean = new PageBean<Husefile>();
		pageBean.setPage(page); //设置参数
		int limit = 2; //显示每页数目
		pageBean.setLimit(limit);
		//设置总记录数
		int totalCount = husefileDao.findCount();
		pageBean.setTotalCount(totalCount);
		int totalPage = 0;
		if (totalCount % limit == 0) {
			totalPage = totalCount / limit;
		} else {
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		int begin = (page - 1) * limit;
		List<Husefile> list = husefileDao.findByPage(begin, limit);
		pageBean.setList(list);
		return pageBean;
	}
}
