package com.fc.flf.common.domain;

import java.io.Serializable;

public class HouseAroundTraffic implements Serializable {

	private static final long serialVersionUID = 1L;
	private int trafficId;
	private int houseId;
	private int trafficType;
	private String trafficLine;
	private String trafficDesc;

	public void setTrafficId(int trafficId) {
		this.trafficId = trafficId;
	}

	public int getTrafficId() {
		return this.trafficId;
	}

	public void setHouseId(int houseId) {
		this.houseId = houseId;
	}

	public int getHouseId() {
		return this.houseId;
	}

	public void setTrafficType(int trafficType) {
		this.trafficType = trafficType;
	}

	public int getTrafficType() {
		return this.trafficType;
	}

	public void setTrafficLine(String trafficLine) {
		this.trafficLine = trafficLine;
	}

	public String getTrafficLine() {
		return this.trafficLine;
	}

	public void setTrafficDesc(String trafficDesc) {
		this.trafficDesc = trafficDesc;
	}

	public String getTrafficDesc() {
		return this.trafficDesc;
	}
}