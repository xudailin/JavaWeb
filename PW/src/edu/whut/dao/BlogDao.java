package edu.whut.dao;

import java.util.List;

import edu.whut.entity.Blog;
import edu.whut.util.PageInfo;

public interface BlogDao {
	
	//find page blog by pageInfo
	public abstract List<Blog> findPageBlogList(PageInfo<Blog> pageInfo);
	//find count of blog by pageInfo
	public abstract Integer findBlogCount(PageInfo<Blog> pageInfo);
	//add blog
	public abstract void insertBlog(Blog blog);
	//delete blog
	public abstract void deleteBlogById(Long id);
	//find blog by id
	public abstract Blog getBlogById(Long id);
	//update blog
	public abstract void updateBlog(Blog blog);
	//update blog comNum
	public abstract void updateBlogComNum(Blog blog);
	//find blog comment count by blog_id
	public abstract Integer findBlogCommentCount(Blog blog);

}
