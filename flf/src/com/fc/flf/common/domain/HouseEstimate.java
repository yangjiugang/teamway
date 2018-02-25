package com.fc.flf.common.domain;

import java.io.Serializable;

public class HouseEstimate implements Serializable {

	private static final long serialVersionUID = 1L;
	private int id;
	private int houseId;
	private String recommendationindex;
	private String livableIndex;
	private String airQuality;
	private String column6;

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return this.id;
	}

	public void setHouseId(int houseId) {
		this.houseId = houseId;
	}

	public int getHouseId() {
		return this.houseId;
	}

	public void setRecommendationindex(String recommendationindex) {
		this.recommendationindex = recommendationindex;
	}

	public String getRecommendationindex() {
		return this.recommendationindex;
	}

	public void setLivableIndex(String livableIndex) {
		this.livableIndex = livableIndex;
	}

	public String getLivableIndex() {
		return this.livableIndex;
	}

	public void setAirQuality(String airQuality) {
		this.airQuality = airQuality;
	}

	public String getAirQuality() {
		return this.airQuality;
	}

	public void setColumn6(String column6) {
		this.column6 = column6;
	}

	public String getColumn6() {
		return this.column6;
	}
}