package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.fc.flf.common.conf.DateSerializer;

public class UserCustomerContactRecord implements Serializable {

	private static final long serialVersionUID = 1L;
	private int recordId;
	private int relationshipId;
	private Date recordStartDate;
	private Date recordEndDate;
	private Date recordCreateDate;
	private int communicationMethod;
	private String address;
	private int cusId;
	private String customerName;
	private int userId;
	private String userName;
	private String talkUser;
	private int content;
	private int lookIntention;
	private int takeinGroupIntention;
	private int takeinClubIntention;
	private int buyIntention;

	public void setRecordId(int recordId) {
		this.recordId = recordId;
	}

	public int getRecordId() {
		return this.recordId;
	}

	@JsonSerialize(using=DateSerializer.class)
	public Date getRecordCreateDate() {
		//String newTime = DateTools.dateToString(this.recordCreateDate);
		return this.recordCreateDate;
	}

	public void setRecordCreateDate(Date recordCreateDate) {
		this.recordCreateDate = recordCreateDate;
	}

	public void setRelationshipId(int relationshipId) {
		this.relationshipId = relationshipId;
	}

	public int getRelationshipId() {
		return this.relationshipId;
	}

	public void setRecordStartDate(Date recordStartDate) {
		this.recordStartDate = recordStartDate;
	}

	@JsonSerialize(using=DateSerializer.class)
	public Date getRecordStartDate() {
		//String newTime = DateTools.dateToString(this.recordStartDate);
		return this.recordStartDate;
	}

	public void setRecordEndDate(Date recordEndDate) {
		this.recordEndDate = recordEndDate;
	}
	
	@JsonSerialize(using=DateSerializer.class)
	public Date getRecordEndDate() {
		//String newTime = DateTools.dateToString(this.recordEndDate);
		return this.recordEndDate;
	}

	public void setCommunicationMethod(int communicationMethod) {
		this.communicationMethod = communicationMethod;
	}

	public int getCommunicationMethod() {
		return this.communicationMethod;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress() {
		return this.address;
	}

	public int getCusId() {
		return cusId;
	}

	public void setCusId(int cusId) {
		this.cusId = cusId;
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

	public void setTalkUser(String talkUser) {
		this.talkUser = talkUser;
	}

	public String getTalkUser() {
		return this.talkUser;
	}

	public void setContent(int content) {
		this.content = content;
	}

	public int getContent() {
		return this.content;
	}

	public void setLookIntention(int lookIntention) {
		this.lookIntention = lookIntention;
	}

	public int getLookIntention() {
		return this.lookIntention;
	}

	public void setTakeinGroupIntention(int takeinGroupIntention) {
		this.takeinGroupIntention = takeinGroupIntention;
	}

	public int getTakeinGroupIntention() {
		return this.takeinGroupIntention;
	}

	public void setTakeinClubIntention(int takeinClubIntention) {
		this.takeinClubIntention = takeinClubIntention;
	}

	public int getTakeinClubIntention() {
		return this.takeinClubIntention;
	}

	public void setBuyIntention(int buyIntention) {
		this.buyIntention = buyIntention;
	}

	public int getBuyIntention() {
		return this.buyIntention;
	}
}