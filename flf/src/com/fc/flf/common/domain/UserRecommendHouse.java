package com.fc.flf.common.domain;

import java.io.Serializable;
import java.sql.Date;

public class UserRecommendHouse implements Serializable {

	private static final long serialVersionUID = 1L;
	private int recommendId;
	private int houseId;
	private int userId;
	private Date recommendTime;

	public void setRecommendId(int recommendId) {
		this.recommendId = recommendId;
	}

	public int getRecommendId() {
		return this.recommendId;
	}

	public void setHouseId(int houseId) {
		this.houseId = houseId;
	}

	public int getHouseId() {
		return this.houseId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getUserId() {
		return this.userId;
	}

	public void setRecommendTime(Date recommendTime) {
		this.recommendTime = recommendTime;
	}

	public Date getRecommendTime() {
		return this.recommendTime;
	}
}