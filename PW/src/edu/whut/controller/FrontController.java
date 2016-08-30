package edu.whut.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

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
import edu.whut.entity.Blog;
import edu.whut.entity.BlogCollect;
import edu.whut.entity.BlogComment;
import edu.whut.entity.Picture;
import edu.whut.entity.User;
import edu.whut.service.BlogCollectService;
import edu.whut.service.BlogCommentService;
import edu.whut.service.BlogLinkService;
import edu.whut.service.BlogService;
import edu.whut.service.PictureService;
import edu.whut.service.UserMottoService;
import edu.whut.service.UserService;
import edu.whut.util.JsonUtil;
import edu.whut.util.PageInfo;

@Controller
@RequestMapping(value="/front")
public class FrontController extends BaseController{
	
	@Autowired
	private UserService userService;
	@Autowired
	private BlogService blogService;
	@Autowired
	private BlogCommentService blogCommentService;
	@Autowired
	private BlogLinkService blogLinkService;
	@Autowired
	private UserMottoService userMottoService;
	@Autowired
	private BlogCollectService blogCollectService;
	@Autowired
	private PictureService pictureService;
	
	@RequestMapping(value="/about")
	public String getfAboutPage(HttpServletRequest request){
		logger.info("GET请求发送邮件");
		User currentBlogAdmin = getCurrentBlogAdmin();
		request.setAttribute("currentVisitor", getCurrentUser());
		request.setAttribute("currentBlogAdmin",currentBlogAdmin);
		request.setAttribute("mottos", userMottoService.findAllUserMottosAvailable(currentBlogAdmin.getId()));
		request.setAttribute("blogLinks", blogLinkService.findAllBlogLinkAvailable(getCurrentBlogAdmin().getId()));
		return "front/about";
	}
	
	@RequestMapping(value="/contact")
	public String getfContactPage(HttpServletRequest request){
		logger.info("GET请求发送邮件");
		request.setAttribute("currentVisitor", getCurrentUser());
		return "front/contact";
	}
	
	@RequestMapping(value="/blogfCommit",method=RequestMethod.POST)
	@ResponseBody
	public Object fBlogCommit(BlogComment blogComment){
		logger.info("POST请求前台评论博文");
		blogComment.setRoot_id((long) 0);
		blogComment.setSuper_id((long) 0);
		blogComment.setState(1);
		blogComment.setCommenter_id(getCurrentUser().getId());
		blogComment.setCmttime(new Date());
		if (blogCommentService.replyBlogCommentById(blogComment)) {
			blogService.updateBlogComNum(blogService.findBlogById(blogComment.getBlog_id()));
			return renderSuccess("评论成功");
		}
		return renderError("评论失败");
	}
	
		@RequestMapping(value = "/login", method = RequestMethod.GET)
		public String login() {
		   logger.info("GET请求前台登录");
		   if (SecurityUtils.getSubject().isAuthenticated()) {
		      return "redirect:/front/index.html";
		   }      
		   return "front/front-login";
		}

	    @RequestMapping(value = "/login", method = RequestMethod.POST)
	    @ResponseBody
	    public Object loginPost(String username, String password,String rememberMe) {
	        logger.info("POST请求前台登录");
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

	
	@RequestMapping(value="/blogSinglePage")
	public String getfBlogSinglePage(HttpServletRequest request,Long id){
		logger.info("GET请求前台博文展示页面");
		Blog blog = blogService.findBlogById(id);
		List<BlogComment> allList = blogService.findCommentsByBlogId(id);
		List<BlogComment> topList = new ArrayList<BlogComment>();
		if (allList.size()>3) {
			topList = allList.subList(0, 3);
		}else{
			topList = allList;
		}
		request.setAttribute("currentVisitor", getCurrentUser());
		request.setAttribute("blog", blog);
		request.setAttribute("allList", allList);
		request.setAttribute("topList", topList);
		return "front/single";
	}
	
    public User getCurrentBlogAdmin() {
        User currentUser = userService.findUserByFrontUrl("front/index");
        return currentUser;
    }
	
	@RequestMapping(value="/index")
	public String getIndexPage(HttpServletRequest request){
		logger.info("GET请求前台首页");
		PageInfo<Blog> pageInfo = new PageInfo<Blog>(1,6,"publishtime","desc");
		Map<String, Object> condition = new HashMap<String, Object>();
		condition.put("id", getCurrentBlogAdmin().getId());
		pageInfo.setCondition(condition);
		blogService.findPageBlogs(pageInfo);
		User currentBlogAdmin = getCurrentBlogAdmin();
		request.setAttribute("mottos", userMottoService.findAllUserMottosAvailable(currentBlogAdmin.getId()));
		request.setAttribute("currentVisitor", getCurrentUser());
		request.setAttribute("blogs", pageInfo.getRows());
		return "front/index";
	}
	
	@RequestMapping(value="/fBlogPage")
	public String getfBlogPage(HttpServletRequest request){
		logger.info("GET请求前台博客展示页面");
		request.setAttribute("currentVisitor", getCurrentUser());
		return "front/blog";
	}
	
	@RequestMapping(value="/getfPageBlog",method=RequestMethod.POST)
	@ResponseBody
	public Object getFrontPageBlogs(Integer nowpage){
		logger.info("POST请求前台博客显示");
		if(nowpage==null) nowpage=1;
		PageInfo<Blog> pageInfo = new PageInfo<Blog>(nowpage,9,"publishtime","desc");
		Map<String, Object> condition = new HashMap<String, Object>();
		condition.put("id", getCurrentBlogAdmin().getId());
		pageInfo.setCondition(condition);
		blogService.findPageBlogs(pageInfo);
		return pageInfo;
	}
	
	@RequestMapping(value="/sendEmail",method=RequestMethod.POST)
	@ResponseBody
	public Object sendEmail(String emailContent){
		logger.info("POST请求发送邮件");
		boolean ret = userService.sendEmail(emailContent, getCurrentUser(),getCurrentBlogAdmin());
		if (ret) {
			return renderSuccess("发送成功");
		}
		return renderError("发送失败");
	}
	
	@RequestMapping(value="/fPortfolioPage")
	public String getfPortfolioPage(HttpServletRequest request){
		logger.info("GET请求前台图片展示页面");
		request.setAttribute("currentVisitor", getCurrentUser());
		request.setAttribute("list", pictureService.findAllPictures(getCurrentBlogAdmin().getId()));
		return "front/portfolio";
	}
	
	@RequestMapping(value="/fPortfolio",method=RequestMethod.POST)
	@ResponseBody
	public Object getPicture(String emailContent){
		logger.info("POST请求前台图片展示页面");
		List<Picture> list=pictureService.findAllPictures(getCurrentBlogAdmin().getId());
		String json = JsonUtil.list2json(list);
		return json;
	}
	
	@RequestMapping(value="/replyCommentPage")
	public Object replyPage(HttpServletRequest request,Long id){
		logger.info("GET请求回复评论");
		BlogComment blogComment = blogCommentService.findBlogCommentById(id);
		request.setAttribute("blogComment", blogComment);
		return "front/reply";
	}
	
	@RequestMapping(value="/replyComment",method=RequestMethod.POST)
	@ResponseBody
	public Object replyComment(BlogComment blogComment){
		logger.info("POST请求回复评论");
		blogComment.setCommenter_id(getCurrentUser().getId());
		blogComment.setState(1);
		blogComment.setCmttime(new Date());
		if (blogCommentService.replyBlogCommentById(blogComment)) {
			if (getCurrentBlogAdmin().getId()!=getCurrentUser().getId()) {
				blogService.updateBlogComNum(blogService.findBlogById(blogComment.getBlog_id()));
			}
			return renderSuccess("回复成功");
		}
		return renderError("回复失败");
	}
	
	@RequestMapping(value="/blogCollect",method=RequestMethod.POST)
	@ResponseBody
	public Object collectBlog(Long id){
		BlogCollect blogCollect = new BlogCollect(getCurrentUser().getId(),id);
		if(blogCollectService.containBlogCollect(getCurrentUser(), id)){
			//true 未收藏 可以收藏
			if (blogCollectService.BlogCollect(blogCollect)) {
				return renderSuccess("收藏成功");
			}
			else{
				return renderError("收藏失败");
			}
		}else{
			//false 已收藏
			blogCollectService.cancelBlogCollect(blogCollect);
			return renderError("取消收藏");
		}
	}
	
	   /**
     * GET 注册
     * @return {String}
     */
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register() {
        logger.info("GET请求注册");
        return "front/register";
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

}
