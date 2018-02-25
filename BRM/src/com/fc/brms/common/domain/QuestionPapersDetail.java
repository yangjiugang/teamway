package com.fc.brms.common.domain;

import java.io.Serializable;
import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.fc.brms.common.conf.DateTimeSerializer;

public class QuestionPapersDetail implements Serializable {

	private static final long serialVersionUID = 1L;
	private int id;
	private int paperId;
	private int companyId;
	public int getCompanyId() {
		return companyId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	private int questionId;
	private int questionPoints;
	private int questionOrder;
	private Date createTime;
	private int createUser;
	private Date lastUpdateTime;
	private int lastUpdateUser;

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return this.id;
	}

	public void setPaperId(int paperId) {
		this.paperId = paperId;
	}

	public int getPaperId() {
		return this.paperId;
	}

	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}

	public int getQuestionId() {
		return this.questionId;
	}

	public void setQuestionPoints(int questionPoints) {
		this.questionPoints = questionPoints;
	}

	public int getQuestionPoints() {
		return this.questionPoints;
	}

	public void setQuestionOrder(int questionOrder) {
		this.questionOrder = questionOrder;
	}

	public int getQuestionOrder() {
		return this.questionOrder;
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
}