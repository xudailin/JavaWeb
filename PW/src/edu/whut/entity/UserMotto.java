package edu.whut.entity;

import java.io.Serializable;
import java.util.Date;

public class UserMotto implements Serializable {

	private static final long serialVersionUID = 6866750291434470652L;
	
	private Long id;
	private String mottoContent;
	private Integer state;
	private Date createdate;
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	private Long user_id;
	private User user;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public String getMottoContent() {
		return mottoContent;
	}
	public void setMottoContent(String mottoContent) {
		this.mottoContent = mottoContent;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
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
