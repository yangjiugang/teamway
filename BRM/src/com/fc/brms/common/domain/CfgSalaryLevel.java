package com.fc.brms.common.domain;

import java.io.Serializable;
import java.util.Date;

public class CfgSalaryLevel implements Serializable {

	private static final long serialVersionUID = 1L;
	private int salaryLevelId;
	private int salaryLevelOrder;
	private int salary;
	private int salaryLevelDiff;
	private int jobGradeId;
	private int jobLevelId;
	private Date createTime;
	private int createUser;
	private Date lastUpdateTime;
	private int lastUpdateUser;
	private int companyId;

	public void setSalaryLevelId(int salaryLevelId) {
		this.salaryLevelId = salaryLevelId;
	}

	public int getSalaryLevelId() {
		return this.salaryLevelId;
	}

	public void setSalaryLevelOrder(int salaryLevelOrder) {
		this.salaryLevelOrder = salaryLevelOrder;
	}

	public int getSalaryLevelOrder() {
		return this.salaryLevelOrder;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	public int getSalary() {
		return this.salary;
	}

	public void setSalaryLevelDiff(int salaryLevelDiff) {
		this.salaryLevelDiff = salaryLevelDiff;
	}

	public int getSalaryLevelDiff() {
		return this.salaryLevelDiff;
	}

	public void setJobGradeId(int jobGradeId) {
		this.jobGradeId = jobGradeId;
	}

	public int getJobGradeId() {
		return this.jobGradeId;
	}

	public void setJobLevelId(int jobLevelId) {
		this.jobLevelId = jobLevelId;
	}

	public int getJobLevelId() {
		return this.jobLevelId;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateUser(int createUser) {
		this.createUser = createUser;
	}

	public int getCreateUser() {
		return this.createUser;
	}

	public void setLastUpdateTime(Date lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}

	public Date getLastUpdateTime() {
		return this.lastUpdateTime;
	}

	public void setLastUpdateUser(int lastUpdateUser) {
		this.lastUpdateUser = lastUpdateUser;
	}

	public int getLastUpdateUser() {
		return this.lastUpdateUser;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public int getCompanyId() {
		return this.companyId;
	}
}