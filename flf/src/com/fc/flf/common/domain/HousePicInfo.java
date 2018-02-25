package com.fc.flf.common.domain;

import java.io.Serializable;

public class HousePicInfo implements Serializable {

	private static final long serialVersionUID = 1L;
	private int picId;
	private int houseId;
	private int hostIp;
	private String picPath;
	private int picType;
	private String picDesc;

	public void setPicId(int picId) {
		this.picId = picId;
	}

	public int getPicId() {
		return this.picId;
	}

	public void setHouseId(int houseId) {
		this.houseId = houseId;
	}

	public int getHouseId() {
		return this.houseId;
	}

	public void setHostIp(int hostIp) {
		this.hostIp = hostIp;
	}

	public int getHostIp() {
		return this.hostIp;
	}

	public void setPicPath(String picPath) {
		this.picPath = picPath;
	}

	public String getPicPath() {
		return this.picPath;
	}

	public void setPicType(int picType) {
		this.picType = picType;
	}

	public int getPicType() {
		return this.picType;
	}

	public void setPicDesc(String picDesc) {
		this.picDesc = picDesc;
	}

	public String getPicDesc() {
		return this.picDesc;
	}
}