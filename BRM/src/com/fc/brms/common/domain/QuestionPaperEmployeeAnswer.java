package com.fc.brms.common.domain;

import java.io.Serializable;
import java.util.Date;

public class QuestionPaperEmployeeAnswer implements Serializable {

	private static final long serialVersionUID = 1L;
	private int id;
	private int visitorId;
	private int testId;
	private int questionId;
	private String answerContent;
	private int isRight=0;
	private int score;
	private Date answerTime;
	private int hostIp;
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

	public void setVisitorId(int visitorId) {
		this.visitorId = visitorId;
	}

	public int getVisitorId() {
		return this.visitorId;
	}

	public void setTestId(int testId) {
		this.testId = testId;
	}

	public int getTestId() {
		return this.testId;
	}

	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}

	public int getQuestionId() {
		return this.questionId;
	}

	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}

	public String getAnswerContent() {
		return this.answerContent;
	}

	public void setIsRight(int isRight) {
		this.isRight = isRight;
	}

	public int getIsRight() {
		return this.isRight;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getScore() {
		return this.score;
	}

	public void setAnswerTime(Date answerTime) {
		this.answerTime = answerTime;
	}

	public Date getAnswerTime() {
		return this.answerTime;
	}

	public void setHostIp(int hostIp) {
		this.hostIp = hostIp;
	}

	public int getHostIp() {
		return this.hostIp;
	}
}