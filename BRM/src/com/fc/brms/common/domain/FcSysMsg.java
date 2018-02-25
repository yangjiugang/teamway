package com.fc.brms.common.domain;

import java.io.Serializable;
import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.fc.brms.common.conf.DateTimeSerializer;

public class FcSysMsg implements Serializable {

	private static final long serialVersionUID = 1L;
	private int msgId;
	private int companyId;
	private int msgType;
	private String msgContent;
	private int receiveEmployeeId;
	private int sendEmployeeId;
	private Date sendTime;

	public void setMsgId(int msgId) {
		this.msgId = msgId;
	}

	public int getMsgId() {
		return this.msgId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public int getCompanyId() {
		return this.companyId;
	}

	public void setMsgType(int msgType) {
		this.msgType = msgType;
	}

	public int getMsgType() {
		return this.msgType;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}

	public String getMsgContent() {
		return this.msgContent;
	}

	public void setReceiveEmployeeId(int receiveEmployeeId) {
		this.receiveEmployeeId = receiveEmployeeId;
	}

	public int getReceiveEmployeeId() {
		return this.receiveEmployeeId;
	}

	public void setSendEmployeeId(int sendEmployeeId) {
		this.sendEmployeeId = sendEmployeeId;
	}

	public int getSendEmployeeId() {
		return this.sendEmployeeId;
	}

	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}

	@JsonSerialize(using=DateTimeSerializer.class)
	public Date getSendTime() {
		return this.sendTime;
	}
}