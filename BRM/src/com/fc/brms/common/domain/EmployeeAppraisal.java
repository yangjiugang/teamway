package com.fc.brms.common.domain;

import java.io.Serializable;
import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.fc.brms.common.conf.DateTimeSerializer;

public class EmployeeAppraisal implements Serializable {

	private static final long serialVersionUID = 1L;
	private int employeeId;
	private int companyId;
	private String appraisalStartDate;
	private String appraisalEndDate;
	private int appraisalResult;
	private int appraisalRate;
	private Date createDate;
	private int createUser;
	private String Limit;
	private String idOrName;
	private EmployeeInfo employeeInfo;

	
	public String getIdOrName() {
		return idOrName;
	}

	public void setIdOrName(String idOrName) {
		this.idOrName = idOrName;
	}

	public String getLimit() {
		return Limit;
	}

	public void setLimit(String limit) {
		Limit = limit;
	}

	public EmployeeInfo getEmployeeInfo() {
		return employeeInfo;
	}

	public void setEmployeeInfo(EmployeeInfo employeeInfo) {
		this.employeeInfo = employeeInfo;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}

	public int getEmployeeId() {
		return this.employeeId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public int getCompanyId() {
		return this.companyId;
	}

	public void setAppraisalStartDate(String appraisalStartDate) {
		this.appraisalStartDate = appraisalStartDate;
	}

	public String getAppraisalStartDate() {
		return this.appraisalStartDate;
	}

	public void setAppraisalEndDate(String appraisalEndDate) {
		this.appraisalEndDate = appraisalEndDate;
	}
	public String getAppraisalEndDate() {
		return this.appraisalEndDate;
	}

	public void setAppraisalResult(int appraisalResult) {
		this.appraisalResult = appraisalResult;
	}

	public int getAppraisalResult() {
		return this.appraisalResult;
	}

	public void setAppraisalRate(int appraisalRate) {
		this.appraisalRate = appraisalRate;
	}

	public int getAppraisalRate() {
		return this.appraisalRate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	@JsonSerialize(using=DateTimeSerializer.class)
	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateUser(int createUser) {
		this.createUser = createUser;
	}

	public int getCreateUser() {
		return this.createUser;
	}
}