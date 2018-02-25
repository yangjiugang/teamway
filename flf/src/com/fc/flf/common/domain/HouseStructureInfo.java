package com.fc.flf.common.domain;

import java.io.Serializable;

public class HouseStructureInfo implements Serializable {

	private static final long serialVersionUID = 1L;
	private int structureId;
	private int houseID;
	private int structureName;
	private float structureArea;
	private float structureHigh;
	private String structureDesc;
	private int picId;
	private String picDetailPath;

	public void setStructureId(int structureId) {
		this.structureId = structureId;
	}

	public int getStructureId() {
		return this.structureId;
	}

	public void setHouseID(int houseID) {
		this.houseID = houseID;
	}

	public int getHouseID() {
		return this.houseID;
	}

	public void setStructureName(int structureName) {
		this.structureName = structureName;
	}

	public int getStructureName() {
		return this.structureName;
	}

	public void setStructureArea(float structureArea) {
		this.structureArea = structureArea;
	}

	public float getStructureArea() {
		return this.structureArea;
	}

	public void setStructureHigh(float structureHigh) {
		this.structureHigh = structureHigh;
	}

	public float getStructureHigh() {
		return this.structureHigh;
	}

	public void setStructureDesc(String structureDesc) {
		this.structureDesc = structureDesc;
	}

	public String getStructureDesc() {
		return this.structureDesc;
	}

	public void setPicId(int picId) {
		this.picId = picId;
	}

	public int getPicId() {
		return this.picId;
	}

	public void setPicDetailPath(String picDetailPath) {
		this.picDetailPath = picDetailPath;
	}

	public String getPicDetailPath() {
		return this.picDetailPath;
	}
}