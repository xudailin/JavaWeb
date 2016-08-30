package edu.whut.entity;

import java.io.Serializable;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

public class BlogComment implements Serializable {

	private static final long serialVersionUID = 4488109684333874273L;
	
	private Long id;
	private Long commenter_id;
	private User commenter;
	private Long blog_id;
	private Blog blog;
	private String comcontent;
	private Long super_id;
	private BlogComment superComment;
	private Long root_id;
	private BlogComment rootComment;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
	private Date cmttime;
	private Integer state;

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getCommenter_id() {
		return commenter_id;
	}
	public void setCommenter_id(Long commenter_id) {
		this.commenter_id = commenter_id;
	}
	public User getCommenter() {
		return commenter;
	}
	public void setCommenter(User commenter) {
		this.commenter = commenter;
	}
	public Long getBlog_id() {
		return blog_id;
	}
	public void setBlog_id(Long blog_id) {
		this.blog_id = blog_id;
	}
	public Blog getBlog() {
		return blog;
	}
	public void setBlog(Blog blog) {
		this.blog = blog;
	}

	public String getComcontent() {
		return comcontent;
	}
	public void setComcontent(String comcontent) {
		this.comcontent = comcontent;
	}
	public Long getSuper_id() {
		return super_id;
	}
	public void setSuper_id(Long super_id) {
		this.super_id = super_id;
	}


	public BlogComment getSuperComment() {
		return superComment;
	}
	public void setSuperComment(BlogComment superComment) {
		this.superComment = superComment;
	}
	public Long getRoot_id() {
		return root_id;
	}
	public void setRoot_id(Long root_id) {
		this.root_id = root_id;
	}
	public BlogComment getRootComment() {
		return rootComment;
	}
	public void setRootComment(BlogComment rootComment) {
		this.rootComment = rootComment;
	}
	public Date getCmttime() {
		return cmttime;
	}
	public void setCmttime(Date cmttime) {
		this.cmttime = cmttime;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	

	
	

}
