package com.fc.brms.common.domain;

import java.io.Serializable;
import java.util.Date;

public class FcSysVisitor implements Serializable {

	private static final long serialVersionUID = 1L;
	private int visitorId;
	private int companyId;
	private String visitorName;
	private String visitorPassword;
	private Date registerTime;
	private int userStatus;
	private String companyName;
	private int organizationId;
	private String organizationName;
	
	public int getOrganizationId() {
		return organizationId;
	}

	public void setOrganizationId(int organizationId) {
		this.organizationId = organizationId;
	}

	public String getOrganizationName() {
		return organizationName;
	}

	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName;
	}

	public void setVisitorId(int visitorId) {
		this.visitorId = visitorId;
	}

	public int getVisitorId() {
		return this.visitorId;
	}

	public int getCompanyId() {
		return companyId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public void setVisitorName(String visitorName) {
		this.visitorName = visitorName;
	}

	public String getVisitorName() {
		return this.visitorName;
	}

	public void setVisitorPassword(String visitorPassword) {
		this.visitorPassword = visitorPassword;
	}

	public String getVisitorPassword() {
		return this.visitorPassword;
	}

	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}

	public Date getRegisterTime() {
		return this.registerTime;
	}

	public void setUserStatus(int userStatus) {
		this.userStatus = userStatus;
	}

	public int getUserStatus() {
		return this.userStatus;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	
}