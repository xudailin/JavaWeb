package edu.whut.dao;

import java.util.List;

import edu.whut.entity.BlogType;


public interface BlogTypeDao {
	
	public abstract List<BlogType> getAllBlogTypes();

	public abstract void insertBlogType(BlogType blogType);
	
	public abstract BlogType getBlogTypeByTypeName(String blogTypeName);

	public abstract void deleteBlogTypeById(Long id);
	
	public abstract BlogType getBlogTypeById(Long id);
	
	public abstract void updateBlogType(BlogType blogType);

}
