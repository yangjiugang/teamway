package com.fc.brms.common.domain;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.fc.brms.common.conf.DateTimeSerializer;

public class TrainingTask implements Serializable {

	private static final long serialVersionUID = 1L;
	private int taskId;
	private int companyId;
	private String taskNum;
	private String taskName;
	private int taskType;
	private String taskPurpose;
	private int trainingContentTypeId;
	private int testId;
	private Date trainingStartTime;
	private Date trainingEndTime;
	private String trainingDesc;
	private int organizationId;
	private String organizationalUnit;
	private int sponsorId;
	private String sponsor;
	private String taskPlace;
	private int userId;
	private String contactPersonName;
	private String contactPersonPhone;
	private int taskStatus;
	private int planEmployees;
	private int actualEmployees;
	private Date createTime;
	private int createUser;
	private Date lastUpdateTime;
	private int lastUpdateUser;
	private List<TrainingAttachment> trainAttachments;
	private List<TrainingSchedule>	schedules;
	private List<TrainingUsers>	trainingUsers;
	private String teacher;
	private String flag ;
	private TrainingSchedule ts;
	private TrainingContentType tct;
	
	public List<TrainingUsers> getTrainingUsers() {
		return trainingUsers;
	}

	public void setTrainingUsers(List<TrainingUsers> trainingUsers) {
		this.trainingUsers = trainingUsers;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getTaskPlace() {
		return taskPlace;
	}

	public void setTaskPlace(String taskPlace) {
		this.taskPlace = taskPlace;
	}

	public TrainingSchedule getTs() {
		return ts;
	}

	public void setTs(TrainingSchedule ts) {
		this.ts = ts;
	}

	public TrainingContentType getTct() {
		return tct;
	}

	public void setTct(TrainingContentType tct) {
		this.tct = tct;
	}

	public String getTeacher() {
		return teacher;
	}

	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}

	public List<TrainingAttachment> getTrainAttachments() {
		return trainAttachments;
	}

	public void setTrainAttachments(List<TrainingAttachment> trainAttachments) {
		this.trainAttachments = trainAttachments;
	}

	public List<TrainingSchedule> getSchedules() {
		return schedules;
	}

	public void setSchedules(List<TrainingSchedule> schedules) {
		this.schedules = schedules;
	}

	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}

	public int getTaskId() {
		return this.taskId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public int getCompanyId() {
		return this.companyId;
	}

	public void setTaskNum(String taskNum) {
		this.taskNum = taskNum;
	}

	public String getTaskNum() {
		return this.taskNum;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	public String getTaskName() {
		return this.taskName;
	}

	public void setTaskType(int taskType) {
		this.taskType = taskType;
	}

	public int getTaskType() {
		return this.taskType;
	}

	public void setTaskPurpose(String taskPurpose) {
		this.taskPurpose = taskPurpose;
	}

	public String getTaskPurpose() {
		return this.taskPurpose;
	}

	public void setTrainingContentTypeId(int trainingContentTypeId) {
		this.trainingContentTypeId = trainingContentTypeId;
	}

	public int getTrainingContentTypeId() {
		return this.trainingContentTypeId;
	}

	public void setTestId(int testId) {
		this.testId = testId;
	}

	public int getTestId() {
		return this.testId;
	}

	public void setTrainingStartTime(Date trainingStartTime) {
		this.trainingStartTime = trainingStartTime;
	}
	@JsonSerialize(using=DateTimeSerializer.class)
	public Date getTrainingStartTime() {
		return this.trainingStartTime;
	}

	public void setTrainingEndTime(Date trainingEndTime) {
		this.trainingEndTime = trainingEndTime;
	}
	@JsonSerialize(using=DateTimeSerializer.class)
	public Date getTrainingEndTime() {
		return this.trainingEndTime;
	}

	public void setTrainingDesc(String trainingDesc) {
		this.trainingDesc = trainingDesc;
	}

	public String getTrainingDesc() {
		return this.trainingDesc;
	}

	public void setOrganizationId(int organizationId) {
		this.organizationId = organizationId;
	}

	public int getOrganizationId() {
		return this.organizationId;
	}

	public void setOrganizationalUnit(String organizationalUnit) {
		this.organizationalUnit = organizationalUnit;
	}

	public String getOrganizationalUnit() {
		return this.organizationalUnit;
	}

	public void setSponsorId(int sponsorId) {
		this.sponsorId = sponsorId;
	}

	public int getSponsorId() {
		return this.sponsorId;
	}

	public void setSponsor(String sponsor) {
		this.sponsor = sponsor;
	}

	public String getSponsor() {
		return this.sponsor;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getUserId() {
		return this.userId;
	}

	public void setContactPersonName(String contactPersonName) {
		this.contactPersonName = contactPersonName;
	}

	public String getContactPersonName() {
		return this.contactPersonName;
	}

	public void setContactPersonPhone(String contactPersonPhone) {
		this.contactPersonPhone = contactPersonPhone;
	}

	public String getContactPersonPhone() {
		return this.contactPersonPhone;
	}

	public void setTaskStatus(int taskStatus) {
		this.taskStatus = taskStatus;
	}

	public int getTaskStatus() {
		return this.taskStatus;
	}

	public void setPlanEmployees(int planEmployees) {
		this.planEmployees = planEmployees;
	}

	public int getPlanEmployees() {
		return this.planEmployees;
	}

	public void setActualEmployees(int actualEmployees) {
		this.actualEmployees = actualEmployees;
	}

	public int getActualEmployees() {
		return this.actualEmployees;
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