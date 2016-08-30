package edu.whut.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.whut.commons.base.BaseController;
import edu.whut.entity.BlogComment;
import edu.whut.service.BlogCommentService;
import edu.whut.service.BlogService;
import edu.whut.util.JsonUtil;
import edu.whut.util.PageInfo;

@Controller
@RequestMapping(value="/after")
public class BlogCommentController extends BaseController {
	
	@Autowired
	private BlogCommentService blogCommentService;
	@Autowired
	private BlogService blogService;
	
	@RequestMapping(value="blogCommentPage")
	public String getBlogCommentPage(){
		logger.info("GET请求评论列表");
		return "admin/ajax/blog-comment";
	}
	
	@RequestMapping(value="blogComments", method = RequestMethod.POST)
	@ResponseBody
	public Object getBlogComments(Integer nowpage,Integer pagesize,String starttime,String endtime){
		logger.info("POST请求评论列表");
		if(nowpage ==null) nowpage=1;
		PageInfo<BlogComment> pageInfo = new PageInfo<BlogComment>(nowpage,pagesize);
		Map<String, Object> condition = new HashMap<String, Object>();
		condition.put("id", getCurrentUser().getId());
		condition.put("starttime", starttime);
		condition.put("endtime", endtime);
		pageInfo.setCondition(condition);
		blogCommentService.findPageBlogs(pageInfo);
		return pageInfo;
	}
	
	@RequestMapping(value="scanBlogCommentPage")
	public String getBlogCommentPage(HttpServletRequest request,Long id){
		logger.info("GET请求浏览评论详细信息");
		request.setAttribute("currentCommentId", id);
		return "admin/ajax/blog-comment-scan";
	}
	
	@RequestMapping(value="scanBlogComment",method = RequestMethod.POST)
	@ResponseBody
	public Object getBlogCommentInfo(HttpServletRequest request,Long id){
		logger.info("POST请求浏览评论详细信息");
		List<BlogComment> list = blogCommentService.scanBlogComment(id);
		String info = JsonUtil.list2json(list);
		return info;
	}
	
	@RequestMapping(value="replyCommentPage")
	public String replyPage(HttpServletRequest request,Long id){
		logger.info("GET请求回复评论");
		BlogComment blogComment = blogCommentService.findBlogCommentById(id);
		request.setAttribute("blogComment", blogComment);
		return "admin/ajax/blog-comment-reply";
	}
	
	@RequestMapping(value="replyComment",method=RequestMethod.POST)
	@ResponseBody
	public Object replyComment(BlogComment blogComment){
		logger.info("POST请求回复评论");
		blogComment.setCommenter_id(getCurrentUser().getId());
		blogComment.setState(0);
		blogComment.setCmttime(new Date());
		if (blogCommentService.replyBlogCommentById(blogComment)) {
			return renderSuccess("回复成功");
		}
		return renderError("回复失败");
	}
	
	@RequestMapping(value="CommentDelete",method=RequestMethod.POST)
	@ResponseBody
	public Object deleteComment(Long id){
		logger.info("POST请求删除评论");
		Long blog_id = blogCommentService.findBlogCommentById(id).getBlog_id();
		if(blogCommentService.deleteBlogCommentById(id)){
			blogService.updateBlogComNum(blogService.findBlogById(blog_id));
			return renderSuccess("删除成功");
		}else {
			return renderError("删除失败");
		}
	}
	
}
