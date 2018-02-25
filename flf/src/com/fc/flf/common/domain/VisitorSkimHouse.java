package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;

public class VisitorSkimHouse implements Serializable {

	private static final long serialVersionUID = 1L;
	private int skimId;
	private int houseId;
	private int visitorId;
	private int visitorType;
	private String checkinType;
	private Date checkinTime;
	private Date checkoutTime;
	private String checkinIp;

	public String getCheckinIp() {
		return checkinIp;
	}

	public void setCheckinIp(String checkinIp) {
		this.checkinIp = checkinIp;
	}

	public void setSkimId(int skimId) {
		this.skimId = skimId;
	}

	public int getSkimId() {
		return this.skimId;
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
}