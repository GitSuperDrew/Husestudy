package cn.husestudy.user.dao;

import java.util.HashSet;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.husestudy.major.vo.Major;
import cn.husestudy.user.vo.User;
import cn.husestudy.utils.PageHibernateCallback;
import cn.husestudy.works.vo.Works;

/**
 * DAO：用户处理代码
 * @author Drew
 *
 */
public class UserDao extends HibernateDaoSupport{

	private Major major;
	
	public Major getMajor() {
		return major;
	}

	public void setMajor(Major major) {
		this.major = major;
	}

	/**
	 * 查询新注册的用户-------以后扩展的功能！
	 * @return List<User>
	 */
	public List<User> findNew(){
		//使用离线条件查询：
		DetachedCriteria criteria = DetachedCriteria.forClass(User.class);
		//按照日期进行倒序排序:
		criteria.addOrder(Order.desc("udate"));
		//执行查询：
		List<User> list = getHibernateTemplate().findByCriteria(criteria, 0, 10);
		return list;
	}
	
	/**
	 * 查询最受欢迎的用户编号：-------以后扩展的功能！
	 * @return list集合
	 */
	public List<User> findHot(){
		//使用离线条件查询：
		DetachedCriteria criteria = DetachedCriteria.forClass(User.class);
		//查询受欢迎的用户的字段：is_hot = 1;
		criteria.add(Restrictions.eq("is_hot", 1));
		//倒序输出：
		criteria.addOrder(Order.desc("udate"));
		//执行查询：
		List<User> list = getHibernateTemplate().findByCriteria(criteria, 0, 10);
		return list;
	}
	
	/**
	 * 根据用户ID查询用户：
	 */
	public User findByUid(Integer uid){
		return this.getHibernateTemplate().get(User.class,uid);
	}
	
	/**
	 * 按名次查询是否有该用户
	 * @param username 用户名称
	 * @return
	 */
	public User findByUsername(String username){
		String hql = "from User where username = ?";
		List<User> list = getHibernateTemplate().find(hql, username);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}
	
	/**
	 * dao层：查询用户的激活码
	 * @param code
	 * @return
	 */
	public User findByCode(String code){
		String hql = "from User where code = ?";
		List<User> list = getHibernateTemplate().find(hql,code);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}
	
	/**
	 * 用户登录的方法
	 * @param user
	 * @return
	 */
	public User login(User user){
		String hql = "from User where username = ? and password = ? and state = ?";
		List<User> list = this.getHibernateTemplate().find(hql, user.getUsername(),user.getPassword(),1);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}
	
	
	/**
	 * 根据分类ID（学院）查询用户的个数
	 * @param cid
	 * @return
	 */
	public int findCountCid(Integer cid){
		String hql = "selct count(*) from User u where u.major.college.cid";
		List<Long> list = getHibernateTemplate().find(hql,cid);
		if(list != null && list.size() > 0){
			return list.get(0).intValue();
		}
		return 0;
	}
	
	/**
	 * 分页：根据分类ID（学院）查询用户的集合
	 * @param cid 学院编号
	 * @param begin 开始页码
	 * @param limit 条数
	 * @return 用户集合
	 */
	public List<User> findByPageCid(Integer cid, int begin, int limit) {
		String hql = "select u from User u join u.major m join m.college c where c.cid = ?";
		List<User> list = getHibernateTemplate().execute(new PageHibernateCallback<User>(hql, new Object[]{cid}, begin, limit));
		if(list != null && list.size() > 0){
			return list;
		}
		return null;
		
	}
	
	/**
	 * 根据二级分类（专业）查询用户个数
	 * @param mid
	 * @return
	 */
	public int findCountMid(Integer mid) {
		String hql = "select count(*) from User u where u.major.mid = ?";
		List<Long> list = getHibernateTemplate().find(hql, mid);
		if(list != null && list.size() > 0){
			return list.get(0).intValue();
		}
		return 0;
	}
	
	/**
	 * 分页：根据二级分类（专业）查询用户信息
	 * @param mid
	 * @param begin
	 * @param limit
	 * @return
	 */
	public List<User> findByPageMid(Integer mid, int begin, int limit){
		String hql = "select u from User u join u.major m where m.mid = ?";
		List<User> list = getHibernateTemplate().execute(new PageHibernateCallback<User>(hql, new Object[]{mid}, begin, limit));
		if(list != null && list.size() > 0){
			return list;
		}
		return null;
	}
	
	/**
	 * 后台统计用户个数的方法：
	 * @return int类型--数量
	 */
	public int findCount() {
		String hql = "select count(*) from User";
		List<Long> list = getHibernateTemplate().find(hql);
		if(list != null && list.size() > 0){
			return list.get(0).intValue();
		}
		return 0;
	}
	
	/**
	 * 分页：后台查询所有用户的方法
	 * @param begin 
	 * @param limit
	 * @return
	 */
	public List<User> findByPage(int begin, int limit) {
		String hql = "from User";
		List<User> list =  getHibernateTemplate().execute(new PageHibernateCallback<User>(hql, null, begin, limit));
		if(list != null && list.size() > 0){
			return list;
		}
		return null;
	}
	
	/**
	 * 无分页：查询所有用户
	 * @return
	 */
	public List<User> findAll(){
		String hql = "from User";
		List<User> list = getHibernateTemplate().find(hql);
		if (list!=null && list.size() > 0) {
			return list;
		}
		return null;
	}
	
	/**
	 * 根据专业的编号查询用户的ID
	 * @param mid
	 * @return
	 */
	public List<User> findAllUserByMid(Integer mid){
		String hql = "select uid from User u join u.major m where m.mid = ?";
		List<User> list = getHibernateTemplate().find(hql,mid);
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
	}
	//根据mid，查询出所有的uid：
	public HashSet<Integer> findAllUidByMid(Integer mid){
		String hql = "select uid from User u join u.major m where m.mid = ?";
		List<Integer> list = getHibernateTemplate().find(hql,mid);
		HashSet<Integer> set = new HashSet<Integer>(list);
		if (set != null && set.size() > 0) {
			return set;
		}
		return null;
	}
	
	/**
	 * dao中的保存用户：注册用户存入到数据库的代码实现
	 * @param user 用户
	 */
	public void save(User user){
		getHibernateTemplate().save(user);
	}
	/**
	 * dao中删除用户
	 * @param user 用户
	 */
	public void delete(User user){
		getHibernateTemplate().delete(user);
	}
	/**
	 * dao中修改用户信息
	 * @param user 用户
	 */
	public void update(User user){
		getHibernateTemplate().update(user);
	}
    
	/**
	 * dao:修改密码
	 * @param username  用户名
	 * @param password  新密码
	 */
	public void updatePassword(String username, String password) {//注意：此时的user可以首字母小写
		getSession().createSQLQuery("update user set password = ? where username = ?")
		.setParameter(0, password).setParameter(1, username).executeUpdate();
	}
	
	

}
