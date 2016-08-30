package edu.whut.entity;

import java.io.Serializable;
import java.util.Date;

public class BlogMessage implements Serializable {

	private static final long serialVersionUID = 6001620474064610493L;
	
	private Long id;
	private Long leaver_id;
	private User leaver;
	private Long receiver_id;
	private User receiver;
	private String mcontent;
	private Date writetime;
	private Integer state;
	private Long root_id;
	private Long super_id;
	private BlogMessage superBlogMessage;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getLeaver_id() {
		return leaver_id;
	}
	public void setLeaver_id(Long leaver_id) {
		this.leaver_id = leaver_id;
	}
	public User getLeaver() {
		return leaver;
	}
	public void setLeaver(User leaver) {
		this.leaver = leaver;
	}
	public Long getReceiver_id() {
		return receiver_id;
	}
	public void setReceiver_id(Long receiver_id) {
		this.receiver_id = receiver_id;
	}
	public User getReceiver() {
		return receiver;
	}
	public void setReceiver(User receiver) {
		this.receiver = receiver;
	}
	public String getMcontent() {
		return mcontent;
	}
	public void setMcontent(String mcontent) {
		this.mcontent = mcontent;
	}
	public Date getWritetime() {
		return writetime;
	}
	public void setWritetime(Date writetime) {
		this.writetime = writetime;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Long getRoot_id() {
		return root_id;
	}
	public void setRoot_id(Long root_id) {
		this.root_id = root_id;
	}
	public Long getSuper_id() {
		return super_id;
	}
	public void setSuper_id(Long super_id) {
		this.super_id = super_id;
	}
	public BlogMessage getSuperBlogMessage() {
		return superBlogMessage;
	}
	public void setSuperBlogMessage(BlogMessage superBlogMessage) {
		this.superBlogMessage = superBlogMessage;
	}
	

}
