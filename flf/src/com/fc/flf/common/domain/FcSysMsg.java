package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.fc.flf.common.conf.DateTimeSerializer;

public class FcSysMsg implements Serializable {

	private static final long serialVersionUID = 1L;
	private int msgId;
	private int msgSendType;
	private String msgContent;
	private Date msgSendTime;
	private int msgSendUserId;

	public void setMsgId(int msgId) {
		this.msgId = msgId;
	}

	public int getMsgId() {
		return this.msgId;
	}

	public void setMsgSendType(int msgSendType) {
		this.msgSendType = msgSendType;
	}

	public int getMsgSendType() {
		return this.msgSendType;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}

	public String getMsgContent() {
		return this.msgContent;
	}

	public void setMsgSendTime(Date msgSendTime) {
		this.msgSendTime = msgSendTime;
	}

	@JsonSerialize(using=DateTimeSerializer.class)
	public Date getMsgSendTime() {
		return this.msgSendTime;
	}

	public void setMsgSendUserId(int msgSendUserId) {
		this.msgSendUserId = msgSendUserId;
	}

	public int getMsgSendUserId() {
		return this.msgSendUserId;
	}
}