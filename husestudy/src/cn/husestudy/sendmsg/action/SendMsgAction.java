package cn.husestudy.sendmsg.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import cn.husestudy.sendmsg.service.SendMsgService;
import cn.husestudy.sendmsg.vo.SendMsg;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 用户前台：提交反馈信息操作控制
 * @author Drew
 *
 */
public class SendMsgAction extends ActionSupport implements ModelDriven<SendMsg>{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//模型驱动使用的对象：
	private SendMsg sendMsg = new SendMsg();
	public SendMsg getSendMsg() {
		return sendMsg;
	}
	public void setSendMsg(SendMsg sendMsg) {
		this.sendMsg = sendMsg;
	}
	
	//注入SendMsgService对象
	private SendMsgService sendMsgService;
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
	
	/**
	 * 前台传输数据该后台存储：
	 * AJAX进行异步存储数据的执行方法：
	 * @return  sendMsgSuccess
	 * @throws ParseException 
	 */
	public String sendMsg() throws ParseException {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String nowTime = sdf.format(date);
		Date time = sdf.parse(nowTime);
		sendMsg.setSendmsg_sdate(time);
		
		
		sendMsgService.save(sendMsg);
		
		return "sendMsgSuccess";
	}
	

}
