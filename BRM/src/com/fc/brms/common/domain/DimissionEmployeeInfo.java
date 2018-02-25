package com.fc.brms.common.domain;

import java.io.Serializable;

public class DimissionEmployeeInfo implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private EmployeeInfo employeeInfo;
	private UserTrackRecord userTrackRecord;
	
	public EmployeeInfo getEmployeeInfo() {
		return employeeInfo;
	}
	public void setEmployeeInfo(EmployeeInfo employeeInfo) {
		this.employeeInfo = employeeInfo;
	}
	public UserTrackRecord getUserTrackRecord() {
		return userTrackRecord;
	}
	public void setUserTrackRecord(UserTrackRecord userTrackRecord) {
		this.userTrackRecord = userTrackRecord;
	}
	

}
