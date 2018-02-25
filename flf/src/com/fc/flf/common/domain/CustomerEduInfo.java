package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;


public class CustomerEduInfo implements Serializable {

	private static final long serialVersionUID = 1L;
	private int eduId;
	private int cusId;
	private Date beginDate;
	private Date endDate;
	private String school;
	private String certifier;
	private String graduate;
	private String degree;

	public void setEduId(int eduId) {
		this.eduId = eduId;
	}

	public int getEduId() {
		return this.eduId;
	}

	public void setCusId(int cusId) {
		this.cusId = cusId;
	}

	public int getCusId() {
		return this.cusId;
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

	public void setCertifier(String certifier) {
		this.certifier = certifier;
	}

	public String getCertifier() {
		return this.certifier;
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