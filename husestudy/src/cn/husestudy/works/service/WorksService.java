package cn.husestudy.works.service;

import java.util.HashSet;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.husestudy.user.vo.User;
import cn.husestudy.utils.PageBean;
import cn.husestudy.works.dao.WorksDao;
import cn.husestudy.works.vo.Works;

/**
 * 业务层：处理作品的方法
 * @author Drew
 *
 */
@Transactional
public class WorksService {
    
    //注入WorksDao
    private WorksDao worksDao;

    public void setWorksDao(WorksDao worksDao) {
        this.worksDao = worksDao;
    }
    
    /**
     * 业务层：保存作品的方法
     * @param works
     */
    public void save(Works works){
        worksDao.save(works);
    }
    
    //测试：使用hibernate中的SQL-Query语句统计作品的总数量：
    public Long countWorks(){
    	return worksDao.countWorks();
    }
    
    /**
     * 添加作品的视频上传
     */
    public void addVideo(String wvedio, String currwid){
    	worksDao.addVideo(wvedio,currwid);
    }
    
    /**
     * 业务层：删除作品的方法
     * @param works
     */
    public void delete(Works works){
        worksDao.delete(works);
    }
    
    /**
     * 业务层：修改用户作品的方法
     * @param currworks
     */
    public void update(Works currworks){
        worksDao.update(currworks);
    }
    
    /**
     * 业务层：根据作品的编号查询作品信息
     * @param wid
     * @return
     */
    public Works findByWid(Integer wid){
        return worksDao.findByWid(wid);
    }
    
    /**
     * 业务层；根据用户ID查询最指定数量的最新的作品
     * @param uid 用户ID
     * @param max 最大数量
     * @return 指定最新作品数量集合
     */
    public List<Works> findNewSixWorks(Integer uid,Integer max){
    	return worksDao.findNewSixWorks(uid, max);
    }
    
    /**
     * 分页显示：根据用户的ID查询用户的作品；
     * @param uid
     * @param page
     * @return
     */
    public PageBean<Works> findByUid(Integer uid, Integer page){
        PageBean<Works> pageBean = new PageBean<Works>();
        //设置当前页数：
        pageBean.setPage(page);
        //设置每页显示记录数：
        int limit = 5;
        pageBean.setLimit(limit);
        //设置总记录数：
        int totalCount = 0;
        totalCount = worksDao.findCountByUid(uid);
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
        List<Works> list = worksDao.findPageByUid(uid, begin, limit);
        pageBean.setList(list);
        return pageBean;
    }
    
    //查询出最新5条的作品信息：
    public List<Works> findByWdate(Integer max){
        return worksDao.findByWdate(max);
    }
    
    //查询出所有的作品的ID：
    public List<Integer> findAllWid(){
    	return worksDao.findAllWid();
    }
    
    /**
     * 业务层：查询所有作品
     * @param page
     * @return
     */
    public PageBean<Works> findByPage(Integer page){
        PageBean<Works> pageBean = new PageBean<Works>();
        pageBean.setPage(page);    //设置参数
        int limit = 10;  //设置每页显示的记录数
        pageBean.setLimit(limit);
        //设置总记录数
        int totalCount = worksDao.findCount();
        pageBean.setTotalCount(totalCount);
        int totalPage = 0;
        if (totalCount % limit == 0) {
            totalPage = totalCount / limit;
        }else {
            totalPage = totalCount / limit + 1;
        }
        pageBean.setTotalPage(totalPage);
        int begin = (page - 1) * limit;
        List<Works> list = worksDao.findByPage(begin, limit);
        pageBean.setList(list);
        return pageBean;
    }
    
    //无分页查询所有的作品：
    public List<Works> findAll(){
        return worksDao.findAll();
    }
    
    
    /**
     * 根据用户的编号查询用户的所有的作品：
     * @param uid
     * @return
     */
    public List<Works> findAllWorksByUsername(User user){
        return worksDao.findAllWorksByUsername(user);
    }
    
    public HashSet<Works> findAllWorksByUid(Integer uid){
        return worksDao.findAllWorksByUid(uid);
    }
    


}
