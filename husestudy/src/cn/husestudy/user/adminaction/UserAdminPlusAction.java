package cn.husestudy.user.adminaction;

import java.util.List;

import cn.husestudy.college.service.CollegeService;
import cn.husestudy.major.service.MajorService;
import cn.husestudy.major.vo.Major;
import cn.husestudy.user.service.UserService;
import cn.husestudy.user.vo.User;
import cn.husestudy.utils.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserAdminPlusAction extends ActionSupport implements ModelDriven<User>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//用于接受数据的模型驱动：
	private User user = new User();
	
	@Override
	public User getModel() {
		return user;
	}

	private Integer page;
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	
	//注入用户用户的service
	private UserService userService;
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	//注入一级分类（学院）的service
	private CollegeService collegeService;
	
	public void setCollegeService(CollegeService collegeService) {
		this.collegeService = collegeService;
	}
	public CollegeService getCollegeService() {
		return collegeService;
	}
	
	
	//注入二级分类（专业）的service
	private MajorService majorService;
	public void setMajorService(MajorService majorService) {
		this.majorService = majorService;
	}
	
	//接受一级分类（学院）cid:
	private Integer cid;
	//接受二级分类ID（专业）
	private Integer mid;
	
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public Integer getMid() {
		return mid;
	}
	public void setMid(Integer mid) {
		this.mid = mid;
	}

	/**
	 * 后台查找所有用户，带分页
	 * @return "findAllByPage"
	 */
	public String findAllByPage(){
		PageBean<User> pageBean = userService.findByPage(page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findAllByPage";
	}
	
	public String findAll(){
		List<User> uList = userService.findAll();
		ActionContext.getContext().getValueStack().set("uList",uList );
		return "findAll";
	}
	
	/**
	 * 跳转到添加的页面上的方法
	 * @return  "addPageSuccess"
	 */
	public String addPage(){
		//查询所有的二级分类（专业）：
		List<Major> mList = majorService.findAll();
		//将专业的数据显示到网页上
		ActionContext.getContext().getValueStack().set("mList", mList);
		//页面跳转：
		return "addPageSuccess";
	}
	
	/**
	 * 将用户信息保存到数据库中
	 * @return  "saveSuccess"
	 */
	public String save(){
		//将提交的数据添加到数据库中：
		userService.save(user);
		//跳转到保存成功的页面显示list.jsp
		return "saveSuccess";
	}
	
	/**
	 * 后台用户的编辑
	 * @return "editSuccess"
	 */
	public String edit(){
		user = userService.findByUid(user.getUid());
		List<Major> mList = majorService.findAll();
		ActionContext.getContext().getValueStack().set("mList", mList);
		//跳转到编辑页面：
		return "editSuccess";
	}
	
	
	/**
	 * 后台用户的修改
	 * @return "updateSuccess"
	 */
	public String update(){
		userService.update(user);
		return "updateSuccess";
	}
	
	
	/**
	 * 后台用户删除
	 * @return deleteSuccess
	 */
	public String delete(){
		User exitUser = userService.findByUid(user.getUid());
		userService.delete(exitUser);
		return "deleteSuccess";
	}
	
	//========================以下方法可能会使用到=============================
	
	
		/**
		 * 根据用户的ID进行查询用户：执行方法：
		 * @return findByUid
		 */
		public String findByUid(){
			user = userService.findByUid(user.getUid());
			return "findByUid";
		}
		
		/**
		 * 根据一级分类（学院）的ID查询用户
		 * @return findByCid
		 */
		public String findByCid(){
			PageBean<User> pageBean = userService.findByPageCid(cid, page);
			//将PageBean存入到值栈中：
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
			return "findByCid";
		}
		
		/**
		 * 根据专业编号查询对应的用户
		 * @return findByMid
		 */
		public String findByMid(){
			PageBean<User> pageBean = userService.findByPageMid(mid, page);
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
			return "findByMid";
		}
	
	
	
}
