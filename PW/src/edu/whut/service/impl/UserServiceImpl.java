package edu.whut.service.impl;

import java.security.Security;
import java.util.Properties;

import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sun.net.ssl.internal.ssl.Provider;

import edu.whut.dao.UserDao;
import edu.whut.entity.User;
import edu.whut.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
    private UserDao userDao;

	@Override
	public User findUserByLoginName(String username) {
		return userDao.findUserByLoginName(username);
	}

	@Override
	public boolean addUser(User user) {
		return userDao.insertUser(user);
	}
	
    @Override
    public User findUserById(Long id) {
        return userDao.findUserById(id);
    }
    
    @Override
    public boolean updateUserInfo(User user){
    	userDao.updateUser(user);
    	return true;
    }

	@Override
	public User findUserByFrontUrl(String front_url) {
		return userDao.findUserByFrontUrl(front_url);
	}
	
	public boolean sendEmail(String emailContent , User visitor ,User blogAdmin){
	     Properties props = new Properties();  
	     // 设置发送邮件的邮件服务器的属性（这里使用网易的smtp服务器）  
	     props.put("mail.smtp.host", "smtp.qq.com");  
	     // 需要经过授权，也就是有户名和密码的校验，这样才能通过验证（一定要有这一条）  
	     props.put("mail.smtp.auth", "true");  
	     Security.addProvider(new Provider()); 
	     props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	     props.setProperty("mail.smtp.port", "465");
	     props.setProperty("mail.smtp.socketFactory.port", "465");
	     // 用刚刚设置好的props对象构建一个session  
	     Session session = Session.getDefaultInstance(props);  
	     // 有了这句便可以在发送邮件的过程中在console处显示过程信息，供调试使  
	     // 用（你可以在控制台（console)上看到发送邮件的过程）  
	     session.setDebug(true);  
	     // 用session为参数定义消息对象  
	     MimeMessage message = new MimeMessage(session);  
	     try {  
	      // 加载发件人地址  
	      message.setFrom(new InternetAddress(visitor.getEmail()));  
	      // 加载收件人地址  
	      message.addRecipient(Message.RecipientType.TO, new InternetAddress(blogAdmin.getEmail()));  
	      // 加载标题  
	      message.setSubject("From Personal Website...");  
	      // 向multipart对象中添加邮件的各个部分内容，包括文本内容和附件  
	      Multipart multipart = new MimeMultipart();  
	  
	      // 设置邮件的文本内容  
	      BodyPart contentPart = new MimeBodyPart();  
	      contentPart.setText(emailContent);  
	      multipart.addBodyPart(contentPart);  
	        
	      // 添加附件  
	      //BodyPart messageBodyPart = new MimeBodyPart();  
	      //DataSource source = new FileDataSource(affix);  
	      // 添加附件的内容  
	      //messageBodyPart.setDataHandler(new DataHandler(source));  
	      // 添加附件的标题  
	      // 这里很重要，通过下面的Base64编码的转换可以保证你的中文附件标题名在发送时不会变成乱码  
	      //sun.misc.BASE64Encoder enc = new sun.misc.BASE64Encoder();  
	      //messageBodyPart.setFileName("=?GBK?B?"+ enc.encode(affixName.getBytes()) + "?=");  
	      //multipart.addBodyPart(messageBodyPart);  
	        
	      // 将multipart对象放到message中  
	      message.setContent(multipart);  
	      // 保存邮件  
	      message.saveChanges();  
	      // 发送邮件  
	      Transport transport = session.getTransport("smtp");  
	      // 连接服务器的邮箱  
	      // 密码为邮箱第三方客户端使用授权码，而不是登录邮箱密码
	      transport.connect("smtp.qq.com", visitor.getEmail(), visitor.getEmailpwd());  
	      // 把邮件发送出去  
	      transport.sendMessage(message, message.getAllRecipients());  
	      transport.close();  
	     } catch (Exception e) {  
	      e.printStackTrace();  
	     }  
		return true;	
	}
	


}
