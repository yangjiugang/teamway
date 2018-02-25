package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;

public class HouseGroupCustomer implements Serializable {

	private static final long serialVersionUID = 1L;
	private HouseGroupInfo houseGroupInfo;
	private String travelType;
	private String orderType;
	private int id;
	private int houseGroupId;
	private int cusId;
	private String customerName;
	private String customerPhone;
	private Date joinTime;
	private int togetherCustomers;
	private int userId;
	private int travelStatus;
	private int customerId;
	private int eventId;
	private int customerType;
	private String orderObj;
	private int payAmount;
	private int houseId;
	public int getHouseId() {
		return houseId;
	}

	public void setHouseId(int houseId) {
		this.houseId = houseId;
	}

	public int getPayAmount() {
		return payAmount;
	}

	public void setPayAmount(int payAmount) {
		this.payAmount = payAmount;
	}

	public String getOrderObj() {
		return orderObj;
	}

	public void setOrderObj(String orderObj) {
		this.orderObj = orderObj;
	}

	public int getCustomerType() {
		return customerType;
	}

	public void setCustomerType(int customerType) {
		this.customerType = customerType;
	}

	public int getEventId() {
		return eventId;
	}

	public void setEventId(int eventId) {
		this.eventId = eventId;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	private CustomerInfoDetail customerInfoDetail;

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}

	public String getTravelType() {
		return travelType;
	}

	public void setTravelType(String travelType) {
		this.travelType = travelType;
	}


	public CustomerInfoDetail getCustomerInfoDetail() {
		return customerInfoDetail;
	}

	public void setCustomerInfoDetail(CustomerInfoDetail customerInfoDetail) {
		this.customerInfoDetail = customerInfoDetail;
	}


	public HouseGroupInfo getHouseGroupInfo() {
		return houseGroupInfo;
	}

	public void setHouseGroupInfo(HouseGroupInfo houseGroupInfo) {
		this.houseGroupInfo = houseGroupInfo;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return this.id;
	}

	public void setHouseGroupId(int houseGroupId) {
		this.houseGroupId = houseGroupId;
	}

	public int getHouseGroupId() {
		return this.houseGroupId;
	}

	public void setCusId(int cusId) {
		this.cusId = cusId;
	}

	public int getCusId() {
		return this.cusId;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerName() {
		return this.customerName;
	}

	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}

	public String getCustomerPhone() {
		return this.customerPhone;
	}

	public void setJoinTime(Date joinTime) {
		this.joinTime = joinTime;
	}

	public Date getJoinTime() {
		return this.joinTime;
	}

	public void setTogetherCustomers(int togetherCustomers) {
		this.togetherCustomers = togetherCustomers;
	}

	public int getTogetherCustomers() {
		return this.togetherCustomers;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getUserId() {
		return this.userId;
	}

	public void setTravelStatus(int travelStatus) {
		this.travelStatus = travelStatus;
	}

	public int getTravelStatus() {
		return this.travelStatus;
	}

}