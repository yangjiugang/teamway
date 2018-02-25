package com.fc.flf.common.domain;

import java.io.Serializable;

public class TheCustomerOrderDesc implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String orderNum;
	private String orderDate;
	private String orderType;
	private String orderName;
	private String orderDesc;
	private String cusTypeName;
	private int CusType;
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderType() {
		return orderType;
	}
	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public String getOrderDesc() {
		return orderDesc;
	}
	public void setOrderDesc(String orderDesc) {
		this.orderDesc = orderDesc;
	}
	public String getCusTypeName() {
		return cusTypeName;
	}
	public void setCusTypeName(String cusTypeName) {
		this.cusTypeName = cusTypeName;
	}
	public int getCusType() {
		return CusType;
	}
	public void setCusType(int cusType) {
		CusType = cusType;
	}
}
