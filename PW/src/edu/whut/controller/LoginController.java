package edu.whut.controller;

import java.util.Calendar;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.whut.commons.base.BaseController;
import edu.whut.entity.User;
import edu.whut.service.UserService;

@Controller
@RequestMapping(value="/after")
public class LoginController extends BaseController{
	
	@Autowired
	private UserService userService;
	
    /**
     * 首页
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/index")
    public String index(Map<String, Object> model) {
    	User user = getCurrentUser();
		model.put("currentUser", user);
        return "admin/index";
    }
    
    /**
     * GET 注册
     * @return {String}
     */
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register() {
        logger.info("GET请求注册");
        return "admin/page-register";
    }
    
    /**
     * POST 注册
     * @return {String}
     */
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public Object registerPost(User user) {
        logger.info("POST请求注册");
        if (user.getLoginname()==null || user.getLoginname().trim()=="") {
        	return renderError("用户名不能为空!");
		}
        User u = userService.findUserByLoginName(user.getLoginname());
        if (u != null) {
            return renderError("用户名已存在，请重新输入!");
        }
        if (user.getPassword()==null || user.getPassword().trim()=="") {
        	return renderError("密码不能为空!");
		}
        Pattern regex = Pattern.compile("^(((13[0-9])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8})|(0\\d{2}-\\d{8})|(0\\d{3}-\\d{7})$");
        Matcher matcher = regex.matcher(user.getPhone());
        if(!matcher.matches()){
        	return renderError("电话号码不合法!");
        } 
        user.setPassword(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()));
        user.setCreatedate(Calendar.getInstance().getTime());
        user.setStatus(0);
        user.setFollowers(0);
        user.setFollowing(0);
        user.setPosts(0);
        userService.addUser(user);
        return renderSuccess("添加成功");
    }
	
    /**
     * GET 登录
     * @return {String}
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        logger.info("GET请求登录");
        if (SecurityUtils.getSubject().isAuthenticated()) {
            return "redirect:/after/index.html";
        }
        return "admin/page-login";
    }
    
    /**
     * POST 登录 shiro 写法
     *
     * @param username 用户名
     * @param password 密码
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public Object loginPost(String username, String password,String rememberMe) {
        logger.info("POST请求登录");
        if (StringUtils.isBlank(username)) {
            return renderError("用户名不能为空");
        }
        if (StringUtils.isBlank(password)) {
            return renderError("密码不能为空");
        }
        Subject user = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(username, DigestUtils.md5DigestAsHex(password.getBytes()));
        if(rememberMe==null){
        	token.setRememberMe(false);
        }else{
        	token.setRememberMe(true);
        }
        try {
            user.login(token);
        } catch (UnknownAccountException e) {
            logger.error("账号不存在：{}", e);
            return renderError("账号不存在");
        } catch (DisabledAccountException e) {
            logger.error("账号未启用：{}", e);
            return renderError("账号未启用");
        } catch (IncorrectCredentialsException e) {
            logger.error("密码错误：{}", e);
            return renderError("密码错误");
        } catch (RuntimeException e) {
            logger.error("未知错误,请联系管理员：{}", e);
            return renderError("未知错误,请联系管理员");
        }
        return renderSuccess();
    }


}
