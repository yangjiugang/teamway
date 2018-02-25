package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;

public class UserStudySaleHouse implements Serializable {

	private static final long serialVersionUID = 1L;
	private int id;
	private int houseId;
	private int userId;
	private Date studyStarttime;
	private Date studyEndtime;
	private String studyPlace;
	private String studyNotes;
	private int isSale;
	private Date saleDate;
	
	
	private HouseInfo houseInfo;
	public HouseInfo getHouseInfo() {
		return houseInfo;
	}
	public void setHouseInfo(HouseInfo houseInfo) {
		this.houseInfo = houseInfo;
	}
	
	private FcSysArea fcSysArea;
	public FcSysArea getFcSysArea() {
		return fcSysArea;
	}
	public void setFcSysArea(FcSysArea fcSysArea) {
		this.fcSysArea = fcSysArea;
	}
	
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

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getUserId() {
		return this.userId;
	}

	public void setStudyStarttime(Date studyStarttime) {
		this.studyStarttime = studyStarttime;
	}

	public Date getStudyStarttime() {
		return this.studyStarttime;
	}

	public void setStudyEndtime(Date studyEndtime) {
		this.studyEndtime = studyEndtime;
	}

	public Date getStudyEndtime() {
		return this.studyEndtime;
	}

	public void setStudyPlace(String studyPlace) {
		this.studyPlace = studyPlace;
	}

	public String getStudyPlace() {
		return this.studyPlace;
	}

	public void setStudyNotes(String studyNotes) {
		this.studyNotes = studyNotes;
	}

	public String getStudyNotes() {
		return this.studyNotes;
	}

	public void setIsSale(int isSale) {
		this.isSale = isSale;
	}

	public int getIsSale() {
		return this.isSale;
	}

	public void setSaleDate(Date saleDate) {
		this.saleDate = saleDate;
	}

	public Date getSaleDate() {
		return this.saleDate;
	}
}