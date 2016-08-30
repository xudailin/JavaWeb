package com.wtu.sss.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="sys_admin")
public class Admin implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private long adminId = System.nanoTime();
	private String adminName;
	private String password;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public long getAdminId() {
		return adminId;
	}
	public void setAdminId(long adminId) {
		this.adminId = adminId;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public Admin() {
		super();
	}
	public Admin(String adminName, String password) {
		super();
		this.adminName = adminName;
		this.password = password;
	}


}
