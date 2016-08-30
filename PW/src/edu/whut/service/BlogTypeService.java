package edu.whut.service;

import java.util.List;

import edu.whut.entity.BlogType;

public interface BlogTypeService {
	
	/**
     * 查询所有博客类型
     *
     * @param 
     * @return
     */
	public abstract List<BlogType> findAllBlogTypes();

	/**
     * 添加博客类型
     *
     * @param 
     * @return
     */
	public abstract boolean addBlogType(BlogType blogType);

	/**
     * 删除博客类型
     *
     * @param 
     * @return
     */
	public abstract boolean deleteBlogTypeById(Long id);
	
	/**
     * 根据id查询博客类型信息
     *
     * @param 
     * @return
     */
	public abstract BlogType findBlogTypeById(Long id);
	
	/**
     * 根据类型名称查询博客类型信息
     *
     * @param 
     * @return
     */
	public abstract BlogType findBlogTypeByTypeName(String typeName);
	
	/**
     * 更新博客类型信息
     *
     * @param 
     * @return
     */
	public abstract boolean updateBlogType(BlogType blogType);


}
