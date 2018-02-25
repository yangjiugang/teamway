package com.fc.brms.common.domain;
import java.io.Serializable;
import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.fc.brms.common.conf.DateTimeSerializer;

public class TrainingUsers implements Serializable {

	private static final long serialVersionUID = 1L;
	private int id;
	private int companyId;
	private int employeeId;
	private int taskId;
	private Date trainingSignInTime;
	private String trainingSummarize;
	private String examResults;
	private String trainingEstimate;
	
	//
	private String userName;
	private String employeeNum;
	private String organizationName;
	private String postName;
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmployeeNum() {
		return employeeNum;
	}

	public void setEmployeeNum(String employeeNum) {
		this.employeeNum = employeeNum;
	}

	public String getOrganizationName() {
		return organizationName;
	}

	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName;
	}

	public String getPostName() {
		return postName;
	}

	public void setPostName(String postName) {
		this.postName = postName;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return this.id;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public int getCompanyId() {
		return this.companyId;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}

	public int getEmployeeId() {
		return this.employeeId;
	}

	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}

	public int getTaskId() {
		return this.taskId;
	}

	public void setTrainingSignInTime(Date trainingSignInTime) {
		this.trainingSignInTime = trainingSignInTime;
	}
	@JsonSerialize(using=DateTimeSerializer.class)
	public Date getTrainingSignInTime() {
		return this.trainingSignInTime;
	}

	public void setTrainingSummarize(String trainingSummarize) {
		this.trainingSummarize = trainingSummarize;
	}

	public String getTrainingSummarize() {
		return this.trainingSummarize;
	}

	public void setExamResults(String examResults) {
		this.examResults = examResults;
	}

	public String getExamResults() {
		return this.examResults;
	}

	public void setTrainingEstimate(String trainingEstimate) {
		this.trainingEstimate = trainingEstimate;
	}

	public String getTrainingEstimate() {
		return this.trainingEstimate;
	}
}