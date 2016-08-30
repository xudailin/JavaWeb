package edu.whut.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.whut.dao.BlogTypeDao;
import edu.whut.entity.BlogType;
import edu.whut.service.BlogTypeService;

@Service
public class BlogTypeServiceImpl implements BlogTypeService {
	
	@Autowired
	private BlogTypeDao blogTypeDao;

	@Override
	public List<BlogType> findAllBlogTypes() {
		return blogTypeDao.getAllBlogTypes();
	}

	@Override
	public boolean addBlogType(BlogType blogType){
		if (blogTypeDao.getBlogTypeByTypeName(blogType.getTypename())!=null) {
			return false;
		}else{
			blogTypeDao.insertBlogType(blogType);
			return true;
		}
	}
	
	@Override
	public boolean deleteBlogTypeById(Long id) {
		blogTypeDao.deleteBlogTypeById(id);
		return true;
	}

	@Override
	public BlogType findBlogTypeById(Long id) {
		return blogTypeDao.getBlogTypeById(id);
	}

	@Override
	public boolean updateBlogType(BlogType blogType) {
		blogTypeDao.updateBlogType(blogType);
		return true;
	}

	@Override
	public BlogType findBlogTypeByTypeName(String typeName) {
		return blogTypeDao.getBlogTypeByTypeName(typeName);
	}

}
