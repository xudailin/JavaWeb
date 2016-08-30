package edu.whut.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.whut.dao.BlogCommentDao;
import edu.whut.dao.BlogDao;
import edu.whut.dao.UserDao;
import edu.whut.entity.Blog;
import edu.whut.entity.BlogComment;
import edu.whut.service.BlogService;
import edu.whut.util.PageInfo;

@Service
public class BlogServiceImpl implements BlogService{
	
	@Autowired
	private BlogDao blogDao;
	@Autowired
	private BlogCommentDao blogCommentDao;
	@Autowired
	private UserDao userDao;
	
	@Override
	public void findPageBlogs(PageInfo<Blog> pageInfo) {
		pageInfo.setRows(blogDao.findPageBlogList(pageInfo));
		pageInfo.setTotal(blogDao.findBlogCount(pageInfo));		
	}
	
	@Override
	public boolean addBlog(Blog blog){
		blogDao.insertBlog(blog);
		return true;
	}
	
	@Override
	public boolean deleteBlogById(Long id) {
		blogDao.deleteBlogById(id);
		return true;
	}

	@Override
	public Blog findBlogById(Long id) {
		return blogDao.getBlogById(id);
	}

	@Override
	public boolean updateBlog(Blog blog) {
		blogDao.updateBlog(blog);
		return true;
	}
	
	@Override
	public boolean updateBlogComNum(Blog blog) {
		blog.setComNum(blogDao.findBlogCommentCount(blog));
		blogDao.updateBlogComNum(blog);
		return true;
	}

	@Override
	public List<BlogComment> findCommentsByBlogId(Long blog_id) {
		List<BlogComment> list = blogCommentDao.findCommentsByBlogId(blog_id);
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getSuper_id()!=0) {
				BlogComment superComment = blogCommentDao.findSuperCommentById(list.get(i).getSuper_id());
				superComment.setCommenter(blogCommentDao.findCommenterById(superComment.getCommenter_id()));
				list.get(i).setSuperComment(superComment);
			}
			list.get(i).getBlog().setUser(userDao.findUserById(list.get(i).getBlog().getUser_id()));
		}
		return list;
	}

}
