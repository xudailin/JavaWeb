package edu.whut.entity;

import java.io.Serializable;

public class UserRole implements Serializable {

	private static final long serialVersionUID = -903319141216628798L;

    private Long id;

    private Long userId;

    private Long roleId;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

}
