package edu.whut.service;

import java.util.List;

import edu.whut.entity.BlogMessage;
import edu.whut.util.PageInfo;

public interface BlogMessageService {
	
	/**
     * find page blogMessage
     *
     * @param 
     * @return
     */
	public abstract void findPageBlogMessages(PageInfo<BlogMessage> pageInfo);
	
	/**
     * delete blogMessage
     *
     * @param 
     * @return
     */
	public abstract boolean deleteBlogMessages(Long id);
	
	/**
     * get blogMessages by root_id
     *
     * @param 
     * @return
     */
	public abstract List<BlogMessage> scanBlogMessages(Long id);

	/**
     * find blogComment by the id of comment
     *
     * @param 
     * @return
     */
	public abstract BlogMessage findBlogMesssageById(Long id);
	
	/**
     * reply blogMessage
     *
     * @param 
     * @return
     */
	public abstract boolean replyBlogMessageById(BlogMessage blogMessage);
}
