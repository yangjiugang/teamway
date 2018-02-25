package com.fc.brms.common.domain;
import java.io.Serializable;
import java.util.Date;


public class QuestionPapersEmployees implements Serializable {

	private static final long serialVersionUID = 1L;
	private int id;
	private int testId;
	private int visitorId;
	private int isSubmit;
	private Date submitTime;
	private int score;
	private int isAvailabe=1;
	private int companyId;

	public int getCompanyId() {
		return companyId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return this.id;
	}

	public void setTestId(int testId) {
		this.testId = testId;
	}

	public int getTestId() {
		return this.testId;
	}

	public void setVisitorId(int visitorId) {
		this.visitorId = visitorId;
	}

	public int getVisitorId() {
		return this.visitorId;
	}

	public void setIsSubmit(int isSubmit) {
		this.isSubmit = isSubmit;
	}

	public int getIsSubmit() {
		return this.isSubmit;
	}

	public void setSubmitTime(Date submitTime) {
		this.submitTime = submitTime;
	}

	public Date getSubmitTime() {
		return this.submitTime;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getScore() {
		return this.score;
	}

	public void setIsAvailabe(int isAvailabe) {
		this.isAvailabe = isAvailabe;
	}

	public int getIsAvailabe() {
		return this.isAvailabe;
	}
}