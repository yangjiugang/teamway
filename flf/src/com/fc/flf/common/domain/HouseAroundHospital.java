package com.fc.flf.common.domain;

import java.io.Serializable;

public class HouseAroundHospital implements Serializable {

	private static final long serialVersionUID = 1L;
	private int hospitalId;
	private int houseId;
	private int hospitalType;
	private String houseHospitalDistence;
	private String houseHospitalDesc;

	public void setHospitalId(int hospitalId) {
		this.hospitalId = hospitalId;
	}

	public int getHospitalId() {
		return this.hospitalId;
	}

	public void setHouseId(int houseId) {
		this.houseId = houseId;
	}

	public int getHouseId() {
		return this.houseId;
	}

	public void setHospitalType(int hospitalType) {
		this.hospitalType = hospitalType;
	}

	public int getHospitalType() {
		return this.hospitalType;
	}

	public void setHouseHospitalDistence(String houseHospitalDistence) {
		this.houseHospitalDistence = houseHospitalDistence;
	}

	public String getHouseHospitalDistence() {
		return this.houseHospitalDistence;
	}

	public void setHouseHospitalDesc(String houseHospitalDesc) {
		this.houseHospitalDesc = houseHospitalDesc;
	}

	public String getHouseHospitalDesc() {
		return this.houseHospitalDesc;
	}
}