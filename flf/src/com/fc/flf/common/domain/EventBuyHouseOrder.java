package com.fc.flf.common.domain;

import java.io.Serializable;
import java.sql.Date;

public class EventBuyHouseOrder implements Serializable {

	private static final long serialVersionUID = 1L;
	private int orderId;
	private String orderNum;
	private int houseID;
	private String houseName;
	private int cusId;
	private String customerName;
	private int userId;
	private String userName;
	private String orderName;
	private Date orderDate;
	private Date execOrderDate;
	private int orderStatus;
	private int orderMoney;
	private int payStatus;
	private String payTypeName;
	private String orderDesc;
	private String orderType;
	private int saleControlId;
	
	private int type;

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getSaleControlId() {
		return saleControlId;
	}

	public void setSaleControlId(int saleControlId) {
		this.saleControlId = saleControlId;
	}

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}
	public String getOrderDesc() {
		return orderDesc;
	}

	public void setOrderDesc(String orderDesc) {
		this.orderDesc = orderDesc;
	}

	public String getPayTypeName() {
		return payTypeName;
	}

	public void setPayTypeName(String payTypeName) {
		this.payTypeName = payTypeName;
	}

	private int payType;
	private Date payDate;
	
	private EventBuyHouseOrderExchange exchangeType;
	public EventBuyHouseOrderExchange getExchangeType() {
		return exchangeType;
	}

	public void setExchangeType(EventBuyHouseOrderExchange exchangeType) {
		this.exchangeType = exchangeType;
	}

	
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getOrderId() {
		return this.orderId;
	}

	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}

	public String getOrderNum() {
		return this.orderNum;
	}

	public void setHouseID(int houseID) {
		this.houseID = houseID;
	}

	public int getHouseID() {
		return this.houseID;
	}

	public void setHouseName(String houseName) {
		this.houseName = houseName;
	}

	public String getHouseName() {
		return this.houseName;
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

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getUserId() {
		return this.userId;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}

	public String getOrderName() {
		return this.orderName;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public Date getOrderDate() {
		return this.orderDate;
	}

	public void setExecOrderDate(Date execOrderDate) {
		this.execOrderDate = execOrderDate;
	}

	public Date getExecOrderDate() {
		return this.execOrderDate;
	}

	public void setOrderStatus(int orderStatus) {
		this.orderStatus = orderStatus;
	}

	public int getOrderStatus() {
		return this.orderStatus;
	}

	public void setOrderMoney(int orderMoney) {
		this.orderMoney = orderMoney;
	}

	public int getOrderMoney() {
		return this.orderMoney;
	}

	public void setPayStatus(int payStatus) {
		this.payStatus = payStatus;
	}

	public int getPayStatus() {
		return this.payStatus;
	}

	public void setPayType(int payType) {
		this.payType = payType;
	}

	public int getPayType() {
		return this.payType;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public Date getPayDate() {
		return this.payDate;
	}
}