package edu.whut.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.whut.dao.BlogMessageDao;
import edu.whut.dao.UserDao;
import edu.whut.entity.BlogMessage;
import edu.whut.service.BlogMessageService;
import edu.whut.util.PageInfo;

@Service
public class BlogMessageServiceImpl implements BlogMessageService{
	
	@Autowired
	private BlogMessageDao blogMessageDao;
	@Autowired
	private UserDao userDao;
	
	@Override
	public void findPageBlogMessages(PageInfo<BlogMessage> pageInfo) {
		List<BlogMessage> list = blogMessageDao.findPageBlogMessageList(pageInfo);
		for(int i = 0 ; i < list.size() ;i++){
			if (list.get(i).getSuper_id()!=0) {
				BlogMessage superBlogMessage = blogMessageDao.findBlogMessageById(list.get(i).getSuper_id());
				list.get(i).setSuperBlogMessage(superBlogMessage);
			}else{
				BlogMessage superBlogMessage = new BlogMessage();
				superBlogMessage.setLeaver_id((Long) pageInfo.getCondition().get("id"));
				superBlogMessage.setLeaver(userDao.findUserById((Long) pageInfo.getCondition().get("id")));
				list.get(i).setSuperBlogMessage(superBlogMessage);
			}
		}
		pageInfo.setRows(list);
		pageInfo.setTotal(blogMessageDao.findBlogMessageCount(pageInfo));
	}

	@Override
	public boolean deleteBlogMessages(Long id) {
		blogMessageDao.deleteMessage(id);
		return true;
	}

	@Override
	public List<BlogMessage> scanBlogMessages(Long id) {
		BlogMessage blogMessage = blogMessageDao.findBlogMessageById(id);
		List<BlogMessage> list = blogMessageDao.getMessagesByRootId(blogMessage.getRoot_id());
		for(int i = 0 ; i < list.size() ;i++){
			if (list.get(i).getSuper_id()!=0) {
				BlogMessage superBlogMessage = blogMessageDao.findBlogMessageById(list.get(i).getSuper_id());
				list.get(i).setSuperBlogMessage(superBlogMessage);
			}
		}
		blogMessageDao.updateMessageState(id);
		return list;
	}

	@Override
	public BlogMessage findBlogMesssageById(Long id) {
		return blogMessageDao.findBlogMessageById(id);
	}

	@Override
	public boolean replyBlogMessageById(BlogMessage blogMessage) {
		blogMessageDao.insertMessage(blogMessage);
		return true;
	}

}
