package com.fc.brms.common.domain;

import java.io.Serializable;

public class FcSysRoleFunc implements Serializable {

	private static final long serialVersionUID = 1L;
	private int roleId;
	private int funcId;
	private int companyId;

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

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public int getCompanyId() {
		return this.companyId;
	}
}