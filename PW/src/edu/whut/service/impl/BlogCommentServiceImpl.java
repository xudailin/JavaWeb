package edu.whut.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.whut.dao.BlogCommentDao;
import edu.whut.dao.UserDao;
import edu.whut.entity.BlogComment;
import edu.whut.service.BlogCommentService;
import edu.whut.util.PageInfo;

@Service
public class BlogCommentServiceImpl implements BlogCommentService {
	
	@Autowired
	private BlogCommentDao blogCommentDao;
	@Autowired
	private UserDao userDao;

	@Override
	public void findPageBlogs(PageInfo<BlogComment> pageInfo) {
		pageInfo.setRows(blogCommentDao.findPageBlogCommentList(pageInfo));
		pageInfo.setTotal(blogCommentDao.findBlogCommentCount(pageInfo));
	}
	
	@Override
	public List<BlogComment> scanBlogComment(Long id){
		BlogComment blogComment = blogCommentDao.findBlogCommentById(id);
		List<BlogComment> list =  blogCommentDao.findCommentsByRootId(blogComment);
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getSuper_id()!=0) {
				BlogComment superComment = blogCommentDao.findSuperCommentById(list.get(i).getSuper_id());
				superComment.setCommenter(blogCommentDao.findCommenterById(superComment.getCommenter_id()));
				list.get(i).setSuperComment(superComment);
			}
			list.get(i).getBlog().setUser(userDao.findUserById(list.get(i).getBlog().getUser_id()));
		}
		blogCommentDao.updateCommentStateById(id);
		return list;
		
	}

	@Override
	public BlogComment findBlogCommentById(Long id) {
		BlogComment blogComment = blogCommentDao.findBlogCommentById(id);
		blogComment.getBlog().setUser(userDao.findUserById(blogComment.getBlog().getUser_id()));
		return blogComment;
	}

	@Override
	public boolean deleteBlogCommentById(Long id) {
		
		blogCommentDao.deleteCommentById(id);
		return true;
	}

	@Override
	public boolean replyBlogCommentById(BlogComment blogComment) {
		blogCommentDao.insertComment(blogComment);
		return true;
	}

	
	
}
