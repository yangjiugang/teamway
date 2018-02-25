package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;

public class UserEduInfo implements Serializable {

	private static final long serialVersionUID = 1L;
	private int eduId;
	private int userId;
	private Date beginDate;
	private Date endDate;
	private String school;
	private String profession;
	private String graduate;
	private String degree;

	public void setEduId(int eduId) {
		this.eduId = eduId;
	}

	public int getEduId() {
		return this.eduId;
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

	public void setSchool(String school) {
		this.school = school;
	}

	public String getSchool() {
		return this.school;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}

	public String getProfession() {
		return this.profession;
	}

	public void setGraduate(String graduate) {
		this.graduate = graduate;
	}

	public String getGraduate() {
		return this.graduate;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	public String getDegree() {
		return this.degree;
	}
}