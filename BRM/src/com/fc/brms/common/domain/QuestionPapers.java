package com.fc.brms.common.domain;
import java.io.Serializable;
import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.fc.brms.common.conf.DateTimeSerializer;

public class QuestionPapers implements Serializable {

	private static final long serialVersionUID = 1L;
	private int paperId;
	private int companyId;
	private String paperNum;
	private String paperName;
	private int typeId;
	private String paperDesc;
	private int totalPoints;
	private int paperQuestions;
	private int paperStatus;
	private int paperUsed;
	private Date createTime;
	private int createUser;
	private Date lastUpdateTime;
	private int lastUpdateUser;
    private QuestionPaperType questionPaperType;
    
	public int getCompanyId() {
		return companyId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public QuestionPaperType getQuestionPaperType() {
		return questionPaperType;
	}

	public void setQuestionPaperType(QuestionPaperType questionPaperType) {
		this.questionPaperType = questionPaperType;
	}

	public void setPaperId(int paperId) {
		this.paperId = paperId;
	}

	public int getPaperId() {
		return this.paperId;
	}

	public void setPaperNum(String paperNum) {
		this.paperNum = paperNum;
	}

	public String getPaperNum() {
		return this.paperNum;
	}

	public void setPaperName(String paperName) {
		this.paperName = paperName;
	}

	public String getPaperName() {
		return this.paperName;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	public int getTypeId() {
		return this.typeId;
	}

	public void setPaperDesc(String paperDesc) {
		this.paperDesc = paperDesc;
	}

	public String getPaperDesc() {
		return this.paperDesc;
	}

	public void setTotalPoints(int totalPoints) {
		this.totalPoints = totalPoints;
	}

	public int getTotalPoints() {
		return this.totalPoints;
	}

	public void setPaperQuestions(int paperQuestions) {
		this.paperQuestions = paperQuestions;
	}

	public int getPaperQuestions() {
		return this.paperQuestions;
	}

	public void setPaperStatus(int paperStatus) {
		this.paperStatus = paperStatus;
	}

	public int getPaperStatus() {
		return this.paperStatus;
	}

	public void setPaperUsed(int paperUsed) {
		this.paperUsed = paperUsed;
	}

	public int getPaperUsed() {
		return this.paperUsed;
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