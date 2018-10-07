package cn.husestudy.sendmsg.adminaction;

import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import cn.husestudy.sendmsg.service.SendMsgService;
import cn.husestudy.sendmsg.vo.SendMsg;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
/**
 * 管理层：用户反馈信息的action类
 * @author Drew
 *
 */

public class SendMsgAdminAction extends ActionSupport implements ModelDriven<SendMsg>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private SendMsg sendMsg = new SendMsg();
	//注入SendMsgService，selectedRow
	private SendMsgService sendMsgService;
	private Integer[] selectedRow;
	
	public Integer[] getSelectedRow() {
		return selectedRow;
	}
	public void setSelectedRow(Integer[] selectedRow) {
		this.selectedRow = selectedRow;
	}
	public SendMsgService getSendMsgService() {
		return sendMsgService;
	}
	public void setSendMsgService(SendMsgService sendMsgService) {
		this.sendMsgService = sendMsgService;
	}

	@Override
	public SendMsg getModel() {
		return sendMsg;
	}

	public SendMsg getSendMsg() {
		return sendMsg;
	}
	public void setSendMsg(SendMsg sendMsg) {
		this.sendMsg = sendMsg;
	}
	
	/**
	 * 响应层：进行保存显示到管理员的界面
	 * @return saveSuccess
	 */
	public String save(){
		sendMsgService.save(sendMsg);
		return "saveSuccess";
	}
	
	/**
	 * 响应层：进行删除用户反馈的信息
	 * @return  deleteSuccess
	 */
	public String delete(){
		sendMsgService.delete(sendMsg);
		return "deleteSuccess";
	}
	
	
	/**
	 * 响应层：查询所有的用户反馈的信息
	 * @return findAll
	 */
	public String findAll(){
		List<SendMsg> sList = sendMsgService.findAll();
		ActionContext.getContext().getValueStack().set("sList", sList);
		return "findAll";
	}
	
	public void exportSendMsgToExcel(){
		try {
			HSSFWorkbook workbook = new HSSFWorkbook();
			HSSFSheet sheet = workbook.createSheet();
			HSSFRow row_title = sheet.createRow(0);
			HSSFCell cell_title1 = row_title.createCell(0);
			HSSFCell cell_title2 = row_title.createCell(1);
			HSSFCell cell_title3 = row_title.createCell(2);
			HSSFCell cell_title4 = row_title.createCell(3);
			cell_title1.setCellValue("反馈人姓名");//sendmsg_name
			cell_title2.setCellValue("反馈人邮件");//sendmsg_email
			cell_title3.setCellValue("反馈的信息");//sendmsg_message
			cell_title4.setCellValue("反馈的时间");//sendmsg_sdate
			
			for (int i = 0; i < selectedRow.length; i++) {
				sendMsg = sendMsgService.findBySendMsgId(selectedRow[i]);
				HSSFRow row = sheet.createRow(i+1);
				HSSFCell cell1 = row.createCell(0);
				HSSFCell cell2 = row.createCell(1);
				HSSFCell cell3 = row.createCell(2);
				HSSFCell cell4 = row.createCell(3);
				cell1.setCellValue(sendMsg.getSendmsg_name());
				cell2.setCellValue(sendMsg.getSendmsg_email());
				cell3.setCellValue(sendMsg.getSendmsg_message());
				cell4.setCellValue(sendMsg.getSendmsg_sdate());
			}
			HttpServletResponse response = ServletActionContext.getResponse();
			//把响应头数据类型设置为任意二进制流，用于上传下载：
			response.setContentType("application/octet-stream");
			//告诉浏览器通过下载方式打开，并设置下载文件名：
			response.setHeader("Content-Disposition", "attachment;fileName="+new String("反馈信息.xls".getBytes(),"ISO8859-1"));//编码格式对文件名字也有点影响!
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
