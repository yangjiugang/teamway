package com.fc.flf.common.domain;

import java.io.Serializable;

public class HouseSaleControlInfo implements Serializable {

	private static final long serialVersionUID = 1L;
	private int id;
	private int structureId;
	private int houseId;
	private String part;
	private String buildingNum;
	private int unitNum;
	private int homeFloor;
	private String doorplate;
	private String homeStructure;
	private int homePrice;
	private int salesFlag;

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return this.id;
	}

	public void setStructureId(int structureId) {
		this.structureId = structureId;
	}

	public int getStructureId() {
		return this.structureId;
	}

	public void setHouseId(int houseId) {
		this.houseId = houseId;
	}

	public int getHouseId() {
		return this.houseId;
	}

	public void setPart(String part) {
		this.part = part;
	}

	public String getPart() {
		return this.part;
	}

	public void setBuildingNum(String buildingNum) {
		this.buildingNum = buildingNum;
	}

	public String getBuildingNum() {
		return this.buildingNum;
	}

	public void setUnitNum(int unitNum) {
		this.unitNum = unitNum;
	}

	public int getUnitNum() {
		return this.unitNum;
	}

	public int getHomeFloor() {
		return homeFloor;
	}

	public void setHomeFloor(int homeFloor) {
		this.homeFloor = homeFloor;
	}

	public void setDoorplate(String doorplate) {
		this.doorplate = doorplate;
	}

	public String getDoorplate() {
		return this.doorplate;
	}

	public void setHomeStructure(String homeStructure) {
		this.homeStructure = homeStructure;
	}

	public String getHomeStructure() {
		return this.homeStructure;
	}

	public void setHomePrice(int homePrice) {
		this.homePrice = homePrice;
	}

	public int getHomePrice() {
		return this.homePrice;
	}

	public void setSalesFlag(int salesFlag) {
		this.salesFlag = salesFlag;
	}

	public int getSalesFlag() {
		return this.salesFlag;
	}
}