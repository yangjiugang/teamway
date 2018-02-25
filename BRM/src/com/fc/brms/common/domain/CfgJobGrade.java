package com.fc.brms.common.domain;

import java.io.Serializable;
import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.fc.brms.common.conf.DateTimeSerializer;

public class CfgJobGrade implements Serializable {

	private static final long serialVersionUID = 1L;
	private int jobGradeId;
	private String jobGradeNo;
	private String jobGradeName;
	private String jobGradeDesc;
	private Date createTime;
	private int createUser;
	private Date lastUpdateTime;
	private int lastUpdateUser;
	private int companyId;

	public void setJobGradeId(int jobGradeId) {
		this.jobGradeId = jobGradeId;
	}

	public int getJobGradeId() {
		return this.jobGradeId;
	}

	public void setJobGradeNo(String jobGradeNo) {
		this.jobGradeNo = jobGradeNo;
	}

	public String getJobGradeNo() {
		return this.jobGradeNo;
	}

	public void setJobGradeName(String jobGradeName) {
		this.jobGradeName = jobGradeName;
	}

	public String getJobGradeName() {
		return this.jobGradeName;
	}

	public void setJobGradeDesc(String jobGradeDesc) {
		this.jobGradeDesc = jobGradeDesc;
	}

	public String getJobGradeDesc() {
		return this.jobGradeDesc;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	@JsonSerialize(using=DateTimeSerializer.class)
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