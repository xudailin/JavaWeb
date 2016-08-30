package edu.whut.service;

import java.util.List;

import edu.whut.entity.BlogComment;
import edu.whut.util.PageInfo;

public interface BlogCommentService {

	/**
     * find page blogComment
     *
     * @param 
     * @return
     */
	public abstract void findPageBlogs(PageInfo<BlogComment> pageInfo);

	/**
     * scan blogComment
     *
     * @param 
     * @return
     */
	public abstract List<BlogComment> scanBlogComment(Long id);
	
	/**
     * find blogComment by the id of comment
     *
     * @param 
     * @return
     */
	public abstract BlogComment findBlogCommentById(Long id);
	
	/**
     * delete blogComment by the id of comment
     *
     * @param 
     * @return
     */
	public abstract boolean deleteBlogCommentById(Long id);
	
	/**
     * reply blogComment
     *
     * @param 
     * @return
     */
	public abstract boolean replyBlogCommentById(BlogComment blogComment);
	

}
