package edu.whut.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.whut.dao.BlogLinkDao;
import edu.whut.entity.BlogLink;
import edu.whut.service.BlogLinkService;

@Service
public class BlogLinkServiceImpl implements BlogLinkService {
	
	@Autowired
	private BlogLinkDao blogLinkDao;

	@Override
	public List<BlogLink> findAllBlogLinks(Long id) {
		return blogLinkDao.getAllBlogLinks(id);
	}

	@Override
	public boolean deleteBlogLink(Long id) {
		blogLinkDao.deleteLink(id);
		return true;
	}

	@Override
	public boolean addBlogLink(BlogLink blogLink) {
		blogLinkDao.insertBlogLink(blogLink);
		return true;
	}

	@Override
	public BlogLink findBlogLinkById(Long id) {
		return blogLinkDao.getLinkById(id);
	}

	@Override
	public boolean updateBlogLink(BlogLink blogLink) {
		blogLinkDao.updateBlogLink(blogLink);
		return true;
	}

	@Override
	public List<BlogLink> findAllBlogLinkAvailable(Long id) {
		return blogLinkDao.getBlogLinksAvailable(id);
	}
	


}
