package cn.husestudy.motto.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.husestudy.motto.dao.MottoDao;
import cn.husestudy.motto.vo.Motto;

/**
 * 业务层：格言
 * @author Drew
 *
 */
@Transactional
public class MottoService {
	//注入MottoDao
	private MottoDao mottoDao;

	public MottoDao getMottoDao() {
		return mottoDao;
	}
	public void setMottoDao(MottoDao mottoDao) {
		this.mottoDao = mottoDao;
	}
	
	
	/**
	 * 获取任意的一个格言
	 * @return
	 */
	public Motto getAnyMotto(){
		return mottoDao.getAnyMotto(); 
	}
	
	
	/**
	 * 方法②
	 * @param motto_id
	 * @return
	 */
	public Motto findByMottoId(Integer motto_id){
		return mottoDao.findByMottoId(motto_id);
	}
	
	/**
	 * 查询所有的格言：
	 * @return
	 */
	public List<Motto> findAll(){
		return mottoDao.findAll();
	}
	
	/**
	 * 查询出所有的格言的数量
	 * @return
	 */
	public int findCount(){
		return mottoDao.findCount();
	}
	
	/**
	 * 查询出所有的格言的ID
	 * @return
	 */
	public List<Integer> findAllMid(){
		return mottoDao.findAllMid();
	}
	
	/**
	 * 业务层：随机抽取一条数据
	 * @return
	 */
	public Motto getAnyMottoOne(){
		Integer [] arr = new Integer[findCount()];
		List<Integer> list = findAllMid();
		list.toArray(arr);
		
		Integer index = (int)(Math.random()*arr.length);
		Integer rand = arr[index];
		return findByMottoId(rand);
	}
	
	
	
	/**
	 * 保存格言：service
	 * @param motto
	 */
	public void save(Motto motto){
		mottoDao.save(motto);
	}
	
	/**
	 * 删除格言：service
	 * @param motto
	 */
	public void delete(Motto motto){
		mottoDao.delete(motto);
	}
	
	/**
	 * 更新格言：service
	 * @param motto
	 */
	public void update(Motto motto){
		mottoDao.update(motto);
	}
	
}
