package cn.husestudy.major.adminaction;

import java.util.List;

import cn.husestudy.college.service.CollegeService;
import cn.husestudy.college.vo.College;
import cn.husestudy.major.service.MajorService;
import cn.husestudy.major.vo.Major;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AdminMajorAction extends ActionSupport implements ModelDriven<Major>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//模型驱动使用的对象：
	private Major major = new Major();
	//接受page参数：
	private Integer page;
	//注入二级service：
	private MajorService majorService;
	//注入一级service：
	private CollegeService collegeService;
	
	
	public void setMajor(Major major) {
		this.major = major;
	}
	public Major getMajor() {
		return major;
	}


	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getPage() {
		return page;
	}
	public MajorService getMajorService() {
		return majorService;
	}
	public CollegeService getCollegeService() {
		return collegeService;
	}
	public void setMajorService(MajorService majorService) {
		this.majorService = majorService;
	}

	public void setCollegeService(CollegeService collegeService) {
		this.collegeService = collegeService;
	}

	@Override
	public Major getModel() {
		return major;
	}
	
	/**
	 * 带有分页的查询所有分页分类的操作：
	 * @return 返回一个专业集合
	 */
	/*public String findAll(){
		//调用service进行查询：
		PageBean<Major> pageBean = majorService.findByPage(page);
		//将pageBean的数据存入到数值栈中：
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findAll";
	}*/
	
	public String findAll(){
		List<Major> cList = majorService.findAll();
		ActionContext.getContext().getValueStack().set("cList", cList);
		return "findAll";
	}
	
	
	
	/**
	 * 跳转到添加页面的方法：
	 * @return
	 */
	public String addPage(){
		//查询所有学院colleges分类：
		List<College> cList = collegeService.findAll();
		//将集合存入到值栈中：
		ActionContext.getContext().getValueStack().set("cList", cList);
		return "addPage";   //页面跳转
	}
	
	/**
	 * 添加二级分类：专业
	 * @return
	 */
	public String save(){
		majorService.save(major);
		return "saveSuccess";
	}
	
	/**
	 * 删除二级分类：
	 * @return
	 */
	public String delete(){
		majorService.delete(major);
		return "deleteSuccess";
	}
	
	/**
	 * 编辑二级分类的方法：编辑专业信息
	 * @return
	 */
	public String edit(){
		//根据专业的编号mid：
		major = majorService.findByMid(major.getMid());
		//查询所有的一级分类（学院）:
		List<College> cList = collegeService.findAll();
		//将集合存入到值栈中：
		ActionContext.getContext().getValueStack().set("cList", cList);
		//实现页面跳转：
		return "editSuccess";
	}
	
	/**
	 * 修改专业信息（二级分类）
	 * @return
	 */
	public String update(){
		majorService.update(major);
		return "updateSuccess";
	}

}
