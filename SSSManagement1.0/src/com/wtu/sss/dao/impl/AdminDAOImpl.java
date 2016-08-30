package com.wtu.sss.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.wtu.sss.dao.AdminDAO;
import com.wtu.sss.model.Admin;

@Component("adminDAO")
public class AdminDAOImpl implements AdminDAO {
	
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	/* (non-Javadoc)
	 * 根据用户名和密码查询用户
	 */
	public Admin queryAdminByNamePass(String adminName,String password){
		List<Admin> list = this.hibernateTemplate.find("from Admin as admin where admin.adminName = '"+adminName+"' and admin.password = '"+password+"'");
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.dao.AdminDAO#queryAdminByName(java.lang.String)
	 * 查询用户名是否存在
	 */
	public List<Admin> queryAdminByName(String adminName){
		List<Admin> list =  this.hibernateTemplate.find("from Admin as admin where admin.adminName = '"+adminName+"'");
		return list;
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.dao.AdminDAO#addAdmin(com.wtu.sss.model.Admin)
	 * 添加用户
	 */
	public boolean addAdmin(Admin admin){
		List<Admin> list = queryAdminByName(admin.getAdminName());
		if(list.size() == 0){
			this.hibernateTemplate.save(admin);
			return true;
		}
		return false;
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.wtu.sss.dao.AdminDAO#updatePassword(com.wtu.sss.model.Admin, java.lang.String)
	 * 修改用户的密码
	 */
	public void updatePassword(Admin admin, String newPwd) {
		this.hibernateTemplate
				.getSessionFactory()
				.getCurrentSession()
				.createQuery(
						"update Admin admin set admin.password='" + newPwd
								+ "' where admin.id=" + admin.getAdminId()).executeUpdate();
	}
	
}
