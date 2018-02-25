package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;

public class UserWorkExperience implements Serializable {

	private static final long serialVersionUID = 1L;
	private int workId;
	private int userId;
	private Date beginDate;
	private Date endDate;
	private String workCompany;
	private String jobDuty;
	private String reference;
	private String contactPhone;
	private String workDesc;
	

	public String getWorkDesc() {
		return workDesc;
	}

	public void setWorkDesc(String workDesc) {
		this.workDesc = workDesc;
	}

	public void setWorkId(int workId) {
		this.workId = workId;
	}

	public int getWorkId() {
		return this.workId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getUserId() {
		return this.userId;
	}

	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}

	public Date getBeginDate() {
		return this.beginDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Date getEndDate() {
		return this.endDate;
	}

	public void setWorkCompany(String workCompany) {
		this.workCompany = workCompany;
	}

	public String getWorkCompany() {
		return this.workCompany;
	}

	public void setJobDuty(String jobDuty) {
		this.jobDuty = jobDuty;
	}

	public String getJobDuty() {
		return this.jobDuty;
	}

	public void setReference(String reference) {
		this.reference = reference;
	}

	public String getReference() {
		return this.reference;
	}

	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}

	public String getContactPhone() {
		return this.contactPhone;
	}
}