package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;

public class EventBuyHouseOrderExchange implements Serializable {

	private static final long serialVersionUID = 1L;
	private int exchangeId;
	private int orderId;
	private Date exchangeDate;
	private int exchangeType;
	private int exchangeMoney;
	private String exchangeDesc;
	private String exchangePicPath;
	
	
	private EventBuyHouseOrder eventBuyHouseOrder;
	public EventBuyHouseOrder getEventBuyHouseOrder() {
		return eventBuyHouseOrder;
	}
	public void setEventBuyHouseOrder(EventBuyHouseOrder eventBuyHouseOrder) {
		this.eventBuyHouseOrder = eventBuyHouseOrder;
	}
	
	private HouseGroupScheduleHouse houseGroup;
	public HouseGroupScheduleHouse getHouseGroup() {
		return houseGroup;
	}
	public void setHouseGroup(HouseGroupScheduleHouse houseGroup) {
		this.houseGroup = houseGroup;
	}
	
	
	public void setExchangeId(int exchangeId) {
		this.exchangeId = exchangeId;
	}

	public int getExchangeId() {
		return this.exchangeId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getOrderId() {
		return this.orderId;
	}

	public void setExchangeDate(Date exchangeDate) {
		this.exchangeDate = exchangeDate;
	}

	public Date getExchangeDate() {
		return this.exchangeDate;
	}

	public void setExchangeType(int exchangeType) {
		this.exchangeType = exchangeType;
	}

	public int getExchangeType() {
		return this.exchangeType;
	}

	public void setExchangeMoney(int exchangeMoney) {
		this.exchangeMoney = exchangeMoney;
	}

	public int getExchangeMoney() {
		return this.exchangeMoney;
	}

	public void setExchangeDesc(String exchangeDesc) {
		this.exchangeDesc = exchangeDesc;
	}

	public String getExchangeDesc() {
		return this.exchangeDesc;
	}

	public void setExchangePicPath(String exchangePicPath) {
		this.exchangePicPath = exchangePicPath;
	}

	public String getExchangePicPath() {
		return this.exchangePicPath;
	}
}