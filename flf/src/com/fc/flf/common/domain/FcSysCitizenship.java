package com.fc.flf.common.domain;

import java.io.Serializable;

public class FcSysCitizenship implements Serializable {

	private static final long serialVersionUID = 1L;
	private int citizenshipId;
	private String citizenshipName;
	private String column3;
	private String column4;

	public void setCitizenshipId(int citizenshipId) {
		this.citizenshipId = citizenshipId;
	}

	public int getCitizenshipId() {
		return this.citizenshipId;
	}

	public void setCitizenshipName(String citizenshipName) {
		this.citizenshipName = citizenshipName;
	}

	public String getCitizenshipName() {
		return this.citizenshipName;
	}

	public void setColumn3(String column3) {
		this.column3 = column3;
	}

	public String getColumn3() {
		return this.column3;
	}

	public void setColumn4(String column4) {
		this.column4 = column4;
	}

	public String getColumn4() {
		return this.column4;
	}
}