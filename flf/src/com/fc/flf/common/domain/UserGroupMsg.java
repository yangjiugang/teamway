package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;

public class UserGroupMsg implements Serializable {

	private static final long serialVersionUID = 1L;
	private int msgId;
	private int groupId;
	private String msgContent;
	private Date createTime;

	public void setMsgId(int msgId) {
		this.msgId = msgId;
	}

	public int getMsgId() {
		return this.msgId;
	}

	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}

	public int getGroupId() {
		return this.groupId;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}

	public String getMsgContent() {
		return this.msgContent;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getCreateTime() {
		return this.createTime;
	}
}