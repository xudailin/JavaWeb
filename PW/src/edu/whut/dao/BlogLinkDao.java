package edu.whut.dao;

import java.util.List;

import edu.whut.entity.BlogLink;

public interface BlogLinkDao {

	public abstract List<BlogLink> getAllBlogLinks(Long id);
	
	public abstract List<BlogLink> getBlogLinksAvailable(Long id);
	
	public abstract void deleteLink(Long id);
	
	public abstract void insertBlogLink(BlogLink blogLink);
	
	public abstract BlogLink getLinkById(Long id);
	
	public abstract void updateBlogLink(BlogLink blogLink);
	
}
