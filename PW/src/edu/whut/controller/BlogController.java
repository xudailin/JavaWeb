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
import edu.whut.entity.Blog;
import edu.whut.entity.BlogComment;
import edu.whut.entity.BlogType;
import edu.whut.service.BlogService;
import edu.whut.service.BlogTypeService;
import edu.whut.util.JsonUtil;
import edu.whut.util.PageInfo;

@Controller
@RequestMapping(value="/after")
public class BlogController extends BaseController{
	
	@Autowired
	private BlogService blogService;
	@Autowired
	private BlogTypeService blogTypeService;
	
	@RequestMapping(value="/scanBlogPage")
	public String scanPage(HttpServletRequest request,Long id){
		logger.info("GET请求浏览博客信息");
		request.setAttribute("blog",blogService.findBlogById(id));
		return "admin/ajax/blog-scan";
	}
	
	@RequestMapping(value="/editBlogPage")
	public String editPage(HttpServletRequest request,Long id){
		logger.info("GET请求更新博客");
		request.setAttribute("blog",blogService.findBlogById(id));
		List<BlogType> blogTypeList = blogTypeService.findAllBlogTypes();
		request.setAttribute("blogTypeList", blogTypeList);
		return "admin/ajax/blog-edit";
	}
	
	@RequestMapping(value="/editBlog", method = RequestMethod.POST)
	@ResponseBody
	public Object editBlog(Blog blog){
		logger.info("POST请求更新博客");
		blog.setType_id(blogTypeService.findBlogTypeByTypeName(blog.getBlogType().getTypename()).getId());
		blog.setPublishtime(new Date());
		if(blogService.updateBlog(blog)){
			return renderSuccess("更新成功");
		}
		return renderError("更新失败");
	}
	
	@RequestMapping(value="/BlogDelete",method = RequestMethod.POST)
	@ResponseBody
	public Object deleteBlog(Blog blog){
		logger.info("POST请求删除博客");
		if (blogService.deleteBlogById(blog.getId())) {
			return renderSuccess("删除成功");
		}
		return renderError("删除失败");
	}
	
	@RequestMapping(value="/addBlogPage")
	public String addPage(HttpServletRequest request){
		logger.info("GET请求添加博客");
		request.setAttribute("currentUser", getCurrentUser());
		List<BlogType> blogTypeList = blogTypeService.findAllBlogTypes();
		request.setAttribute("blogTypeList", blogTypeList);
		return "admin/ajax/blog-add";
	}
	
	@RequestMapping(value="/addBlog", method = RequestMethod.POST)
	@ResponseBody
	public Object addBlog(Blog blog){
		logger.info("POST请求添加博客");
		blog.setReadtimes(0);
		blog.setComNum(0);
		blog.setCollectNum(0);
		blog.setBlogType(blogTypeService.findBlogTypeByTypeName(blog.getBlogType().getTypename()));
		blog.setUser(getCurrentUser());
		blog.setPublishtime(new Date());
		if(blogService.addBlog(blog)){
			return renderSuccess("添加成功");
		}
		return renderError("添加失败");
	}
	
	@RequestMapping(value="blogPage",method=RequestMethod.POST)
	public String findAllBlog(Map<String, Object> modal){
		logger.info("GET请求所有博客列表");
		return "admin/ajax/blog";
	}
	
	@RequestMapping(value="blogList",method=RequestMethod.POST)
	@ResponseBody
	public Object findBlogList(Integer nowpage,Integer pagesize){
		logger.info("POST请求所有博客列表");
		if(nowpage==null) nowpage=1;
		String order = "desc";
		String sort = "publishtime";
		PageInfo<Blog> pageInfo = new PageInfo<Blog>(nowpage,pagesize,sort,order);
		Map<String, Object> condition = new HashMap<String, Object>();
		condition.put("id", getCurrentUser().getId());
		pageInfo.setCondition(condition);
		blogService.findPageBlogs(pageInfo);
		return pageInfo;
	}
	
	@RequestMapping(value="scanCommentPage")
	public String getCommentPage(HttpServletRequest request,Long id){
		logger.info("GET请求浏览博客博客所有评论");
		request.setAttribute("currentBlogId", id);
		return "admin/ajax/blog-comments-scan";
	}

	@RequestMapping(value="scanBlogComments",method = RequestMethod.POST)
	@ResponseBody
	public Object getBlogComments(Long id){
		logger.info("POST请求浏览博客所有评论");
		List<BlogComment> list = blogService.findCommentsByBlogId(id);
		String info = JsonUtil.list2json(list);
		return info;
	}
	
	@RequestMapping(value="getBlog",method = RequestMethod.POST)
	@ResponseBody
	public Object getBlog(Long id){
		logger.info("POST请求浏览博客所有评论(无评论时)");
		Blog blog = blogService.findBlogById(id);
		String info = JsonUtil.bean2json(blog);
		return info;
	}
}
