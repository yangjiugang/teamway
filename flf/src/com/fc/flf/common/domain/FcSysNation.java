package com.fc.flf.common.domain;

import java.io.Serializable;

public class FcSysNation implements Serializable {

	private static final long serialVersionUID = 1L;
	private int nationId;
	private int citizenshipId;
	private String nationName;
	private String column3;

	public void setNationId(int nationId) {
		this.nationId = nationId;
	}

	public int getNationId() {
		return this.nationId;
	}

	public void setCitizenshipId(int citizenshipId) {
		this.citizenshipId = citizenshipId;
	}

	public int getCitizenshipId() {
		return this.citizenshipId;
	}

	public void setNationName(String nationName) {
		this.nationName = nationName;
	}

	public String getNationName() {
		return this.nationName;
	}

	public void setColumn3(String column3) {
		this.column3 = column3;
	}

	public String getColumn3() {
		return this.column3;
	}
}