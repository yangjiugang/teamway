package com.fc.brms.common.domain;
import java.io.Serializable;
import java.util.Date;

public class TrainingRequirement implements Serializable {

	private static final long serialVersionUID = 1L;
	private int requirementId;
	private String requirementNum;
	private String courseNum;
	private String courseName;
	private String teacher;
	private Date trainingStartTime;
	private Date trainingEndTime;
	private String trainingDesc;
	private String trainingUsers;
	private int architectureId;
	private String organizationalUnit;
	private int userId;
	private String contactPersonName;
	private String contactPersonPhone;
	private Date requireTime;
	private int requireUserId;
	private String teacherDesc;

	public void setRequirementId(int requirementId) {
		this.requirementId = requirementId;
	}

	public int getRequirementId() {
		return this.requirementId;
	}

	public void setRequirementNum(String requirementNum) {
		this.requirementNum = requirementNum;
	}

	public String getRequirementNum() {
		return this.requirementNum;
	}

	public void setCourseNum(String courseNum) {
		this.courseNum = courseNum;
	}

	public String getCourseNum() {
		return this.courseNum;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getCourseName() {
		return this.courseName;
	}

	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}

	public String getTeacher() {
		return this.teacher;
	}

	public void setTrainingStartTime(Date trainingStartTime) {
		this.trainingStartTime = trainingStartTime;
	}

	public Date getTrainingStartTime() {
		return this.trainingStartTime;
	}

	public void setTrainingEndTime(Date trainingEndTime) {
		this.trainingEndTime = trainingEndTime;
	}

	public Date getTrainingEndTime() {
		return this.trainingEndTime;
	}

	public void setTrainingDesc(String trainingDesc) {
		this.trainingDesc = trainingDesc;
	}

	public String getTrainingDesc() {
		return this.trainingDesc;
	}

	public void setTrainingUsers(String trainingUsers) {
		this.trainingUsers = trainingUsers;
	}

	public String getTrainingUsers() {
		return this.trainingUsers;
	}

	public void setArchitectureId(int architectureId) {
		this.architectureId = architectureId;
	}

	public int getArchitectureId() {
		return this.architectureId;
	}

	public void setOrganizationalUnit(String organizationalUnit) {
		this.organizationalUnit = organizationalUnit;
	}

	public String getOrganizationalUnit() {
		return this.organizationalUnit;
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

	public void setRequireTime(Date requireTime) {
		this.requireTime = requireTime;
	}

	public Date getRequireTime() {
		return this.requireTime;
	}

	public void setRequireUserId(int requireUserId) {
		this.requireUserId = requireUserId;
	}

	public int getRequireUserId() {
		return this.requireUserId;
	}

	public void setTeacherDesc(String teacherDesc) {
		this.teacherDesc = teacherDesc;
	}

	public String getTeacherDesc() {
		return this.teacherDesc;
	}
}