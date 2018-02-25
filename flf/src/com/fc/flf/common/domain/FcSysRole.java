package com.fc.flf.common.domain;

import java.io.Serializable;

public class FcSysRole implements Serializable {

	private static final long serialVersionUID = 1L;
	private int roleId;
	private String roleName;
	private String roleDesc;

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public int getRoleId() {
		return this.roleId;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleName() {
		return this.roleName;
	}

	public void setRoleDesc(String roleDesc) {
		this.roleDesc = roleDesc;
	}

	public String getRoleDesc() {
		return this.roleDesc;
	}
}