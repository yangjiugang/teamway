package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;

public class VisitorCollectHouse implements Serializable {

	private static final long serialVersionUID = 1L;
	private int collectId;
	private int houseId;
	private int visitorId;
	private int visitorType;
	private Date collectTime;
	private String column5;

	public void setCollectId(int collectId) {
		this.collectId = collectId;
	}

	public int getCollectId() {
		return this.collectId;
	}

	public void setHouseId(int houseId) {
		this.houseId = houseId;
	}

	public int getHouseId() {
		return this.houseId;
	}

	public void setVisitorId(int visitorId) {
		this.visitorId = visitorId;
	}

	public int getVisitorId() {
		return this.visitorId;
	}

	public void setVisitorType(int visitorType) {
		this.visitorType = visitorType;
	}

	public int getVisitorType() {
		return this.visitorType;
	}

	public void setCollectTime(Date collectTime) {
		this.collectTime = collectTime;
	}

	public Date getCollectTime() {
		return this.collectTime;
	}

	public void setColumn5(String column5) {
		this.column5 = column5;
	}

	public String getColumn5() {
		return this.column5;
	}
}