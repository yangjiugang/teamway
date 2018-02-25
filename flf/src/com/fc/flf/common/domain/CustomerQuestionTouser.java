package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;


public class CustomerQuestionTouser implements Serializable {

	private static final long serialVersionUID = 1L;
	private int questionId;
	private int userId;
	private int cusId;
	private String customerName;
	private String userName;
	private String questionContent;
	private Date questionTime;
	private String answerContent;
	private Date answerTime;

	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}

	public int getQuestionId() {
		return this.questionId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getUserId() {
		return this.userId;
	}

	public void setCusId(int cusId) {
		this.cusId = cusId;
	}

	public int getCusId() {
		return this.cusId;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerName() {
		return this.customerName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}

	public String getQuestionContent() {
		return this.questionContent;
	}

	public void setQuestionTime(Date questionTime) {
		this.questionTime = questionTime;
	}

	public Date getQuestionTime() {
		return this.questionTime;
	}

	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}

	public String getAnswerContent() {
		return this.answerContent;
	}

	public void setAnswerTime(Date answerTime) {
		this.answerTime = answerTime;
	}

	public Date getAnswerTime() {
		return this.answerTime;
	}
}