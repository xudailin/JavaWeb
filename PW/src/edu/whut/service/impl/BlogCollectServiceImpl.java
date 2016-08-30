package edu.whut.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.whut.dao.BlogCollectDao;
import edu.whut.dao.BlogDao;
import edu.whut.entity.Blog;
import edu.whut.entity.BlogCollect;
import edu.whut.entity.User;
import edu.whut.service.BlogCollectService;

@Service
public class BlogCollectServiceImpl implements BlogCollectService {
	
	@Autowired
	private BlogCollectDao blogCollectDao;
	@Autowired
	private BlogDao blogDao;
	
	public Boolean containBlogCollect(User visitor,Long id){
		boolean ret = true;
		List<BlogCollect> list = blogCollectDao.getBlogCollectsByBId(id);
		for (BlogCollect blogCollect : list) {
			if (blogCollect.getUser_id()==visitor.getId()) {
				ret = false;
			}
		}
		return ret;
	}
	
	public Boolean BlogCollect(BlogCollect blogCollect) {
		blogCollectDao.insertBlogCollect(blogCollect);
		int collectNum = blogCollectDao.getCollectNumByBId(blogCollect.getBlog_id());
		Blog blog = blogDao.getBlogById(blogCollect.getBlog_id());
		blog.setCollectNum(collectNum);
		blogCollectDao.updateBlogCollectNum(blog);
		return true;
	}
	
	public void cancelBlogCollect(BlogCollect blogCollect) {
		blogCollectDao.deleteBlogCollect(blogCollect);
		int collectNum = blogCollectDao.getCollectNumByBId(blogCollect.getBlog_id());
		Blog blog = blogDao.getBlogById(blogCollect.getBlog_id());
		blog.setCollectNum(collectNum);
		blogCollectDao.updateBlogCollectNum(blog);
	}

}
