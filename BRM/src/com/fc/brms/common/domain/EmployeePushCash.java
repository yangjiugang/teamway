package com.fc.brms.common.domain;

import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.fc.brms.common.conf.DateTimeSerializer;

public class EmployeePushCash {
private int pushId;
private int companyId;
private int employeeId;
private Date pushStartDate;
private Date pushEndDate;
private float pushMoney;
private String pushDesc;
private EmployeeInfo employeeInfo;
private Date createDate;
private int createUser;

public Date getCreateDate() {
	return createDate;
}
public void setCreateDate(Date createDate) {
	this.createDate = createDate;
}
public int getCreateUser() {
	return createUser;
}
public void setCreateUser(int createUser) {
	this.createUser = createUser;
}
public EmployeeInfo getEmployeeInfo() {
	return employeeInfo;
}
public void setEmployeeInfo(EmployeeInfo employeeInfo) {
	this.employeeInfo = employeeInfo;
}
public int getPushId() {
	return pushId;
}
public void setPushId(int pushId) {
	this.pushId = pushId;
}
public int getCompanyId() {
	return companyId;
}
public void setCompanyId(int companyId) {
	this.companyId = companyId;
}
public int getEmployeeId() {
	return employeeId;
}
public void setEmployeeId(int employeeId) {
	this.employeeId = employeeId;
}

@JsonSerialize(using=DateTimeSerializer.class)
public Date getPushStartDate() {
	return pushStartDate;
}
public void setPushStartDate(Date pushStartDate) {
	this.pushStartDate = pushStartDate;
}
@JsonSerialize(using=DateTimeSerializer.class)
public Date getPushEndDate() {
	return pushEndDate;
}
public void setPushEndDate(Date pushEndDate) {
	this.pushEndDate = pushEndDate;
}

public float getPushMoney() {
	return pushMoney;
}
public void setPushMoney(float pushMoney) {
	this.pushMoney = pushMoney;
}
public String getPushDesc() {
	return pushDesc;
}
public void setPushDesc(String pushDesc) {
	this.pushDesc = pushDesc;
}
}
