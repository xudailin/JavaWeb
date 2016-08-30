package edu.whut.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.whut.commons.base.BaseController;
import edu.whut.entity.User;
import edu.whut.service.UserService;

@Controller
@RequestMapping(value="/after")
public class UserController extends BaseController{
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="userInfo")
	public String getUserInfo(HttpServletRequest request) {
		logger.info("GET请求用户信息");
		request.setAttribute("currentUser", getCurrentUser());
		return "admin/ajax/user-info";
	}
	
	@RequestMapping(value="updateUserInfo",method=RequestMethod.POST)
	@ResponseBody
	public Object updateUserInfo(User user){
		logger.info("POST请求更新信息");
		if (userService.updateUserInfo(user)) {
			return renderSuccess("更新成功");
		}
		return renderError("更新失败");
	}
	
    /**
     * GET 首页
     * @return {String}
     */
    @RequestMapping(value = "/welcomePage")
    public String welcomePage() {
        logger.info("GET请求首页");
        return "admin/ajax/welcome";
    }

}
