package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;

public class VisitorSkimHouseGroup implements Serializable {

	private static final long serialVersionUID = 1L;
	private int skimId;
	private int houseGroupId;
	private int visitorId;
	private int vistorType;
	private String checkinType;
	private Date checkinTime;
	private Date checkoutTime;
	private String checkinIp;

	private HouseGroupInfo houseGroupInfo;

	public HouseGroupInfo getHouseGroupInfo() {
		return houseGroupInfo;
	}

	public void setHouseGroupInfo(HouseGroupInfo houseGroupInfo) {
		this.houseGroupInfo = houseGroupInfo;
	}

	public void setSkimId(int skimId) {
		this.skimId = skimId;
	}

	public int getSkimId() {
		return this.skimId;
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


	public int getVistorType() {
		return vistorType;
	}

	public void setVistorType(int vistorType) {
		this.vistorType = vistorType;
	}

	public void setCheckinType(String checkinType) {
		this.checkinType = checkinType;
	}

	public String getCheckinType() {
		return this.checkinType;
	}

	public void setCheckinTime(Date checkinTime) {
		this.checkinTime = checkinTime;
	}

	public Date getCheckinTime() {
		return this.checkinTime;
	}

	public void setCheckoutTime(Date checkoutTime) {
		this.checkoutTime = checkoutTime;
	}

	public Date getCheckoutTime() {
		return this.checkoutTime;
	}

	public String getCheckinIp() {
		return checkinIp;
	}

	public void setCheckinIp(String checkinIp) {
		this.checkinIp = checkinIp;
	}


}