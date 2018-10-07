package cn.husestudy.utils;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * 邮件发送工具类
 * @author Drew
 *
 */
public class MailUitls {
	/**
	 * 发送邮件的方法
	 * @param to    ：收件人
	 * @param code  ：激活码
	 */
	public static void sendMail(String to,String code){
		/**
		 * 1.获得一个Session对象.
		 * 2.创建一个代表邮件的对象Message.
		 * 3.发送邮件Transport
		 */
		// 1.获得连接对象
		Properties props = new Properties();
		props.setProperty("mail.host", "localhost");  //发送邮件的主机
		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("service@shop.com", "service");
			}
		});
		// 2.创建邮件对象:
		Message message = new MimeMessage(session);
		// 设置发件人
		try {
			message.setFrom(new InternetAddress("service@shop.com"));
			// 设置收件人
			message.addRecipient(RecipientType.TO, new InternetAddress(to));
			// 抄送 CC   密送BCC
			// 设置标题
			message.setSubject("来自湘科院大学生自学交流平台官方发送邮件");
			// 设置邮件正文:
			message.setContent("<h1>湘科院大学生自学交流平台官方发送邮件!点下面链接完成激活操作</h1><h3><a href='http://192.168.29.1:8080/husestudy/user_active.action?code="+code+"'>http://192.168.29.1:8080/husestudy/user_active.action?code="+code+"</a></h3>", "text/html;charset=UTF-8");
			/*
			 * 此处书写本地IP地址：cmd---ipconfig---[IP Address]192.168.29.1
			 * */
			// 3.发送邮件:
			Transport.send(message);
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 完成修改密码操作：
	 * @param to
	 */
	public static void sendRepassword(String to,Integer uid){
		//1.获得连接对象：
		Properties properties = new Properties();
		properties.setProperty("mail.host", "localhost");//发送邮件的主机
		Session session = Session.getInstance(properties, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("service@shop.com", "service");
			}
		});
		//2.创建邮件对象。
		Message message = new MimeMessage(session);
		//设置发件人
		try {
			message.setFrom(new InternetAddress("service@shop.com"));
			//设计收件人：
			message.addRecipient(RecipientType.TO, new InternetAddress(to));
			//设置标题：
			message.setSubject("湘科院大学生交流平台官方发送邮件");
			//设置邮件正文：
			message.setContent("<h2>湘科院大学生自主学习交流平台发送邮件！点击下面连接完成<strong>找回密码</strong>操作</h2><h3><a href='http://192.168.29.1:8080/husestudy/user_repasswordPage.action?uid="+uid+"' >http://192.168.29.1:8080/husestudy/user_repasswordPage.action?uid="+uid+"</a></h3>", "text/html;charset=UTF-8");
			//发送邮件：
			Transport.send(message);
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 测试
	 * @param args
	 */
	public static void main(String[] args) {
		sendMail("aaa@shop.com","11111111111111111");
	}
}
