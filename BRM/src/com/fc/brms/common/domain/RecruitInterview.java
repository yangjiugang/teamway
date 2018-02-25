/**
 * Create Code By Zhenglh
 * Create Date : 2012.03.26
 * Class Desc : 用户面试信息
 * 
 */
package com.fc.brms.common.domain;

import java.io.Serializable;
import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.fc.brms.common.conf.DateTimeSerializer;

public class RecruitInterview implements Serializable {

	private static final long serialVersionUID = 1L;
	/** **/
	private int interviewId;
	/** 公司ID**/
	private int companyId;
	/** 招聘任务ID**/
	private int taskId;
	/** 应征者姓名简历user_id**/
	private int userId;
	/** 面试轮次**/
	private int interviewCnt;
	/** 面试结果（不通过 0；通过 1；备选 2）**/
	private int interviewResult;
	/** 入职通知（0未通知；1 已通知）**/
	private int entryNotice;
	/** 约定入职日期**/
	private Date entryDate;
	/** 入职状态**/
	private int entryStatus;

	private UserResume userResume;
	private RecruitInterviewProcess recruitInterviewProcess;
	
	public UserResume getUserResume() {
		return userResume;
	}

	public void setUserResume(UserResume userResume) {
		this.userResume = userResume;
	}

	public RecruitInterviewProcess getRecruitInterviewProcess() {
		return recruitInterviewProcess;
	}

	public void setRecruitInterviewProcess(
			RecruitInterviewProcess recruitInterviewProcess) {
		this.recruitInterviewProcess = recruitInterviewProcess;
	}

	public void setInterviewId(int interviewId) {
		this.interviewId = interviewId;
	}

	public int getInterviewId() {
		return this.interviewId;
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

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getUserId() {
		return this.userId;
	}

	public void setInterviewCnt(int interviewCnt) {
		this.interviewCnt = interviewCnt;
	}

	public int getInterviewCnt() {
		return this.interviewCnt;
	}

	public void setInterviewResult(int interviewResult) {
		this.interviewResult = interviewResult;
	}

	public int getInterviewResult() {
		return this.interviewResult;
	}

	public void setEntryNotice(int entryNotice) {
		this.entryNotice = entryNotice;
	}

	public int getEntryNotice() {
		return this.entryNotice;
	}

	public void setEntryDate(Date entryDate) {
		this.entryDate = entryDate;
	}
	@JsonSerialize(using=DateTimeSerializer.class)
	public Date getEntryDate() {
		return this.entryDate;
	}

	public void setEntryStatus(int entryStatus) {
		this.entryStatus = entryStatus;
	}

	public int getEntryStatus() {
		return this.entryStatus;
	}
}