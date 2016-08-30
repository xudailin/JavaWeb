package com.wtu.sss.action;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.JSONUtil;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.wtu.sss.model.Admin;
import com.wtu.sss.service.AdminService;
import com.wtu.sss.vo.AdminInfo;

@Component("admin")
@Scope("prototype")
public class AdminAction extends ActionSupport implements
		ModelDriven<AdminInfo> {

	private AdminService adminService;
	private AdminInfo adminInfo = new AdminInfo();
	private String newPass;

	/*
	 * 管理员登录时，检查管理员是否合法
	 */
	public String checkAdmin() {
		Admin admin = adminService.checkUserExistByNamePass(
				this.adminInfo.getAdminName(), this.adminInfo.getPassword());
		if (admin != null) {
			ActionContext.getContext().getSession().put("currentAdmin", admin);
			return "loginSuccess";
		}
		return "loginFailure";
	}

	/*
	 * 管理员注册时，检查用户名是否存在，并利用json将结果串返回到jsp页面。
	 */
	public String checkAdminByName() {
		boolean ret = adminService.checkAdminExistByName(adminInfo
				.getAdminName());
		String msg = null;
		try {
			if (ret) {
				msg = "当前用户已存在";
			} else {
				msg = "用户名合法";
			}
			Map<String, String> map = new HashMap<String, String>();
			map.put("msg", msg);
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			out.print(JSONUtil.serialize(map));
			out.flush();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	/*
	 * 管理员注册
	 */
	public String regist() {
		Admin admin = new Admin(this.adminInfo.getAdminName(),
				this.adminInfo.getPassword());
		boolean ret = adminService.register(admin);
		if (ret) {
			return "registSuccess";
		}
		return "registFailure";
	}

	/*
	 * 修改管理员密码
	 */
	public String editPassword() {
		if ((this.newPass).trim() != null) {
			this.adminService.updatePwd(newPass);
			return "editPasswordSuccess";
		} else {
			return "editPasswordFailure";
		}
	}

	public AdminService getAdminService() {
		return adminService;
	}

	@Resource
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	public AdminInfo getAdminInfo() {
		return adminInfo;
	}

	public void setAdminInfo(AdminInfo adminInfo) {
		this.adminInfo = adminInfo;
	}

	public AdminInfo getModel() {
		// TODO Auto-generated method stub
		return this.adminInfo;
	}

	public String getNewPass() {
		return newPass;
	}

	public void setNewPass(String newPass) {
		this.newPass = newPass;
	}

}
