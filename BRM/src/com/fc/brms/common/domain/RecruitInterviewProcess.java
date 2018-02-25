/**
 * Create Code By Zhenglh
 * Create Date : 2012.03.26
 * 
 */
package com.fc.brms.common.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class RecruitInterviewProcess implements Serializable {

	private static final long serialVersionUID = 1L;
	private int processId;
	private int companyId;
	private int trackId;
	private int interviewId;
	private Date interviewTime;
	private int interviewType;
	private int interviewersId;
	private String interviewersName;
	private String interviewers;
	private String interviewAddress;
	private int interviewResult;
	private int notifyEmployeeId;
	private String notifyEmployeeName;
	private String notifyEmployeePhone;
	private Date notifyTime;
	
	private UserTrackRecord userTrackRecord;

	public UserTrackRecord getUserTrackRecord() {
		return userTrackRecord;
	}

	public void setUserTrackRecord(UserTrackRecord userTrackRecord) {
		this.userTrackRecord = userTrackRecord;
	}

	public void setProcessId(int processId) {
		this.processId = processId;
	}

	public int getProcessId() {
		return this.processId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public int getCompanyId() {
		return this.companyId;
	}

	public void setTrackId(int trackId) {
		this.trackId = trackId;
	}

	public int getTrackId() {
		return this.trackId;
	}

	public void setInterviewId(int interviewId) {
		this.interviewId = interviewId;
	}

	public int getInterviewId() {
		return this.interviewId;
	}

	public void setInterviewTime(Date interviewTime) {
		this.interviewTime = interviewTime;
	}

	public Date getInterviewTime() {
		return this.interviewTime;
	}

	public void setInterviewType(int interviewType) {
		this.interviewType = interviewType;
	}

	public int getInterviewType() {
		return this.interviewType;
	}

	public void setInterviewersId(int interviewersId) {
		this.interviewersId = interviewersId;
	}

	public int getInterviewersId() {
		return this.interviewersId;
	}

	public void setInterviewersName(String interviewersName) {
		this.interviewersName = interviewersName;
	}

	public String getInterviewersName() {
		return this.interviewersName;
	}

	public void setInterviewers(String interviewers) {
		this.interviewers = interviewers;
	}

	public String getInterviewers() {
		return this.interviewers;
	}

	public void setInterviewAddress(String interviewAddress) {
		this.interviewAddress = interviewAddress;
	}

	public String getInterviewAddress() {
		return this.interviewAddress;
	}

	public void setInterviewResult(int interviewResult) {
		this.interviewResult = interviewResult;
	}

	public int getInterviewResult() {
		return this.interviewResult;
	}

	public void setNotifyEmployeeId(int notifyEmployeeId) {
		this.notifyEmployeeId = notifyEmployeeId;
	}

	public int getNotifyEmployeeId() {
		return this.notifyEmployeeId;
	}

	public void setNotifyEmployeeName(String notifyEmployeeName) {
		this.notifyEmployeeName = notifyEmployeeName;
	}

	public String getNotifyEmployeeName() {
		return this.notifyEmployeeName;
	}

	public void setNotifyEmployeePhone(String notifyEmployeePhone) {
		this.notifyEmployeePhone = notifyEmployeePhone;
	}

	public String getNotifyEmployeePhone() {
		return this.notifyEmployeePhone;
	}

	public void setNotifyTime(Date notifyTime) {
		this.notifyTime = notifyTime;
	}

	public Date getNotifyTime() {
		return this.notifyTime;
	}
}