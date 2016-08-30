package edu.whut.dao;

import java.util.List;

import edu.whut.entity.BlogComment;
import edu.whut.entity.User;
import edu.whut.util.PageInfo;

public interface BlogCommentDao {
	
	//find page blog by pageInfo
	public abstract List<BlogComment> findPageBlogCommentList(PageInfo<BlogComment> pageInfo);

	//find page blog by pageInfo
	public abstract Integer findBlogCommentCount(PageInfo<BlogComment> pageInfo);
	
	//find blogComment by id
	public abstract  BlogComment findBlogCommentById(Long id);
	
	//find RootId by blogComment
	public abstract List<BlogComment> findCommentsByRootId(BlogComment blogComment);
	
	//find RootId by blogComment
	public abstract BlogComment findSuperCommentById(Long id);
	
	//find Commenter by id
	public abstract User findCommenterById(Long id);
	
	//update state by id
	public abstract void updateCommentStateById(Long id);
	
	//delete comment by id
	public abstract void deleteCommentById(Long id);
	
	//insert comment
	public abstract void insertComment(BlogComment blogComment);
	
	//find comments of blog
	public abstract List<BlogComment> findCommentsByBlogId(Long blog_id);

}
