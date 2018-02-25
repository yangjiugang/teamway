package com.fc.brms.common.domain;

import java.io.Serializable;
import java.util.Date;


public class CfgJobLevel implements Serializable {

	private static final long serialVersionUID = 1L;
	private int jobLevelId;
	private String jobLevelName;
	private int jobLevelOrder;
	private int jobGradeId;
	private int lowestSalaryLevel;
	private int highestSalaryLevel;
	private Date createTime;
	private int createUser;
	private Date lastUpdateTime;
	private int lastUpdateUser;
	private int companyId;

	public void setJobLevelId(int jobLevelId) {
		this.jobLevelId = jobLevelId;
	}

	public int getJobLevelId() {
		return this.jobLevelId;
	}

	public void setJobLevelName(String jobLevelName) {
		this.jobLevelName = jobLevelName;
	}

	public String getJobLevelName() {
		return this.jobLevelName;
	}

	public void setJobLevelOrder(int jobLevelOrder) {
		this.jobLevelOrder = jobLevelOrder;
	}

	public int getJobLevelOrder() {
		return this.jobLevelOrder;
	}

	public void setJobGradeId(int jobGradeId) {
		this.jobGradeId = jobGradeId;
	}

	public int getJobGradeId() {
		return this.jobGradeId;
	}

	public void setLowestSalaryLevel(int lowestSalaryLevel) {
		this.lowestSalaryLevel = lowestSalaryLevel;
	}

	public int getLowestSalaryLevel() {
		return this.lowestSalaryLevel;
	}

	public void setHighestSalaryLevel(int highestSalaryLevel) {
		this.highestSalaryLevel = highestSalaryLevel;
	}

	public int getHighestSalaryLevel() {
		return this.highestSalaryLevel;
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