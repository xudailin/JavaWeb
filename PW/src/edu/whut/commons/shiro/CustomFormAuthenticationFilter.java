package edu.whut.commons.shiro;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.beans.factory.annotation.Autowired;

import edu.whut.entity.User;
import edu.whut.service.UserService;

public class CustomFormAuthenticationFilter extends FormAuthenticationFilter {

	@Autowired
	private UserService userService;

	 /** 
     * 这个方法决定了是否能让用户登录 
     */  
	protected boolean isAccessAllowed(ServletRequest request,
			ServletResponse response,Object mappedValue) {
		
		Subject subject = getSubject(request, response);
		//不是通过登录而是通过记住我登录进来的
		if(!subject.isAuthenticated() && subject.isRemembered()){
			Session session = subject.getSession(true);
			User user = userService.findUserByLoginName(subject.getPrincipal().toString());
			UsernamePasswordToken token = new UsernamePasswordToken(user.getLoginname(),user.getPassword(),true);
		    subject.login(token);
		    session.setAttribute("Current_User", user);
		}
		return subject.isAuthenticated() || subject.isRemembered();

	}
	


		
}
