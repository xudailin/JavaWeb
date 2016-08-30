package edu.whut.entity;

import java.io.Serializable;
import java.util.List;

public class BlogType implements Serializable{

	private static final long serialVersionUID = 8238676567850354759L;
	
	private Long id;
	private String typename;
	private List<Blog> blogs;

	public List<Blog> getBlogs() {
		return blogs;
	}

	public void setBlogs(List<Blog> blogs) {
		this.blogs = blogs;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}
	
	
}
