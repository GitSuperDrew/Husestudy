package cn.husestudy.motto.adminaction;

import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import cn.husestudy.motto.service.MottoService;
import cn.husestudy.motto.vo.Motto;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class MottoAdminAction extends ActionSupport implements ModelDriven<Motto>{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//模型驱动使用的对象：
	private Motto motto = new Motto();
	
	public Motto getMotto() {
		return motto;
	}
	public void setMotto(Motto motto) {
		this.motto = motto;
	}
	
	//注入MottoService
	private MottoService mottoService;
	private Integer[] selectedRow;
	
	public Integer[] getSelectedRow() {
		return selectedRow;
	}
	public void setSelectedRow(Integer[] selectedRow) {
		this.selectedRow = selectedRow;
	}
	public MottoService getMottoService() {
		return mottoService;
	}
	public void setMottoService(MottoService mottoService) {
		this.mottoService = mottoService;
	}
	
	
	@Override
	public Motto getModel() {
		return motto;
	}
	
	/**
	 * 查询所有的格言：
	 * @return
	 */
	public String findAll(){
		//查询所有的格言：
		List<Motto> mottoList = mottoService.findAll();
		//将格言list存入到值栈中：
		ActionContext.getContext().getValueStack().set("mottoList", mottoList);
		//跳转到motto/list.jsp页面
		return "findAll";
	}
	
	
	/**
	 * 方法②
	 * @return	motto
	 */
	public String findByMottoId(){
		//将单个的格言存入到模型驱动中
		motto = mottoService.findByMottoId(motto.getMotto_id());
		return "findByMottoId";
	}
	
	/**
	 * 保存格言：
	 * @return
	 */
	public String save(){
		/*Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String time = sdf.format(date);*/
		motto.setMotto_time(new Date());
		mottoService.save(motto);
		//跳转到motto/list.jsp中，通过路径action：mottoAdmin_findAll.action
		return "saveSuccess";
	}
	
	/**
	 * 删除格言
	 * @return
	 */
	public String delete(){
		mottoService.delete(motto);
		//跳转到motto/list.jsp中，通过路径action:mottoAdmin_findAll.action
		return "deleteSuccess";
	}
	
	/**
	 * 更新格言
	 * @return
	 */
	public String update(){
		mottoService.update(motto);
		return "updateSuccess";
	}
	
	/**
	 * 编辑格言
	 * @return
	 */
	public String edit(){
		//根据格言的ID，查询出具体的格言信息。
		motto = mottoService.findByMottoId(motto.getMotto_id());
		//查询出所有的格言信息：
		List<Motto> mottoList = mottoService.findAll();
		//将查询出来的格言信息list存入到值栈中。
		ActionContext.getContext().getValueStack().set("mottoList", mottoList);
		//跳转到编辑成功页面
		return "editSuccess";
	}
	
	/**
	 * 将Motto格言信息导出到Excel中：优化建议--使用泛型
	 */
	public void exportMottoToExcel(){
		try {
			HSSFWorkbook workbook = new HSSFWorkbook();
			HSSFSheet sheet = workbook.createSheet();
			HSSFRow row_title = sheet.createRow(0);
			HSSFCell cell_title1 = row_title.createCell(0);
			HSSFCell cell_title2 = row_title.createCell(1);
			HSSFCell cell_title3 = row_title.createCell(2);
			cell_title1.setCellValue("作者");//格言作者
			cell_title2.setCellValue("内容");//格言内容
			cell_title3.setCellValue("格言版式");//格言版式
			
			for (int i = 0; i < selectedRow.length; i++) {
				motto = mottoService.findByMottoId(selectedRow[i]);
				HSSFRow row = sheet.createRow(i+1);
				HSSFCell cell1 = row.createCell(0);
				HSSFCell cell2 = row.createCell(1);
				HSSFCell cell3 = row.createCell(2);
				cell1.setCellValue(motto.getMotto_author());
				cell2.setCellValue(motto.getMotto_content());
				cell3.setCellValue(motto.getMotto_message());
			}
			HttpServletResponse response = ServletActionContext.getResponse();
			//把响应头数据类型设置为任意二进制流，用于上传下载：
			response.setContentType("application/octet-stream");
			//告诉浏览器通过下载方式打开，并设置下载文件名：
			response.setHeader("Content-Disposition", "attachment;fileName="+new String("格言内容.xls".getBytes(),"ISO8859-1"));//编码格式对文件名字也有点影响!
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
	

}
