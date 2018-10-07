package cn.husestudy.college.adminaction;

import java.util.List;

import cn.husestudy.college.service.CollegeService;
import cn.husestudy.college.vo.College;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 后台:学院（一级分类）管理
 * @author Drew
 *
 */
public class AdminCollegeAction extends ActionSupport implements ModelDriven<College>{

	private static final long serialVersionUID = 1L;
	//模型驱动使用的对象：
	private College college = new College();
	
	@Override
	public College getModel() {
		return college;
	}
	
	//注入学院（一级分类）的service
	public CollegeService collegeService;

	public void setCollegeService(CollegeService collegeService) {
		this.collegeService = collegeService;
	}
	
	/**
	 * 查询所有的学院信息；
	 * @return  "findAll"
	 */
	public String findAll(){
		List<College> cList = collegeService.findAll();
		ActionContext.getContext().getValueStack().set("cList", cList);
		return "findAll";
	}
	
	/**
	 * 保存学院信息：
	 * @return "saveSuccess"
	 */
	public String save(){
		//调用service完成保存一级分类（学院）
		collegeService.save(college);
		//进行页面操作跳转：
		return "saveSuccess";
	}
	
	/**
	 * 删除学院（一级分类）
	 * @return  "deleteSuccess"
	 */
	public String delete(){
		// 调用Service完成 一级分类的删除
		// 级联删除一定先查询在删除:
		college = collegeService.findByCid(college.getCid());
		collegeService.delete(college);
		return "deleteSuccess";   //进行页面跳转
	}
	
	/**
	 * 编辑学院信息
	 * @return   "editSuccess"
	 */
	public String edit(){
		// 接收cid:根据cid进行查询:
		college = collegeService.findByCid(college.getCid());
		return "editSuccess";
		
	}
	
	/**
	 * 更新学院信息
	 * @return  "updateSuccess"
	 */
	public String update(){
		collegeService.update(college);
		return "updateSuccess";
	}
	

}
