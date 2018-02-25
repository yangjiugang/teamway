package com.fc.flf.common.domain;

import java.io.Serializable;

public class FcSysArea implements Serializable {

	private static final long serialVersionUID = 1L;
	private int areaId;
	private int areaType;
	private String areaName;
	private int parentAreaId;
	private String pinyin;
	private String path;
	private int areaLevel;
	private String areaDesc;

	public void setAreaId(int areaId) {
		this.areaId = areaId;
	}

	public int getAreaId() {
		return this.areaId;
	}

	public int getAreaType() {
		return areaType;
	}

	public void setAreaType(int areaType) {
		this.areaType = areaType;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public String getAreaName() {
		return this.areaName;
	}

	public void setParentAreaId(int parentAreaId) {
		this.parentAreaId = parentAreaId;
	}

	public int getParentAreaId() {
		return this.parentAreaId;
	}

	public void setPinyin(String pinyin) {
		this.pinyin = pinyin;
	}

	public String getPinyin() {
		return this.pinyin;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getPath() {
		return this.path;
	}

	public void setAreaLevel(int areaLevel) {
		this.areaLevel = areaLevel;
	}

	public int getAreaLevel() {
		return this.areaLevel;
	}

	public void setAreaDesc(String areaDesc) {
		this.areaDesc = areaDesc;
	}

	public String getAreaDesc() {
		return this.areaDesc;
	}
}