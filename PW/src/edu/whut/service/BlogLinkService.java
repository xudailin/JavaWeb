package edu.whut.service;

import java.util.List;

import edu.whut.entity.BlogLink;

public interface BlogLinkService {
	
	/**
     * 查询所有博客链接
     *
     * @param 
     * @return
     */
	public abstract List<BlogLink> findAllBlogLinks(Long id);
	
	/**
     * 查询所有可用的博客链接
     *
     * @param 
     * @return
     */
	public abstract List<BlogLink> findAllBlogLinkAvailable(Long id);
	
	/**
     * 删除博客链接
     *
     * @param 
     * @return
     */
	public abstract boolean deleteBlogLink(Long id);
	
	/**
     * 添加博客链接
     *
     * @param 
     * @return
     */
	public abstract boolean addBlogLink(BlogLink blogLink);
	
	/**
     * 查询博客链接
     *
     * @param 
     * @return
     */
	public abstract BlogLink findBlogLinkById(Long id);
	
	/**
     * 更新博客链接
     *
     * @param 
     * @return
     */
	public abstract boolean updateBlogLink(BlogLink blogLink);
}
