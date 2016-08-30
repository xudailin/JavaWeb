package com.wtu.sss.service;

import com.wtu.sss.model.Admin;

public interface AdminService {

	public abstract Admin checkUserExistByNamePass(String adminName,String password);
	public abstract boolean register(Admin admin);
	public abstract boolean checkAdminExistByName(String adminName);
	public abstract void updatePwd(String password);
}