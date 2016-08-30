package com.wtu.sss.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionContext;
import com.wtu.sss.dao.AdminDAO;
import com.wtu.sss.model.Admin;
import com.wtu.sss.service.AdminService;

@Component("adminService")
public class AdminServiceImpl implements AdminService {
	
	private AdminDAO adminDAO;

	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.service.AdminService#checkUserExistByNamePass(java.lang.String, java.lang.String)
	 * 检查用户是否存在
	 */
	public Admin checkUserExistByNamePass(String adminName,String password){
		Admin am = adminDAO.queryAdminByNamePass(adminName,password);
		return am;
	}

	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.service.AdminService#register(com.wtu.sss.model.Admin)
	 * 用户注册
	 */
	public boolean register(Admin admin){
		boolean ret = adminDAO.addAdmin(admin);
		return ret;
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.service.AdminService#checkAdminExistByName(java.lang.String)
	 * 查询管理员用户名是否存在
	 */
	public boolean checkAdminExistByName(String adminName){
		List<Admin> list = this.adminDAO.queryAdminByName(adminName);
		if(list.size() == 0){
			return false;
		}else{
			return true;
		}
	}

	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.service.AdminService#updatePwd(java.lang.String)
	 * 修改用户密码
	 */
	public void updatePwd(String password){
		Admin currentAdmin = (Admin) ActionContext.getContext().getSession().get("currentAdmin");
		this.adminDAO.updatePassword(currentAdmin, password);
	}
	
	public AdminDAO getAdminDAO() {
		return adminDAO;
	}

	@Resource
	public void setAdminDAO(AdminDAO adminDAO) {
		this.adminDAO = adminDAO;
	}
}
