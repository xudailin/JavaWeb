package edu.whut.dao;

import java.util.List;

import edu.whut.entity.BlogMessage;
import edu.whut.util.PageInfo;

public interface BlogMessageDao {

	//find page message by pageInfo
	public abstract List<BlogMessage> findPageBlogMessageList(PageInfo<BlogMessage> pageInfo);

	//find count of message by pageInfo
	public abstract Integer findBlogMessageCount(PageInfo<BlogMessage> pageInfo);
	
	//find page message by id
	public abstract BlogMessage findBlogMessageById(Long id);
	
	//delete message by id
	public abstract void deleteMessage(Long id);
	
	//get messages by root_id
	public abstract List<BlogMessage> getMessagesByRootId(Long id);
	
	//update state od message
	public abstract void updateMessageState(Long id);
	
	//insert blogMessage
	public abstract void insertMessage(BlogMessage blogMessage);

}
