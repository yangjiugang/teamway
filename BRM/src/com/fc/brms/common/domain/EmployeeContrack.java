package com.fc.brms.common.domain;

import java.io.Serializable;

public class EmployeeContrack implements Serializable {

	private static final long serialVersionUID = 1L;
	private int contrackId;
	private int employeeId;
	private int contractType;
	private String contractNum;
	private String contractDoc;

	public void setContrackId(int contrackId) {
		this.contrackId = contrackId;
	}

	public int getContrackId() {
		return this.contrackId;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}

	public int getEmployeeId() {
		return this.employeeId;
	}

	public void setContractType(int contractType) {
		this.contractType = contractType;
	}

	public int getContractType() {
		return this.contractType;
	}

	public void setContractNum(String contractNum) {
		this.contractNum = contractNum;
	}

	public String getContractNum() {
		return this.contractNum;
	}

	public void setContractDoc(String contractDoc) {
		this.contractDoc = contractDoc;
	}

	public String getContractDoc() {
		return this.contractDoc;
	}
}