package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;

public class UserRecommendShare implements Serializable {

	private static final long serialVersionUID = 1L;
	private int recommendId;
	private int recommendType;
	private int recommendContentId;
	private String recommendContent;
	private int recommendVisitorType;
	private int recommendVisitor;
	private String recommendVisitorName;	
	private Date executeTime;
	private int paymoney;
	private int userId;
	private Date recommendTime;
	private UserInfo userInfo;

	public void setRecommendId(int recommendId) {
		this.recommendId = recommendId;
	}

	public int getRecommendId() {
		return this.recommendId;
	}

	public void setRecommendType(int recommendType) {
		this.recommendType = recommendType;
	}

	public int getRecommendType() {
		return this.recommendType;
	}

	public void setRecommendContentId(int recommendContentId) {
		this.recommendContentId = recommendContentId;
	}

	public int getRecommendContentId() {
		return this.recommendContentId;
	}

	public void setRecommendContent(String recommendContent) {
		this.recommendContent = recommendContent;
	}

	public String getRecommendContent() {
		return this.recommendContent;
	}

	public void setRecommendVisitorType(int recommendVisitorType) {
		this.recommendVisitorType = recommendVisitorType;
	}

	public int getRecommendVisitorType() {
		return this.recommendVisitorType;
	}

	public void setRecommendVisitor(int recommendVisitor) {
		this.recommendVisitor = recommendVisitor;
	}

	public int getRecommendVisitor() {
		return this.recommendVisitor;
	}

	public String getRecommendVisitorName() {
		return recommendVisitorName;
	}

	public void setRecommendVisitorName(String recommendVisitorName) {
		this.recommendVisitorName = recommendVisitorName;
	}

	public void setExecuteTime(Date executeTime) {
		this.executeTime = executeTime;
	}

	public Date getExecuteTime() {
		return this.executeTime;
	}

	public void setPaymoney(int paymoney) {
		this.paymoney = paymoney;
	}

	public int getPaymoney() {
		return this.paymoney;
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

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}
}