package com.fc.flf.common.domain;

import java.io.Serializable;

public class FcSysRoleFunc implements Serializable {

	private static final long serialVersionUID = 1L;
	private int roleId;
	private int funcId;

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public int getRoleId() {
		return this.roleId;
	}

	public void setFuncId(int funcId) {
		this.funcId = funcId;
	}

	public int getFuncId() {
		return this.funcId;
	}
}