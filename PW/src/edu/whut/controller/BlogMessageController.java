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
import edu.whut.entity.BlogMessage;
import edu.whut.service.BlogMessageService;
import edu.whut.util.JsonUtil;
import edu.whut.util.PageInfo;

@Controller
@RequestMapping(value="/after")
public class BlogMessageController extends BaseController {
	
	@Autowired
	private BlogMessageService blogMessageService;
	
	@RequestMapping(value="blogMessagePage")
	public String getBlogMessagePage(){
		logger.info("GET请求留言列表");
		return "admin/ajax/blog-message";
	}
	
	@RequestMapping(value="blogMessages",method=RequestMethod.POST)
	@ResponseBody
	public Object getBlogMessages(Integer nowpage,Integer pagesize,String starttime,String endtime){
		logger.info("POST请求留言列表");
		if (nowpage==null) nowpage=1;
		PageInfo<BlogMessage> pageInfo = new PageInfo<BlogMessage>(nowpage,pagesize);
		Map<String, Object> condition = new HashMap<String, Object>();
		condition.put("id", getCurrentUser().getId());
		condition.put("starttime", starttime);
		condition.put("endtime", endtime);
		pageInfo.setCondition(condition);
		blogMessageService.findPageBlogMessages(pageInfo);
		return pageInfo;
	}
	
	@RequestMapping(value="deleteMessage",method=RequestMethod.POST)
	@ResponseBody
	public Object deleteBlogMessage(Long id){
		logger.info("POST请求删除留言");
		if (blogMessageService.deleteBlogMessages(id)) {
			return renderSuccess("删除成功");
		}
		return renderError("删除失败");
	}

	@RequestMapping(value="scanBlogMessagePage")
	public String getMessageScanPage(HttpServletRequest request,Long id){
		logger.info("GET请求浏览"+id+"楼留言信息");
		request.setAttribute("currentMessageId", id);
		return "admin/ajax/blog-message-scan";
	}
	
	@RequestMapping(value="scanBlogMessage",method = RequestMethod.POST)
	@ResponseBody
	public Object 留言信息(HttpServletRequest request,Long id){
		logger.info("POST请求浏览"+id+"楼留言信息");
		List<BlogMessage> list = blogMessageService.scanBlogMessages(id);
		String info = JsonUtil.list2json(list);
		return info;
	}
	
	@RequestMapping(value="replyMessagePage")
	public String replyPage(HttpServletRequest request,Long id){
		logger.info("GET请求回复留言");
		BlogMessage blogMessage = blogMessageService.findBlogMesssageById(id);
		request.setAttribute("blogMessage", blogMessage);
		return "admin/ajax/blog-message-reply";
	}
	
	@RequestMapping(value="replyMessage",method=RequestMethod.POST)
	@ResponseBody
	public Object replyMessage(BlogMessage blogMessage){
		logger.info("POST请求回复留言");
		blogMessage.setReceiver_id(getCurrentUser().getId());
		blogMessage.setLeaver_id(getCurrentUser().getId());
		blogMessage.setState(0);
		blogMessage.setWritetime(new Date());
		if (blogMessageService.replyBlogMessageById(blogMessage)) {
			return renderSuccess("回复成功");
		}
		return renderError("回复失败");
	}
	
	

}
