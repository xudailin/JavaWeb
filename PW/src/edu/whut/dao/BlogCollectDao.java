package edu.whut.dao;

import java.util.List;

import edu.whut.entity.Blog;
import edu.whut.entity.BlogCollect;

public interface BlogCollectDao {
	
	public abstract List<BlogCollect> getBlogCollectsByBId(Long id);
	
	public abstract void insertBlogCollect(BlogCollect blogCollect);
	
	public abstract Integer getCollectNumByBId(Long id);

	public abstract void updateBlogCollectNum(Blog blog);
	
	public abstract void deleteBlogCollect(BlogCollect blogCollect);
}
