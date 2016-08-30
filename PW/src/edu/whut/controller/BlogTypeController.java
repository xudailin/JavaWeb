package edu.whut.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import edu.whut.commons.base.BaseController;
import edu.whut.entity.BlogType;
import edu.whut.service.BlogTypeService;

@Controller
@RequestMapping(value="/after")
public class BlogTypeController extends BaseController{
	
	@Autowired
	private BlogTypeService blogTypeService;
	
	@RequestMapping(value="/blogTypePage")
	public Object findAllBlogType(Map<String, Object> model){
		logger.info("GET请求博客类型列表");
		List<BlogType> list = blogTypeService.findAllBlogTypes();
		model.put("blogTypeList", list);
		return "admin/ajax/blog-type";
	}
	
	@RequestMapping(value="/addPage")
	public String addPage(){
		logger.info("GET请求添加博客类型");
		return "admin/ajax/blog-type-add";
	}
	
	@RequestMapping(value="/addBlogType", method = RequestMethod.POST)
	@ResponseBody
	public Object addBlogType(BlogType blogType){
		logger.info("POST请求添加博客类型");
		if(blogTypeService.addBlogType(blogType)){
			return renderSuccess("添加成功");
		}
		return renderError("添加失败");
	}
	
	@RequestMapping(value="/deleteBlogType", method = RequestMethod.POST)
	@ResponseBody
	public Object deleteBlogType(BlogType blogType){
		logger.info("POST请求删除博客类型");
		if(blogTypeService.deleteBlogTypeById(blogType.getId())){
			return renderSuccess("删除成功");
		}
		return renderError("删除失败");
	}
	
	@RequestMapping(value="/editPage")
	public String editPage(HttpServletRequest request,Long id){
		logger.info("GET请求更新博客类型");
		request.setAttribute("blogType",blogTypeService.findBlogTypeById(id));
		return "admin/ajax/blog-type-edit";
	}
	
	@RequestMapping(value="/editBlogType", method = RequestMethod.POST)
	@ResponseBody
	public Object editBlogType(BlogType blogType){
		logger.info("POST请求更新博客类型");
		if(blogTypeService.updateBlogType(blogType)){
			return renderSuccess("更新成功");
		}
		return renderSuccess("更新失败");
	}
}
