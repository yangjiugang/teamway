package com.fc.flf.common.domain;

import java.io.Serializable;

public class HouseAroundSchool implements Serializable {

	private static final long serialVersionUID = 1L;
	private int schoolId;
	private int houseId;
	private int schoolType;
	private String houseSchoolDistence;
	private String houseSchoolDesc;

	public void setSchoolId(int schoolId) {
		this.schoolId = schoolId;
	}

	public int getSchoolId() {
		return this.schoolId;
	}

	public void setHouseId(int houseId) {
		this.houseId = houseId;
	}

	public int getHouseId() {
		return this.houseId;
	}

	public void setSchoolType(int schoolType) {
		this.schoolType = schoolType;
	}

	public int getSchoolType() {
		return this.schoolType;
	}

	public void setHouseSchoolDistence(String houseSchoolDistence) {
		this.houseSchoolDistence = houseSchoolDistence;
	}

	public String getHouseSchoolDistence() {
		return this.houseSchoolDistence;
	}

	public void setHouseSchoolDesc(String houseSchoolDesc) {
		this.houseSchoolDesc = houseSchoolDesc;
	}

	public String getHouseSchoolDesc() {
		return this.houseSchoolDesc;
	}
}