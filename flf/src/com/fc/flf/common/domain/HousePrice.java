package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;

public class HousePrice implements Serializable {

	private static final long serialVersionUID = 1L;
	private int priceId;
	private int houseId;
	private int housePrice;
	private Date saleDate;
	private int visitorType;
	private int visitorId;
	private String visitorName;
	private int visitorHostIp;
	private int visitorCity;
	private HouseInfo houseInfo;

	public int getVisitorHostIp() {
		return visitorHostIp;
	}

	public void setVisitorHostIp(int visitorHostIp) {
		this.visitorHostIp = visitorHostIp;
	}

	public int getVisitorCity() {
		return visitorCity;
	}

	public void setVisitorCity(int visitorCity) {
		this.visitorCity = visitorCity;
	}

	public void setPriceId(int priceId) {
		this.priceId = priceId;
	}

	public int getPriceId() {
		return this.priceId;
	}

	public void setHouseId(int houseId) {
		this.houseId = houseId;
	}

	public int getHouseId() {
		return this.houseId;
	}

	public void setHousePrice(int housePrice) {
		this.housePrice = housePrice;
	}

	public int getHousePrice() {
		return this.housePrice;
	}

	public void setSaleDate(Date saleDate) {
		this.saleDate = saleDate;
	}

	public Date getSaleDate() {
		return this.saleDate;
	}

	public void setVisitorType(int visitorType) {
		this.visitorType = visitorType;
	}

	public int getVisitorType() {
		return this.visitorType;
	}

	public void setVisitorId(int visitorId) {
		this.visitorId = visitorId;
	}

	public int getVisitorId() {
		return this.visitorId;
	}

	public void setVisitorName(String visitorName) {
		this.visitorName = visitorName;
	}

	public String getVisitorName() {
		return this.visitorName;
	}

	public HouseInfo getHouseInfo() {
		return houseInfo;
	}

	public void setHouseInfo(HouseInfo houseInfo) {
		this.houseInfo = houseInfo;
	}
	
}