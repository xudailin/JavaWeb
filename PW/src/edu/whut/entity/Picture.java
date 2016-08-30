package edu.whut.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @author Annie
 *
 */
public class Picture implements Serializable {

	private static final long serialVersionUID = 7599602564327726079L;

	private Long id;
	private String imgUrl;
	private Long type_id;
	private PictrueType pictrueType;
	private Long user_id;
	private User user;
	private Date creatDate;
	public Date getCreatDate() {
		return creatDate;
	}
	public void setCreatDate(Date creatDate) {
		this.creatDate = creatDate;
	}
	public Long getId() {
		return id;
	}
	public Long getType_id() {
		return type_id;
	}
	public void setType_id(Long type_id) {
		this.type_id = type_id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public PictrueType getPictrueType() {
		return pictrueType;
	}
	public void setPictrueType(PictrueType pictrueType) {
		this.pictrueType = pictrueType;
	}
	public Long getUser_id() {
		return user_id;
	}
	public void setUser_id(Long user_id) {
		this.user_id = user_id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

}
