package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;

public class CustomerSkimUser implements Serializable {

	private static final long serialVersionUID = 1L;
	private int skimId;
	private int userId;
	private int visitorId;
	private Date skimDate;

	public void setSkimId(int skimId) {
		this.skimId = skimId;
	}

	public int getSkimId() {
		return this.skimId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getUserId() {
		return this.userId;
	}

	public void setVisitorId(int visitorId) {
		this.visitorId = visitorId;
	}

	public int getVisitorId() {
		return this.visitorId;
	}

	public void setSkimDate(Date skimDate) {
		this.skimDate = skimDate;
	}

	public Date getSkimDate() {
		return this.skimDate;
	}
}