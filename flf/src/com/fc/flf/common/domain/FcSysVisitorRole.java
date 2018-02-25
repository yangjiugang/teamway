package com.fc.flf.common.domain;

import java.io.Serializable;

public class FcSysVisitorRole implements Serializable {

	private static final long serialVersionUID = 1L;
	private int roleId;
	private int visitorId;

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public int getRoleId() {
		return this.roleId;
	}

	public void setVisitorId(int visitorId) {
		this.visitorId = visitorId;
	}

	public int getVisitorId() {
		return this.visitorId;
	}
}