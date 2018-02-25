package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.fc.flf.common.conf.DateSerializer;
public class CustomerMention implements Serializable {

	private static final long serialVersionUID = 1L;
	private int mentionId;
	private int userId;
	private int cusId;
	private Date mentionTime;
	private int isCheck;
	private String column7;
	private CustomerInfo customerInfo;

	public void setMentionId(int mentionId) {
		this.mentionId = mentionId;
	}

	public int getMentionId() {
		return this.mentionId;
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

	public void setMentionTime(Date mentionTime) {
		this.mentionTime = mentionTime;
	}

	@JsonSerialize(using=DateSerializer.class)
	public Date getMentionTime() {
		return this.mentionTime;
	}

	public void setIsCheck(int isCheck) {
		this.isCheck = isCheck;
	}

	public int getIsCheck() {
		return this.isCheck;
	}

	public void setColumn7(String column7) {
		this.column7 = column7;
	}

	public String getColumn7() {
		return this.column7;
	}

	public CustomerInfo getCustomerInfo() {
		return customerInfo;
	}

	public void setCustomerInfo(CustomerInfo customerInfo) {
		this.customerInfo = customerInfo;
	}
	
}