package com.fc.flf.common.domain;
import java.io.Serializable;

public class VisitorCollectHouseGroup implements Serializable {

	private static final long serialVersionUID = 1L;
	private int collectId;
	private int houseGroupId;
	private int visitorId;
	private int visitorType;
	private String column4;
	private String column5;
	
	private HouseGroupInfo houseGroupInfo;

	public HouseGroupInfo getHouseGroupInfo() {
		return houseGroupInfo;
	}

	public void setHouseGroupInfo(HouseGroupInfo houseGroupInfo) {
		this.houseGroupInfo = houseGroupInfo;
	}

	public void setCollectId(int collectId) {
		this.collectId = collectId;
	}

	public int getCollectId() {
		return this.collectId;
	}

	public void setHouseGroupId(int houseGroupId) {
		this.houseGroupId = houseGroupId;
	}

	public int getHouseGroupId() {
		return this.houseGroupId;
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

	public void setColumn4(String column4) {
		this.column4 = column4;
	}

	public String getColumn4() {
		return this.column4;
	}

	public void setColumn5(String column5) {
		this.column5 = column5;
	}

	public String getColumn5() {
		return this.column5;
	}
}