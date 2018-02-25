package com.fc.flf.common.domain;

import java.io.Serializable;

public class HouseGroupScheduleHouse implements Serializable {

	private static final long serialVersionUID = 1L;
	private int houseId;
	private int groupScheduleId; 
	private String picPath;
	private String houseName;
	public int getHouseId() {
		return houseId;
	}
	public void setHouseId(int houseId) {
		this.houseId = houseId;
	}

	public int getGroupScheduleId() {
		return groupScheduleId;
	}
	public void setGroupScheduleId(int groupScheduleId) {
		this.groupScheduleId = groupScheduleId;
	}
	public String getPicPath() {
		return picPath;
	}
	public void setPicPath(String picPath) {
		this.picPath = picPath;
	}
	public String getHouseName() {
		return houseName;
	}
	public void setHouseName(String houseName) {
		this.houseName = houseName;
	}
	

}