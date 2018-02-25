package com.fc.flf.common.domain;

import java.io.Serializable;

public class HouseAroundLivingFacilities implements Serializable {

	private static final long serialVersionUID = 1L;
	private int serverId;
	private int houseId;
	private int serverType;
	private String distence;
	private String serverDesc;

	public void setServerId(int serverId) {
		this.serverId = serverId;
	}

	public int getServerId() {
		return this.serverId;
	}

	public void setHouseId(int houseId) {
		this.houseId = houseId;
	}

	public int getHouseId() {
		return this.houseId;
	}

	public void setServerType(int serverType) {
		this.serverType = serverType;
	}

	public int getServerType() {
		return this.serverType;
	}

	public void setDistence(String distence) {
		this.distence = distence;
	}

	public String getDistence() {
		return this.distence;
	}

	public void setServerDesc(String serverDesc) {
		this.serverDesc = serverDesc;
	}

	public String getServerDesc() {
		return this.serverDesc;
	}
}