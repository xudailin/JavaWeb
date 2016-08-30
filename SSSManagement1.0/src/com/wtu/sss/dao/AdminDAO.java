package com.wtu.sss.dao;

import java.util.List;

import com.wtu.sss.model.Admin;

public interface AdminDAO {

	public abstract Admin queryAdminByNamePass(String adminName,String password);
	public abstract List<Admin> queryAdminByName(String adminName);
	public abstract boolean addAdmin(Admin admin);
	public abstract void updatePassword(Admin admin, String newPwd);
}