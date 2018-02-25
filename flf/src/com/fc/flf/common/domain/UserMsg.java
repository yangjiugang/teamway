package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;

public class UserMsg implements Serializable {


	private static final long serialVersionUID = 1L;
	private int id;
	private String msgContent;
	private int receiveUserId;
	private int receiveUserType;
	private int msgType;
	private int isRead;
	private int sendUserId;
	private String sendUserName;
	private int sendUserType;
	private Date sendTime;
	private UserInfo userInfo;
	
	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return this.id;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}

	public String getMsgContent() {
		return this.msgContent;
	}

	public void setReceiveUserId(int receiveUserId) {
		this.receiveUserId = receiveUserId;
	}

	public int getReceiveUserId() {
		return this.receiveUserId;
	}

	public void setReceiveUserType(int receiveUserType) {
		this.receiveUserType = receiveUserType;
	}

	public int getReceiveUserType() {
		return this.receiveUserType;
	}

	public void setMsgType(int msgType) {
		this.msgType = msgType;
	}

	public int getMsgType() {
		return this.msgType;
	}

	public void setIsRead(int isRead) {
		this.isRead = isRead;
	}

	public int getIsRead() {
		return this.isRead;
	}

	public void setSendUserId(int sendUserId) {
		this.sendUserId = sendUserId;
	}

	public int getSendUserId() {
		return this.sendUserId;
	}

	public String getSendUserName() {
		return sendUserName;
	}

	public void setSendUserName(String sendUserName) {
		this.sendUserName = sendUserName;
	}

	public void setSendUserType(int sendUserType) {
		this.sendUserType = sendUserType;
	}

	public int getSendUserType() {
		return this.sendUserType;
	}

	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}
	public Date getSendTime() {
		return this.sendTime;
	}
}