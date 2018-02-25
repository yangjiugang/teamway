package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;

public class UserGroup implements Serializable {

	private static final long serialVersionUID = 1L;
	private int groupId;
	private String groupName;
	private int groupType;
	private int userId;
	private int isManager;
	private Date createDate;

	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}

	public int getGroupId() {
		return this.groupId;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getGroupName() {
		return this.groupName;
	}

	public void setGroupType(int groupType) {
		this.groupType = groupType;
	}

	public int getGroupType() {
		return this.groupType;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getUserId() {
		return this.userId;
	}

	public void setIsManager(int isManager) {
		this.isManager = isManager;
	}

	public int getIsManager() {
		return this.isManager;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getCreateDate() {
		return this.createDate;
	}
}