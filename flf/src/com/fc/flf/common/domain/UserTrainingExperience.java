package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;

public class UserTrainingExperience implements Serializable {

	private static final long serialVersionUID = 1L;
	private int trainingId;
	private int userId;
	private Date beginDate;
	private Date endDate;
	private String trainingCompany;
	private String trainingAddress;
	private String profession;
	private int havePassport;
	private String title;
	private String trainingDesc;

	public String getTrainingDesc() {
		return trainingDesc;
	}

	public void setTrainingDesc(String trainingDesc) {
		this.trainingDesc = trainingDesc;
	}

	public void setTrainingId(int trainingId) {
		this.trainingId = trainingId;
	}

	public int getTrainingId() {
		return this.trainingId;
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

	public void setTrainingCompany(String trainingCompany) {
		this.trainingCompany = trainingCompany;
	}

	public String getTrainingCompany() {
		return this.trainingCompany;
	}

	public void setTrainingAddress(String trainingAddress) {
		this.trainingAddress = trainingAddress;
	}

	public String getTrainingAddress() {
		return this.trainingAddress;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}

	public String getProfession() {
		return this.profession;
	}

	public void setHavePassport(int havePassport) {
		this.havePassport = havePassport;
	}

	public int getHavePassport() {
		return this.havePassport;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTitle() {
		return this.title;
	}
}