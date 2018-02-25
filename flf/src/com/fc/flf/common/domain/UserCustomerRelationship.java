package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;

public class UserCustomerRelationship implements Serializable {

	private static final long serialVersionUID = 1L;
	private int relationshipId;
	private int userId;
	private int cusId;
	private int isExchange;
	private int customerType;
	private int countOrder;
	private int countDiscuss;
	private int countGroup;
	private int countEvent;
	private int countLookFang;
	private int countOrderCode;
	private String typeName;
	private CustomerInfoDetail customerInfoDetail;
	private UserInfoDetail userInfoDetail;
	private CustomerInterests customerInterests;
	private int customerId;
	private Date create_at;
	private int userPoints;
	
	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public Date getCreate_at() {
		return create_at;
	}

	public void setCreate_at(Date create_at) {
		this.create_at = create_at;
	}

	public int getUserPoints() {
		return userPoints;
	}

	public void setUserPoints(int userPoints) {
		this.userPoints = userPoints;
	}

	public int getCountOrderCode() {
		return countOrderCode;
	}

	public void setCountOrderCode(int countOrderCode) {
		this.countOrderCode = countOrderCode;
	}

	public void setRelationshipId(int relationshipId) {
		this.relationshipId = relationshipId;
	}

	public int getRelationshipId() {
		return this.relationshipId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getUserId() {
		return this.userId;
	}

	public void setCusId(int cusId) {
		this.cusId = cusId;
	}

	public int getCusId() {
		return this.cusId;
	}

	public int getCountDiscuss() {
		return countDiscuss;
	}

	public void setCountDiscuss(int countDiscuss) {
		this.countDiscuss = countDiscuss;
	}

	public void setIsExchange(int isExchange) {
		this.isExchange = isExchange;
	}

	public int getCountLookFang() {
		return countLookFang;
	}

	public void setCountLookFang(int countLookFang) {
		this.countLookFang = countLookFang;
	}

	public int getCountGroup() {
		return countGroup;
	}

	public void setCountGroup(int countGroup) {
		this.countGroup = countGroup;
	}

	public int getCountEvent() {
		return countEvent;
	}

	public void setCountEvent(int countEvent) {
		this.countEvent = countEvent;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public int getIsExchange() {
		return this.isExchange;
	}

	public int getCustomerType() {
		return customerType;
	}

	public int getCountOrder() {
		return countOrder;
	}

	public void setCountOrder(int countOrder) {
		this.countOrder = countOrder;
	}

	public void setCustomerType(int customerType) {
		this.customerType = customerType;
	}

	public CustomerInfoDetail getCustomerInfoDetail() {
		return customerInfoDetail;
	}

	public void setCustomerInfoDetail(CustomerInfoDetail customerInfoDetail) {
		this.customerInfoDetail = customerInfoDetail;
	}

	public UserInfoDetail getUserInfoDetail() {
		return userInfoDetail;
	}

	public void setUserInfoDetail(UserInfoDetail userInfoDetail) {
		this.userInfoDetail = userInfoDetail;
	}

	public CustomerInterests getCustomerInterests() {
		return customerInterests;
	}

	public void setCustomerInterests(CustomerInterests customerInterests) {
		this.customerInterests = customerInterests;
	}

}