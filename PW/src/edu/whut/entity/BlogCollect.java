package edu.whut.entity;

import java.io.Serializable;

public class BlogCollect implements Serializable {

	private static final long serialVersionUID = -755085437186211024L;
	private Long id;
	private Long user_id;
	private Long blog_id;
	private User user;
	private Blog blog;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getUser_id() {
		return user_id;
	}
	public void setUser_id(Long user_id) {
		this.user_id = user_id;
	}
	public Long getBlog_id() {
		return blog_id;
	}
	public void setBlog_id(Long blog_id) {
		this.blog_id = blog_id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Blog getBlog() {
		return blog;
	}
	public void setBlog(Blog blog) {
		this.blog = blog;
	}
	public BlogCollect(Long user_id, Long blog_id) {
		super();
		this.user_id = user_id;
		this.blog_id = blog_id;
	}
	public BlogCollect() {
		super();
	}
	
}
