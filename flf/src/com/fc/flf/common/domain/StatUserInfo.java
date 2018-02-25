package com.fc.flf.common.domain;

import java.io.Serializable;

public class StatUserInfo implements Serializable {

	private static final long serialVersionUID = 1L;
	private int userId;
	private int skimHouseCnt;
	private int collectHouseCnt;
	private int saleHouseCnt;
	private int priceHouseCnt;
	private int discussHouseCnt;
	private int customerCnt;
	private int customerContactCnt;
	private int customerEventCnt;
	private int customerLookCnt;
	private int customerHousegroupCnt;
	private int customerDiscussCnt;
	private int customerBuyhouseCnt;
	private int friendCnt;
	private int recommendTofriendCnt;
	private int recommendTocustomerCnt;
	private UserInfo userInfo;
	
	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getUserId() {
		return this.userId;
	}

	public void setSkimHouseCnt(int skimHouseCnt) {
		this.skimHouseCnt = skimHouseCnt;
	}

	public int getSkimHouseCnt() {
		return this.skimHouseCnt;
	}

	public void setCollectHouseCnt(int collectHouseCnt) {
		this.collectHouseCnt = collectHouseCnt;
	}

	public int getCollectHouseCnt() {
		return this.collectHouseCnt;
	}

	public void setSaleHouseCnt(int saleHouseCnt) {
		this.saleHouseCnt = saleHouseCnt;
	}

	public int getSaleHouseCnt() {
		return this.saleHouseCnt;
	}

	public void setPriceHouseCnt(int priceHouseCnt) {
		this.priceHouseCnt = priceHouseCnt;
	}

	public int getPriceHouseCnt() {
		return this.priceHouseCnt;
	}

	public void setDiscussHouseCnt(int discussHouseCnt) {
		this.discussHouseCnt = discussHouseCnt;
	}

	public int getDiscussHouseCnt() {
		return this.discussHouseCnt;
	}

	public void setCustomerCnt(int customerCnt) {
		this.customerCnt = customerCnt;
	}

	public int getCustomerCnt() {
		return this.customerCnt;
	}

	public void setCustomerContactCnt(int customerContactCnt) {
		this.customerContactCnt = customerContactCnt;
	}

	public int getCustomerContactCnt() {
		return this.customerContactCnt;
	}

	public void setCustomerEventCnt(int customerEventCnt) {
		this.customerEventCnt = customerEventCnt;
	}

	public int getCustomerEventCnt() {
		return this.customerEventCnt;
	}

	public void setCustomerLookCnt(int customerLookCnt) {
		this.customerLookCnt = customerLookCnt;
	}

	public int getCustomerLookCnt() {
		return this.customerLookCnt;
	}

	public void setCustomerHousegroupCnt(int customerHousegroupCnt) {
		this.customerHousegroupCnt = customerHousegroupCnt;
	}

	public int getCustomerHousegroupCnt() {
		return this.customerHousegroupCnt;
	}

	public void setCustomerDiscussCnt(int customerDiscussCnt) {
		this.customerDiscussCnt = customerDiscussCnt;
	}

	public int getCustomerDiscussCnt() {
		return this.customerDiscussCnt;
	}

	public void setCustomerBuyhouseCnt(int customerBuyhouseCnt) {
		this.customerBuyhouseCnt = customerBuyhouseCnt;
	}

	public int getCustomerBuyhouseCnt() {
		return this.customerBuyhouseCnt;
	}

	public void setFriendCnt(int friendCnt) {
		this.friendCnt = friendCnt;
	}

	public int getFriendCnt() {
		return this.friendCnt;
	}

	public void setRecommendTofriendCnt(int recommendTofriendCnt) {
		this.recommendTofriendCnt = recommendTofriendCnt;
	}

	public int getRecommendTofriendCnt() {
		return this.recommendTofriendCnt;
	}

	public void setRecommendTocustomerCnt(int recommendTocustomerCnt) {
		this.recommendTocustomerCnt = recommendTocustomerCnt;
	}

	public int getRecommendTocustomerCnt() {
		return this.recommendTocustomerCnt;
	}
}