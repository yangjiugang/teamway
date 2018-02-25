package com.fc.brms.common.domain;

import java.io.Serializable;
import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.fc.brms.common.conf.DateTimeSerializer;

public class EmployeeTalkRecord implements Serializable {

	private static final long serialVersionUID = 1L;
	private int talkId;
	private int companyId;
	private String talkNum;
	private int surveyType;
	private int talkToOrganizationId;
	private String talkToOrganizationName;
	private int talkToPostId;
	private String talkToPostName;
	private int talkToEmployee;
	private String talkToEmployeeName;
	private int relationships;
	private int surveyOrganizationId;
	private String surveyOrganizationName;
	private int surveyPostId;
	private String surveyPostName;
	private int surveyEmployee;
	private String surveyEmployeeName;
	private int mainTalkOrganizationId;
	private String mainTalkOrganizationName;
	private int mainTalkPostId;
	private String mainTalkPostName;
	private int mainTalkEmployee;
	private String mainTalkEmployeeName;
	private Date planTalkTime;
	private Date startTime;
	private Date endTime;
	private int talkType;
	private String talkPlace;
	private String talkEstimate;
	private int stableProcess;
	private Date createTime;
	private FcSysMsg fcSysMsg;
	private String msgContent;
	private String talkToEmployeeNum;
	private String surveyEmployeeNum;
	private String mainTalkEmployeeNum;
	private EmployeeTalkContent employeeTalkContent;
	

	public EmployeeTalkContent getEmployeeTalkContent() {
		return employeeTalkContent;
	}

	public void setEmployeeTalkContent(EmployeeTalkContent employeeTalkContent) {
		this.employeeTalkContent = employeeTalkContent;
	}

	public String getTalkToEmployeeNum() {
		return talkToEmployeeNum;
	}

	public void setTalkToEmployeeNum(String talkToEmployeeNum) {
		this.talkToEmployeeNum = talkToEmployeeNum;
	}

	public String getSurveyEmployeeNum() {
		return surveyEmployeeNum;
	}

	public void setSurveyEmployeeNum(String surveyEmployeeNum) {
		this.surveyEmployeeNum = surveyEmployeeNum;
	}

	public String getMainTalkEmployeeNum() {
		return mainTalkEmployeeNum;
	}

	public void setMainTalkEmployeeNum(String mainTalkEmployeeNum) {
		this.mainTalkEmployeeNum = mainTalkEmployeeNum;
	}

	public String getMsgContent() {
		return msgContent;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}

	public FcSysMsg getFcSysMsg() {
		return fcSysMsg;
	}

	public void setFcSysMsg(FcSysMsg fcSysMsg) {
		this.fcSysMsg = fcSysMsg;
	}

	public void setTalkId(int talkId) {
		this.talkId = talkId;
	}

	public int getTalkId() {
		return this.talkId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public int getCompanyId() {
		return this.companyId;
	}

	public void setTalkNum(String talkNum) {
		this.talkNum = talkNum;
	}

	public String getTalkNum() {
		return this.talkNum;
	}

	public void setSurveyType(int surveyType) {
		this.surveyType = surveyType;
	}

	public int getSurveyType() {
		return this.surveyType;
	}

	public void setTalkToOrganizationId(int talkToOrganizationId) {
		this.talkToOrganizationId = talkToOrganizationId;
	}

	public int getTalkToOrganizationId() {
		return this.talkToOrganizationId;
	}

	public void setTalkToOrganizationName(String talkToOrganizationName) {
		this.talkToOrganizationName = talkToOrganizationName;
	}

	public String getTalkToOrganizationName() {
		return this.talkToOrganizationName;
	}

	public void setTalkToPostId(int talkToPostId) {
		this.talkToPostId = talkToPostId;
	}

	public int getTalkToPostId() {
		return this.talkToPostId;
	}

	public void setTalkToPostName(String talkToPostName) {
		this.talkToPostName = talkToPostName;
	}

	public String getTalkToPostName() {
		return this.talkToPostName;
	}

	public void setTalkToEmployee(int talkToEmployee) {
		this.talkToEmployee = talkToEmployee;
	}

	public int getTalkToEmployee() {
		return this.talkToEmployee;
	}

	public void setTalkToEmployeeName(String talkToEmployeeName) {
		this.talkToEmployeeName = talkToEmployeeName;
	}

	public String getTalkToEmployeeName() {
		return this.talkToEmployeeName;
	}

	public void setRelationships(int relationships) {
		this.relationships = relationships;
	}

	public int getRelationships() {
		return this.relationships;
	}

	public void setSurveyOrganizationId(int surveyOrganizationId) {
		this.surveyOrganizationId = surveyOrganizationId;
	}

	public int getSurveyOrganizationId() {
		return this.surveyOrganizationId;
	}

	public void setSurveyOrganizationName(String surveyOrganizationName) {
		this.surveyOrganizationName = surveyOrganizationName;
	}

	public String getSurveyOrganizationName() {
		return this.surveyOrganizationName;
	}

	public void setSurveyPostId(int surveyPostId) {
		this.surveyPostId = surveyPostId;
	}

	public int getSurveyPostId() {
		return this.surveyPostId;
	}

	public void setSurveyPostName(String surveyPostName) {
		this.surveyPostName = surveyPostName;
	}

	public String getSurveyPostName() {
		return this.surveyPostName;
	}

	public void setSurveyEmployee(int surveyEmployee) {
		this.surveyEmployee = surveyEmployee;
	}

	public int getSurveyEmployee() {
		return this.surveyEmployee;
	}

	public void setSurveyEmployeeName(String surveyEmployeeName) {
		this.surveyEmployeeName = surveyEmployeeName;
	}

	public String getSurveyEmployeeName() {
		return this.surveyEmployeeName;
	}

	public void setMainTalkOrganizationId(int mainTalkOrganizationId) {
		this.mainTalkOrganizationId = mainTalkOrganizationId;
	}

	public int getMainTalkOrganizationId() {
		return this.mainTalkOrganizationId;
	}

	public void setMainTalkOrganizationName(String mainTalkOrganizationName) {
		this.mainTalkOrganizationName = mainTalkOrganizationName;
	}

	public String getMainTalkOrganizationName() {
		return this.mainTalkOrganizationName;
	}

	public void setMainTalkPostId(int mainTalkPostId) {
		this.mainTalkPostId = mainTalkPostId;
	}

	public int getMainTalkPostId() {
		return this.mainTalkPostId;
	}

	public void setMainTalkPostName(String mainTalkPostName) {
		this.mainTalkPostName = mainTalkPostName;
	}

	public String getMainTalkPostName() {
		return this.mainTalkPostName;
	}

	public void setMainTalkEmployee(int mainTalkEmployee) {
		this.mainTalkEmployee = mainTalkEmployee;
	}

	public int getMainTalkEmployee() {
		return this.mainTalkEmployee;
	}

	public void setMainTalkEmployeeName(String mainTalkEmployeeName) {
		this.mainTalkEmployeeName = mainTalkEmployeeName;
	}

	public String getMainTalkEmployeeName() {
		return this.mainTalkEmployeeName;
	}

	public void setPlanTalkTime(Date planTalkTime) {
		this.planTalkTime = planTalkTime;
	}

	@JsonSerialize(using=DateTimeSerializer.class)
	public Date getPlanTalkTime() {
		return this.planTalkTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	@JsonSerialize(using=DateTimeSerializer.class)
	public Date getStartTime() {
		return this.startTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	@JsonSerialize(using=DateTimeSerializer.class)
	public Date getEndTime() {
		return this.endTime;
	}

	public void setTalkType(int talkType) {
		this.talkType = talkType;
	}

	public int getTalkType() {
		return this.talkType;
	}

	public void setTalkPlace(String talkPlace) {
		this.talkPlace = talkPlace;
	}

	public String getTalkPlace() {
		return this.talkPlace;
	}

	public void setTalkEstimate(String talkEstimate) {
		this.talkEstimate = talkEstimate;
	}

	public String getTalkEstimate() {
		return this.talkEstimate;
	}

	public void setStableProcess(int stableProcess) {
		this.stableProcess = stableProcess;
	}

	public int getStableProcess() {
		return this.stableProcess;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@JsonSerialize(using=DateTimeSerializer.class)
	public Date getCreateTime() {
		return this.createTime;
	}
}