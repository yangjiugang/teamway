package com.fc.flf.common.domain;

import java.io.Serializable;

public class UserFriends implements Serializable {

	private static final long serialVersionUID = 1L;
	private int id;
	private int friendId;
	private String friendName;
	private int userId;
	private String userName;
	private int groupId;
	private String groupName;
	private String column4;
	private UserInfo userInfo;
	private UserInfoDetail userInfoDetail;
	
	
	public UserInfoDetail getUserInfoDetail() {
		return userInfoDetail;
	}

	public void setUserInfoDetail(UserInfoDetail userInfoDetail) {
		this.userInfoDetail = userInfoDetail;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFriendName() {
		return friendName;
	}

	public void setFriendName(String friendName) {
		this.friendName = friendName;
	}
	
	public int getId() {
		return this.id;
	}

	public void setFriendId(int friendId) {
		this.friendId = friendId;
	}

	public int getFriendId() {
		return this.friendId;
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

	public void setColumn4(String column4) {
		this.column4 = column4;
	}

	public String getColumn4() {
		return this.column4;
	}
}