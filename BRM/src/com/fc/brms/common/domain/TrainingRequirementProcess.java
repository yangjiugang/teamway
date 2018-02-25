package com.fc.brms.common.domain;

import java.io.Serializable;
import java.util.Date;

public class TrainingRequirementProcess implements Serializable {

	private static final long serialVersionUID = 1L;
	private int processId;
	private int requirementId;
	private int approveUserId;
	private String approveUserName;
	private Date approveTime;
	private int approveResult;
	private String approveDesc;

	public void setProcessId(int processId) {
		this.processId = processId;
	}

	public int getProcessId() {
		return this.processId;
	}

	public void setRequirementId(int requirementId) {
		this.requirementId = requirementId;
	}

	public int getRequirementId() {
		return this.requirementId;
	}

	public void setApproveUserId(int approveUserId) {
		this.approveUserId = approveUserId;
	}

	public int getApproveUserId() {
		return this.approveUserId;
	}

	public void setApproveUserName(String approveUserName) {
		this.approveUserName = approveUserName;
	}

	public String getApproveUserName() {
		return this.approveUserName;
	}

	public void setApproveTime(Date approveTime) {
		this.approveTime = approveTime;
	}

	public Date getApproveTime() {
		return this.approveTime;
	}

	public void setApproveResult(int approveResult) {
		this.approveResult = approveResult;
	}

	public int getApproveResult() {
		return this.approveResult;
	}

	public void setApproveDesc(String approveDesc) {
		this.approveDesc = approveDesc;
	}

	public String getApproveDesc() {
		return this.approveDesc;
	}
}