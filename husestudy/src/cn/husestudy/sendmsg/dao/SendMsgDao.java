package cn.husestudy.sendmsg.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.husestudy.sendmsg.vo.Contact_Info;
import cn.husestudy.sendmsg.vo.SendMsg;

/**
 * 用户反馈信息--持久化层
 * @author Drew
 *
 */
public class SendMsgDao extends HibernateDaoSupport{
	
	private SendMsg sendMsg;
	private Contact_Info contact_Info;
	
	
	public Contact_Info getContact_Info() {
		return contact_Info;
	}

	public void setContact_Info(Contact_Info contact_Info) {
		this.contact_Info = contact_Info;
	}

	public SendMsg getSendMsg() {
		return sendMsg;
	}

	public void setSendMsg(SendMsg sendMsg) {
		this.sendMsg = sendMsg;
	}

	/**
	 * 保存反馈信息
	 * @param sendMsg
	 */
	public void save(SendMsg sendMsg){
		getHibernateTemplate().save(sendMsg);
	}
	
	/**
	 * 删除用户反馈的信息
	 * @param sendMsg
	 */
	public void delete(SendMsg sendMsg){
		getHibernateTemplate().delete(sendMsg);
	}
	
	/**
	 * 根据反馈ID，查询反馈的具体的信息
	 * @param sendmsg_id
	 * @return
	 */
	public SendMsg findBySendMsgId(Integer sendmsg_id){
		String hql = "from SendMsg where sendmsg_id = ?";
		List<SendMsg> sendMsg = getHibernateTemplate().find(hql, sendmsg_id);
		if (sendMsg != null && sendMsg.size() > 0) {
			return sendMsg.get(0);
		}
		return null;
	}
	
	/**
	 * 持久层：查询所有用户的反馈信息
	 * @return  所有的信息的list集合
	 */
	public List<SendMsg> findAll() {
		String hql = "from SendMsg";
		List<SendMsg> list = getHibernateTemplate().find(hql);
		return list;
	}
	
	/**
	 * 持久层：查询所有的ContactInfo管理的信息
	 * @return
	 */
	public List<Contact_Info> contactInfo(){
		String hql = "from Contact_Info";
		List<Contact_Info> list = getHibernateTemplate().find(hql);
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
	}
	
	/**
	 * 持久层：根据ID，查询出对应的具体信息
	 * @param infoId
	 * @return
	 */
	public Contact_Info findContactInfoById(Integer infoId){
		return getHibernateTemplate().get(Contact_Info.class, infoId);
	}
	
	/**
	 * 持久层：保存网站信息服务的信息
	 * @param contact_Info
	 */
	public void saveContactInfo(Contact_Info contact_Info){
		getHibernateTemplate().save(contact_Info);
	}
	
	/**
	 * 持久层：更新网站信息信息
	 * @param contact_Info
	 */
	public void updateContactInfo(Contact_Info contact_Info){
		getHibernateTemplate().update(contact_Info);
	}

}
