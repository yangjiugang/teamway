package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.fc.flf.common.conf.DateSerializer;

public class EventInfo implements Serializable {

	private static final long serialVersionUID = 1L;
	private int eventId;
	private String eventNum;
	private int eventType;
	private int infoId;
	private String eventTitle;
	private String eventAddress;
	private Date eventStartTime;
	private Date eventEndTime;
	private String eventDesc;
	private String keyMan;
	private String keyMan2;
	private String eventTypeName;
	private String orderType;
	private int id;
	private String name;
	private String amount;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	// 临时字段
	private String orderMoney;
	private String customerName;
	
	// 参加活动客户信息 add 覃启轩
	private EventInfoCustomer eventInfoCustomer;

	public EventInfoCustomer getEventInfoCustomer() {
		return eventInfoCustomer;
	}

	public void setEventInfoCustomer(EventInfoCustomer eventInfoCustomer) {
		this.eventInfoCustomer = eventInfoCustomer;
	}

	
	public String getOrderMoney() {
		return orderMoney;
	}

	public void setOrderMoney(String orderMoney) {
		this.orderMoney = orderMoney;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}
	public String getEventTypeName() {
		return eventTypeName;
	}

	public void setEventTypeName(String eventName) {
		this.eventTypeName = eventName;
	}

	public void setEventId(int eventId) {
		this.eventId = eventId;
	}

	public int getEventId() {
		return this.eventId;
	}

	public void setEventNum(String eventNum) {
		this.eventNum = eventNum;
	}

	public String getEventNum() {
		return this.eventNum;
	}

	public void setEventType(int eventType) {
		this.eventType = eventType;
	}

	public int getEventType() {
		return this.eventType;
	}

	public void setInfoId(int infoId) {
		this.infoId = infoId;
	}

	public int getInfoId() {
		return this.infoId;
	}

	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}

	public String getEventTitle() {
		return this.eventTitle;
	}

	public void setEventAddress(String eventAddress) {
		this.eventAddress = eventAddress;
	}

	public String getEventAddress() {
		return this.eventAddress;
	}

	public void setEventStartTime(Date eventStartTime) {
		this.eventStartTime = eventStartTime;
	}
	@JsonSerialize(using=DateSerializer.class)
	public Date getEventStartTime() {
		return this.eventStartTime;
	}

	public void setEventEndTime(Date eventEndTime) {
		this.eventEndTime = eventEndTime;
	}
	@JsonSerialize(using=DateSerializer.class)
	public Date getEventEndTime() {
		return this.eventEndTime;
	}

	public void setEventDesc(String eventDesc) {
		this.eventDesc = eventDesc;
	}

	public String getEventDesc() {
		return this.eventDesc;
	}

	public void setKeyMan(String keyMan) {
		this.keyMan = keyMan;
	}

	public String getKeyMan() {
		return this.keyMan;
	}

	public void setKeyMan2(String keyMan2) {
		this.keyMan2 = keyMan2;
	}

	public String getKeyMan2() {
		return this.keyMan2;
	}
}