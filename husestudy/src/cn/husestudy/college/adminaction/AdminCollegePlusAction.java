package cn.husestudy.college.adminaction;

import cn.husestudy.college.service.CollegeService;
import cn.husestudy.college.vo.College;
import cn.husestudy.utils.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AdminCollegePlusAction extends ActionSupport implements ModelDriven<College>{

	private static final long serialVersionUID = 1L;
	//注入模型使用的对象
	private College college = new College();
	
	@Override
	public College getModel() {
		return college;
	}
	
	//注入CollegeService
	private CollegeService collegeService;
	
	public CollegeService getCollegeService() {
		return collegeService;
	}
	public void setCollegeService(CollegeService collegeService) {
		this.collegeService = collegeService;
	}

	// 接收page参数
	private Integer page;
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getPage() {
		return page;
	}


	/**
	 * 
	 * 分页：查询所有的学院
	 * @return  "findAllByPage"
	 */
	public String findAllByPage(){
		PageBean<College> pageBean = collegeService.findByPage(page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findAllByPage";
	}
	
	
}
