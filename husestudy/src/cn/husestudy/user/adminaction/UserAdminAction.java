package cn.husestudy.user.adminaction;

import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import cn.husestudy.college.service.CollegeService;
import cn.husestudy.major.service.MajorService;
import cn.husestudy.major.vo.Major;
import cn.husestudy.major_user.service.Major_UserService;
import cn.husestudy.user.service.UserService;
import cn.husestudy.user.vo.User;
import cn.husestudy.utils.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 商品的Action对象
 * @author Drew
 *
 */
public class UserAdminAction extends ActionSupport implements ModelDriven<User>{

	private static final long serialVersionUID = 1L;
	//用于接受数据的模型驱动：
	private User user = new User();
	//模型驱动：
	@Override
	public User getModel() {		
		return user;
	}
	
	private Integer cid;//接受一级分类（学院）cid
	private Integer page;
	private Integer[] selectedRow;
	//注入UserService, CollegeService, MajorService, Major_UserService
	private UserService userService;
	private CollegeService collegeService;
	private MajorService majorService;
	private Major_UserService major_UserService;
	
	
	public User getUser() {
		return user;
	}
	public MajorService getMajorService() {
		return majorService;
	}
	public Major_UserService getMajor_UserService() {
		return major_UserService;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public void setMajor_UserService(Major_UserService major_UserService) {
		this.major_UserService = major_UserService;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public void setCollegeService(CollegeService collegeService) {
		this.collegeService = collegeService;
	}
	public CollegeService getCollegeService() {
		return collegeService;
	}
	public void setMajorService(MajorService majorService) {
		this.majorService = majorService;
	}
	public Integer[] getSelectedRow() {
		return selectedRow;
	}
	public void setSelectedRow(Integer[] selectedRow) {
		this.selectedRow = selectedRow;
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
	
	/**
	 * 将数据库中的用户的数据导出到本地的Excel中
	 */
	public void exportUserToExcel(){
		try {
			HSSFWorkbook workbook = new HSSFWorkbook();
			HSSFSheet sheet = workbook.createSheet();
			HSSFRow row_title = sheet.createRow(0);
			HSSFCell cell_title1 = row_title.createCell(0);
			HSSFCell cell_title2 = row_title.createCell(1);
			HSSFCell cell_title3 = row_title.createCell(2);
			HSSFCell cell_title4 = row_title.createCell(3);
			HSSFCell cell_title5 = row_title.createCell(4);
			cell_title1.setCellValue("用户账号");//username
			cell_title2.setCellValue("真实姓名");//name
			cell_title3.setCellValue("用户身份");//job
			cell_title4.setCellValue("电话号码");//phone
			cell_title5.setCellValue("常用邮箱");//email
			
			for (int i = 0; i < selectedRow.length; i++) {
				user = userService.findByUid(selectedRow[i]);
				HSSFRow row = sheet.createRow(i+1);
				HSSFCell cell1 = row.createCell(0);
				HSSFCell cell2 = row.createCell(1);
				HSSFCell cell3 = row.createCell(2);
				HSSFCell cell4 = row.createCell(3);
				HSSFCell cell5 = row.createCell(4);
				cell1.setCellValue(user.getUsername());
				cell2.setCellValue(user.getName());
				cell3.setCellValue(user.getJob());
				cell4.setCellValue(user.getPhone());
				cell5.setCellValue(user.getEmail());
			}
			HttpServletResponse response = ServletActionContext.getResponse();
			//把响应头数据类型设置为任意二进制流，用于上传下载：
			response.setContentType("application/octet-stream");
			//告诉浏览器通过下载方式打开，并设置下载文件名：
			response.setHeader("Content-Disposition", "attachment;fileName="+new String("用户信息.xls".getBytes(),"ISO8859-1"));//编码格式对文件名字也有点影响!
			ServletOutputStream sos = response.getOutputStream();
			workbook.write(sos);
			workbook.close();
			if (sos != null) {
				sos.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
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
	

}
