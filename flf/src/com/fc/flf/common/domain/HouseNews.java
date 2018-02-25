package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;

public class HouseNews implements Serializable {

	private static final long serialVersionUID = 1L;
	private int newsId;
	private int houseId;
	private int infoType;
	private String infoTitle;
	private String infoContent;
	private Date infoCreateDate;
	private int infoSkimCnt;

	public void setNewsId(int newsId) {
		this.newsId = newsId;
	}

	public int getNewsId() {
		return this.newsId;
	}

	public void setHouseId(int houseId) {
		this.houseId = houseId;
	}

	public int getHouseId() {
		return this.houseId;
	}

	public void setInfoType(int infoType) {
		this.infoType = infoType;
	}

	public int getInfoType() {
		return this.infoType;
	}

	public void setInfoTitle(String infoTitle) {
		this.infoTitle = infoTitle;
	}

	public String getInfoTitle() {
		return this.infoTitle;
	}

	public void setInfoContent(String infoContent) {
		this.infoContent = infoContent;
	}

	public String getInfoContent() {
		return this.infoContent;
	}

	public void setInfoCreateDate(Date infoCreateDate) {
		this.infoCreateDate = infoCreateDate;
	}

	public Date getInfoCreateDate() {
		return this.infoCreateDate;
	}

	public int getInfoSkimCnt() {
		return infoSkimCnt;
	}

	public void setInfoSkimCnt(int infoSkimCnt) {
		this.infoSkimCnt = infoSkimCnt;
	}
}