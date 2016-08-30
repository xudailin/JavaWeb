package edu.whut.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.whut.commons.base.BaseController;
import edu.whut.entity.BlogLink;
import edu.whut.service.BlogLinkService;

@Controller
@RequestMapping(value="/after")
public class BlogLinkController extends BaseController{
	
	@Autowired
	private BlogLinkService blogLinkService;
	
	@RequestMapping(value="blogLinkPage")
	public String getAllBlogLinks(HttpServletRequest request){
		logger.info("GET请求获取链接列表");
		List<BlogLink> list = blogLinkService.findAllBlogLinks(getCurrentUser().getId());
		request.setAttribute("linkList", list);
		return "admin/ajax/blog-link";
	}
	
	@RequestMapping(value="deleteBlogLink",method=RequestMethod.POST)
	@ResponseBody
	public Object deleteBlogLink(Long id){
		logger.info("POST请求删除链接");
		if (blogLinkService.deleteBlogLink(id)) {
			return renderSuccess("删除成功");
		}
		return renderError("删除失败");
	}
	
	@RequestMapping(value="addBlogLinkPage")
	public String addPage() {
		logger.info("GET请求添加博客链接");
		return "admin/ajax/blog-link-add";
	}
	
	@RequestMapping(value="addBlogLink",method=RequestMethod.POST)
	@ResponseBody
	public Object addBlogLink(BlogLink blogLink){
		logger.info("POST请求添加博客链接");
		blogLink.setState(0);
		blogLink.setUser_id(getCurrentUser().getId());
		if (blogLinkService.addBlogLink(blogLink)) {
			return renderSuccess("添加成功");
		}
		return renderError("添加失败");
	}
	
	@RequestMapping(value="editBlogLinkPage")
	public String editLinkPage(HttpServletRequest request,Long id) {
		logger.info("GET请求编辑博客链接");
		BlogLink blogLink = blogLinkService.findBlogLinkById(id);
		request.setAttribute("blogLink", blogLink);
		return "admin/ajax/blog-link-edit";
	}
	
	@RequestMapping(value="editBlogLink",method=RequestMethod.POST)
	@ResponseBody
	public Object editBlogLink(BlogLink blogLink){
		logger.info("POST请求添加博客链接");
		if (blogLinkService.updateBlogLink(blogLink)) {
			return renderSuccess("更新成功");
		}
		return renderError("更新失败");
	}

}
