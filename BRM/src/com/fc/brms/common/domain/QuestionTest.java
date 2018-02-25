package com.fc.brms.common.domain;
import java.io.Serializable;
import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.fc.brms.common.conf.DateTimeSerializer;

public class QuestionTest implements Serializable {

	private static final long serialVersionUID = 1L;
	private int testId;
	private int paperId;
	private int companyId;
	private String testNum;
	private String testName;
	private int typeId;
	private Date testStartTime;
	private Date testEndTime;
	private int testDuration;
	private int testMethod;
	private String testDesc;
	private int testStatus;
	private int testUserCnt;
	private int testEnableCnt;
	private int testInitiateId;
	private String testInitiator;
	private int initiateDeptId;
	private String initiateDeptName;
	private int contactUserId;
	private String contactUserName;
	private Date createTime;
	private int createUser;
	private Date publishTime;
	private int publishUser;
	private int enableRate;
	private int testAnswer;
    private QuestionTestType questionTestType;
    private QuestionPapers questionPapers;
    private QuestionPapersEmployees qpe;
    private String limit;
    
    
	public int getCompanyId() {
		return companyId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public QuestionPapersEmployees getQpe() {
		return qpe;
	}

	public void setQpe(QuestionPapersEmployees qpe) {
		this.qpe = qpe;
	}

	public String getLimit() {
		return limit;
	}

	public void setLimit(String limit) {
		this.limit = limit;
	}

	public QuestionPapers getQuestionPapers() {
		return questionPapers;
	}

	public void setQuestionPapers(QuestionPapers questionPapers) {
		this.questionPapers = questionPapers;
	}

	public QuestionTestType getQuestionTestType() {
		return questionTestType;
	}

	public void setQuestionTestType(QuestionTestType questionTestType) {
		this.questionTestType = questionTestType;
	}

	public void setTestId(int testId) {
		this.testId = testId;
	}

	public int getTestId() {
		return this.testId;
	}

	public void setPaperId(int paperId) {
		this.paperId = paperId;
	}

	public int getPaperId() {
		return this.paperId;
	}

	public void setTestNum(String testNum) {
		this.testNum = testNum;
	}

	public String getTestNum() {
		return this.testNum;
	}

	public void setTestName(String testName) {
		this.testName = testName;
	}

	public String getTestName() {
		return this.testName;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	public int getTypeId() {
		return this.typeId;
	}

	public void setTestStartTime(Date testStartTime) {
		this.testStartTime = testStartTime;
	}
	
	@JsonSerialize(using=DateTimeSerializer.class)
	public Date getTestStartTime() {
		return this.testStartTime;
	}

	public void setTestEndTime(Date testEndTime) {
		this.testEndTime = testEndTime;
	}

	@JsonSerialize(using=DateTimeSerializer.class)
	public Date getTestEndTime() {
		return this.testEndTime;
	}

	public void setTestDuration(int testDuration) {
		this.testDuration = testDuration;
	}

	public int getTestDuration() {
		return this.testDuration;
	}

	public void setTestMethod(int testMethod) {
		this.testMethod = testMethod;
	}

	public int getTestMethod() {
		return this.testMethod;
	}

	public void setTestDesc(String testDesc) {
		this.testDesc = testDesc;
	}

	public String getTestDesc() {
		return this.testDesc;
	}

	public void setTestStatus(int testStatus) {
		this.testStatus = testStatus;
	}

	public int getTestStatus() {
		return this.testStatus;
	}

	public void setTestUserCnt(int testUserCnt) {
		this.testUserCnt = testUserCnt;
	}

	public int getTestUserCnt() {
		return this.testUserCnt;
	}

	public void setTestEnableCnt(int testEnableCnt) {
		this.testEnableCnt = testEnableCnt;
	}

	public int getTestEnableCnt() {
		return this.testEnableCnt;
	}

	public void setTestInitiateId(int testInitiateId) {
		this.testInitiateId = testInitiateId;
	}

	public int getTestInitiateId() {
		return this.testInitiateId;
	}

	public void setTestInitiator(String testInitiator) {
		this.testInitiator = testInitiator;
	}

	public String getTestInitiator() {
		return this.testInitiator;
	}

	public void setInitiateDeptId(int initiateDeptId) {
		this.initiateDeptId = initiateDeptId;
	}

	public int getInitiateDeptId() {
		return this.initiateDeptId;
	}

	public void setInitiateDeptName(String initiateDeptName) {
		this.initiateDeptName = initiateDeptName;
	}

	public String getInitiateDeptName() {
		return this.initiateDeptName;
	}

	public void setContactUserId(int contactUserId) {
		this.contactUserId = contactUserId;
	}

	public int getContactUserId() {
		return this.contactUserId;
	}

	public void setContactUserName(String contactUserName) {
		this.contactUserName = contactUserName;
	}

	public String getContactUserName() {
		return this.contactUserName;
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

	public void setPublishTime(Date publishTime) {
		this.publishTime = publishTime;
	}
	@JsonSerialize(using=DateTimeSerializer.class)
	public Date getPublishTime() {
		return this.publishTime;
	}

	public void setPublishUser(int publishUser) {
		this.publishUser = publishUser;
	}

	public int getPublishUser() {
		return this.publishUser;
	}

	public void setEnableRate(int enableRate) {
		this.enableRate = enableRate;
	}

	public int getEnableRate() {
		return this.enableRate;
	}

	public void setTestAnswer(int testAnswer) {
		this.testAnswer = testAnswer;
	}

	public int getTestAnswer() {
		return this.testAnswer;
	}
}