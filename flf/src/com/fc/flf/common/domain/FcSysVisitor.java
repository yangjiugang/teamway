package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;

public class FcSysVisitor implements Serializable {

	private static final long serialVersionUID = 1L;
	private int visitorId;
	private String visitorName;
	private String visitorPassword;
	private String firstName;
	private int sex = -1;
	private String email;
	private String phone;
	private int visitorStatus;
	private String visitorType;
	private Date loginTime;
	private String loginIp;
	private int isOnline;
	private Date registerTime;
	private Date expriedDate;

	public void setVisitorId(int visitorId) {
		this.visitorId = visitorId;
	}

	public int getVisitorId() {
		return this.visitorId;
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

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	
	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmail() {
		return this.email;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setVisitorStatus(int visitorStatus) {
		this.visitorStatus = visitorStatus;
	}

	public int getVisitorStatus() {
		return this.visitorStatus;
	}

	public void setVisitorType(String visitorType) {
		this.visitorType = visitorType;
	}

	public String getVisitorType() {
		return this.visitorType;
	}

	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}

	public Date getLoginTime() {
		return this.loginTime;
	}

	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}

	public String getLoginIp() {
		return this.loginIp;
	}

	public int getIsOnline() {
		return isOnline;
	}

	public void setIsOnline(int isOnline) {
		this.isOnline = isOnline;
	}
	
	public Date getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}

	public void setExpriedDate(Date expriedDate) {
		this.expriedDate = expriedDate;
	}

	public Date getExpriedDate() {
		return this.expriedDate;
	}
}