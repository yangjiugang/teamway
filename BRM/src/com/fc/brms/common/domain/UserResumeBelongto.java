package com.fc.brms.common.domain;

import java.io.Serializable;

public class UserResumeBelongto implements Serializable {

	private static final long serialVersionUID = 1L;
	private int userId;
	private int organizationId;
	private int companyId;
	private int userType;
	private int blackRedList;

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getUserId() {
		return this.userId;
	}

	public void setOrganizationId(int organizationId) {
		this.organizationId = organizationId;
	}

	public int getOrganizationId() {
		return this.organizationId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public int getCompanyId() {
		return this.companyId;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}

	public int getUserType() {
		return this.userType;
	}

	public void setBlackRedList(int blackRedList) {
		this.blackRedList = blackRedList;
	}

	public int getBlackRedList() {
		return this.blackRedList;
	}
}