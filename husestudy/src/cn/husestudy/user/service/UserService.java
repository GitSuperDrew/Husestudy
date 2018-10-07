package cn.husestudy.user.service;

import java.util.HashSet;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.husestudy.user.dao.UserDao;
import cn.husestudy.user.vo.User;
import cn.husestudy.utils.MailUitls;
import cn.husestudy.utils.PageBean;
import cn.husestudy.utils.UUIDUtils;

/**
 * 用户的业务层代码
 * @author Drew
 *
 */
@Transactional
public class UserService {
    //注入UserDao
    private UserDao userDao;

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }
    
    /**
     * 等待开发的一个功能：查找受欢迎的用户。
     * @return
     */
    public List<User> findHot(){
        return userDao.findHot();
    }
    
    /**
     * 等待开发的一个功能：查找最近注册的用户。
     * @return
     */
    public List<User> findNew(){
        return userDao.findNew();
    }
    
    /**
     * 根据用户的编号查找用户的相关信息。
     * @param uid
     * @return
     */
    public User findByUid(Integer uid){
        return userDao.findByUid(uid);
    }
    
    public User findByUsername(String username){
        return userDao.findByUsername(username);
    }
    
    /**
     * 业务层：根据激活码查询用户
     * @param code
     * @return
     */
    public User findByCode(String code){
        return userDao.findByCode(code);
    }
    
    
    public User login(User user){
        return userDao.login(user);
    }
    
    
    /**
     * 分页：根据一级分类（学院）查询用户信息
     * @param cid 学院编号
     * @param page 当前页面
     * @return
     */
    public PageBean<User> findByPageCid(Integer cid,int page){
        PageBean<User> pageBean = new PageBean<User>();
        //设置当前页数：
        pageBean.setPage(page);
        //设置每页显示记录数：
        int limit = 8;
        pageBean.setLimit(limit);
        // 设置总记录数:
        int totalCount = 0;
        totalCount = userDao.findCountCid(cid);
        pageBean.setTotalCount(totalCount);
        // 设置总页数:
        int totalPage = 0;
        // Math.ceil(totalCount / limit);
        if (totalCount % limit == 0) {
            totalPage = totalCount / limit;
        } else {
            totalPage = totalCount / limit + 1;
        }
        pageBean.setTotalPage(totalPage);
        // 每页显示的数据集合:
        // 从哪开始:
        int begin = (page - 1) * limit;
        List<User> list = userDao.findByPageCid(cid, begin, limit);
        pageBean.setList(list);
        return pageBean;
    }
    
    /**
     * 分页：根据二级分类（专业）查询用户信息
     * @param mid 专业编号
     * @param page 当前页面
     * @return
     */
    public PageBean<User> findByPageMid(Integer mid, int page) {
        PageBean<User> pageBean = new PageBean<User>();
        // 设置当前页数:
        pageBean.setPage(page);
        // 设置每页显示记录数:
        int limit = 8;
        pageBean.setLimit(limit);
        // 设置总记录数:
        int totalCount = 0;
        totalCount = userDao.findCountMid(mid);
        pageBean.setTotalCount(totalCount);
        // 设置总页数:
        int totalPage = 0;
        // Math.ceil(totalCount / limit);
        if (totalCount % limit == 0) {
            totalPage = totalCount / limit;
        } else {
            totalPage = totalCount / limit + 1;
        }
        pageBean.setTotalPage(totalPage);
        // 每页显示的数据集合:
        // 从哪开始:
        int begin = (page - 1) * limit;
        List<User> list = userDao.findByPageMid(mid, begin, limit);
        pageBean.setList(list);
        return pageBean;
    }
    
    /**
     * 分页：后台查询所有用户
     * @param page
     * @return
     */
    public PageBean<User> findByPage(Integer page) {
        PageBean<User> pageBean = new PageBean<User>();
        // 设置当前页数:
        pageBean.setPage(page);
        // 设置每页显示记录数:
        int limit = 10;
        pageBean.setLimit(limit);
        // 设置总记录数:
        int totalCount = 0;
        totalCount = userDao.findCount();
        pageBean.setTotalCount(totalCount);
        // 设置总页数:
        int totalPage = 0;
        // Math.ceil(totalCount / limit);
        if (totalCount % limit == 0) {
            totalPage = totalCount / limit;
        } else {
            totalPage = totalCount / limit + 1;
        }
        pageBean.setTotalPage(totalPage);
        // 每页显示的数据集合:
        // 从哪开始:
        int begin = (page - 1) * limit;
        List<User> list = userDao.findByPage(begin, limit);
        pageBean.setList(list);
        return pageBean;
    }
    
    //根据mid，查询出所有属于此专业的用户的具体信息：
    public List<User> findAllUserByMid(Integer mid){
        return userDao.findAllUserByMid(mid);
    }
    //根据mid，查询出所有属于此专业的uid
    public HashSet<Integer> findAllUidByMid(Integer mid){
        return userDao.findAllUidByMid(mid);
    }
    
    /**
     * 无分页：查询所有用户
     * @return
     */
    public List<User> findAll(){
        return userDao.findAll();
    }
    
    /**
     * 业务层：注册用户代码
     * @param user
     */
    public void save(User user){
        //将用户数据存入到数据库：
        user.setState(0); //0：代表用户为激活；1：代表用户已经激活
        String code = UUIDUtils.getUUID() + UUIDUtils.getUUID();
        user.setCode(code);
        userDao.save(user);
        //发送邮件
        MailUitls.sendMail(user.getEmail(), code);
    }
    
    /**
     * 业务层删除用户：
     * @param user
     */
    public void delete(User user){
        userDao.delete(user);
    }
    
    /**
     * 业务层更新用户：
     * @param user
     */
    public void update(User user){
        userDao.update(user);
    }
    
    /**
     * 更新（修改）密码：
     * @param username  用户名
     * @param password  新密码
     */
	public void updatePassword(String username, String password) {
		userDao.updatePassword(username,password);
		
	}

}
