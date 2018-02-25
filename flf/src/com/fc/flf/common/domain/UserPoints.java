package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;

public class UserPoints implements Serializable {

	private static final long serialVersionUID = 1L;
	private int poindId;
	private int userId;
	private String source;
	private int points;
	private Date pointsDate;

	public void setPoindId(int poindId) {
		this.poindId = poindId;
	}

	public int getPoindId() {
		return this.poindId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getUserId() {
		return this.userId;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getSource() {
		return this.source;
	}

	public void setPoints(int points) {
		this.points = points;
	}

	public int getPoints() {
		return this.points;
	}

	public void setPointsDate(Date pointsDate) {
		this.pointsDate = pointsDate;
	}

	public Date getPointsDate() {
		return this.pointsDate;
	}
}