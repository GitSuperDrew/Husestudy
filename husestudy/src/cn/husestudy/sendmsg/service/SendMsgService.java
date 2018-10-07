package cn.husestudy.sendmsg.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.husestudy.sendmsg.dao.SendMsgDao;
import cn.husestudy.sendmsg.vo.Contact_Info;
import cn.husestudy.sendmsg.vo.SendMsg;

/**
 * 用户反馈信息的业务层：
 * @author Drew
 *
 */
@Transactional
public class SendMsgService {
	//注入持久层：SendMsgDao
	private SendMsgDao sendMsgDao;
	
	public SendMsgDao getSendMsgDao() {
		return sendMsgDao;
	}
	public void setSendMsgDao(SendMsgDao sendMsgDao) {
		this.sendMsgDao = sendMsgDao;
	}

	/**
	 * 业务层：保存用户反馈的信息
	 * @param sendMsg
	 */
	public void save(SendMsg sendMsg){
		sendMsgDao.save(sendMsg);
	}
	
	/**
	 * 业务层：删除用户反馈的信息
	 * @param sendMsg
	 */
	public void delete(SendMsg sendMsg){
		sendMsgDao.delete(sendMsg);
	}

	/**
	 * 业务层：查询所有用户反馈的信息
	 * @return
	 */
	public List<SendMsg> findAll() {
		return sendMsgDao.findAll();
	}
	
	/**
	 * 业务层：根据反馈ID，查询出具体的反馈信息
	 * @param sendMsg_id
	 * @return
	 */
	public SendMsg findBySendMsgId(Integer sendMsg_id){
		return sendMsgDao.findBySendMsgId(sendMsg_id);
	}
	/**
	 * 业务层：查询所有的网站服务信息
	 * @return 集合---网站服务信息
	 */
	public List<Contact_Info> contactInfo(){
		return sendMsgDao.contactInfo();
	}
	
	/**
	 * 业务层：通过ID查询出相应的网站服务信息
	 * @return  一个网站服务信息
	 */
	public Contact_Info findContactInfoById(Integer infoId){
		return sendMsgDao.findContactInfoById(infoId);
	}
	
	/**
	 * 业务层：更新网站服务信息
	 * @param contact_Info
	 * @return
	 */
	public void updateContactInfo(Contact_Info contact_Info){
		sendMsgDao.updateContactInfo(contact_Info);
	}
	
	
	public void saveContactInfo(Contact_Info contact_Info){
		sendMsgDao.saveContactInfo(contact_Info);
	}
}
