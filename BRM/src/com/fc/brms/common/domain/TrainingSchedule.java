package com.fc.brms.common.domain;
import java.io.Serializable;
import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.fc.brms.common.conf.DateTimeSerializer;

public class TrainingSchedule implements Serializable {

	private static final long serialVersionUID = 1L;
	private int scheduleId;
	private int companyId;
	private int taskId;
	private String courseName;
	private String teacher;
	private String teacherDesc;
	private Date scheduleStartTime;
	private Date scheduleEndTime;

	public void setScheduleId(int scheduleId) {
		this.scheduleId = scheduleId;
	}

	public int getScheduleId() {
		return this.scheduleId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public int getCompanyId() {
		return this.companyId;
	}

	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}

	public int getTaskId() {
		return this.taskId;
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

	public void setTeacherDesc(String teacherDesc) {
		this.teacherDesc = teacherDesc;
	}

	public String getTeacherDesc() {
		return this.teacherDesc;
	}

	public void setScheduleStartTime(Date scheduleStartTime) {
		this.scheduleStartTime = scheduleStartTime;
	}
	@JsonSerialize(using=DateTimeSerializer.class)
	public Date getScheduleStartTime() {
		return this.scheduleStartTime;
	}

	public void setScheduleEndTime(Date scheduleEndTime) {
		this.scheduleEndTime = scheduleEndTime;
	}
	@JsonSerialize(using=DateTimeSerializer.class)
	public Date getScheduleEndTime() {
		return this.scheduleEndTime;
	}
}