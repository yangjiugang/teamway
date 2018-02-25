package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class HouseDiscuss implements Serializable {

	private static final long serialVersionUID = 1L;
	private int discussId;
	private int houseId;
	private int visitorType;
	private int visitorId;
	private String visitorName;
	private int anonymityFlag;
	private Date createDate;
	private int houseGrade;
	private int visitorHostIp;
	private int visitorCity;
	private String column12;
	private String content;
	private List<HouseInfo> houseInfo;
	private HouseInfo houseInfoDetail;
	private UserInfo userInfo;
	private HouseInfo housInfo;

	public void setDiscussId(int discussId) {
		this.discussId = discussId;
	}

	public int getDiscussId() {
		return this.discussId;
	}

	public void setHouseId(int houseId) {
		this.houseId = houseId;
	}

	public int getHouseId() {
		return this.houseId;
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

	public void setAnonymityFlag(int anonymityFlag) {
		this.anonymityFlag = anonymityFlag;
	}

	public int getAnonymityFlag() {
		return this.anonymityFlag;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getCreateDate() {
		return this.createDate;
	}

	public void setHouseGrade(int houseGrade) {
		this.houseGrade = houseGrade;
	}

	public int getHouseGrade() {
		return this.houseGrade;
	}

	public void setVisitorHostIp(int visitorHostIp) {
		this.visitorHostIp = visitorHostIp;
	}

	public int getVisitorHostIp() {
		return this.visitorHostIp;
	}

	public void setVisitorCity(int visitorCity) {
		this.visitorCity = visitorCity;
	}

	public int getVisitorCity() {
		return this.visitorCity;
	}

	public void setColumn12(String column12) {
		this.column12 = column12;
	}

	public String getColumn12() {
		return this.column12;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getContent() {
		return this.content;
	}

	public List<HouseInfo> getHouseInfo() {
		return houseInfo;
	}

	public void setHouseInfo(List<HouseInfo> houseInfo) {
		this.houseInfo = houseInfo;
	}

	public HouseInfo getHouseInfoDetail() {
		return houseInfoDetail;
	}

	public void setHouseInfoDetail(HouseInfo houseInfoDetail) {
		this.houseInfoDetail = houseInfoDetail;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public HouseInfo getHousInfo() {
		return housInfo;
	}

	public void setHousInfo(HouseInfo housInfo) {
		this.housInfo = housInfo;
	}
}