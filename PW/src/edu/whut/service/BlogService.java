package edu.whut.service;

import java.util.List;

import edu.whut.entity.Blog;
import edu.whut.entity.BlogComment;
import edu.whut.util.PageInfo;

public interface BlogService {

	/**
     * find page blogs
     *
     * @param 
     * @return
     */
	public abstract void findPageBlogs(PageInfo<Blog> pageInfo);
	
	/**
     * add Blog
     *
     * @param 
     * @return
     */
	public abstract boolean addBlog(Blog blog);

	/**
     * delete Blog
     *
     * @param 
     * @return
     */
	public abstract boolean deleteBlogById(Long id);

	/**
     * find Blog by id
     *
     * @param 
     * @return
     */
	public abstract Blog findBlogById(Long id);

	/**
     * update blog
     *
     * @param 
     * @return
     */
	public abstract boolean updateBlog(Blog blog);

	/**
     * find comments of blog
     *
     * @param 
     * @return
     */
	public abstract List<BlogComment> findCommentsByBlogId(Long blog_id);

	/**
     * update blogComNum
     *
     * @param 
     * @return
     */
	public abstract boolean updateBlogComNum(Blog blog);
}