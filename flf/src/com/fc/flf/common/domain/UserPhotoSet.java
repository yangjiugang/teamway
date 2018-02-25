package com.fc.flf.common.domain;

import java.io.Serializable;

public class UserPhotoSet implements Serializable {

	private static final long serialVersionUID = 1L;
	private int setId;
	private int userId;
	private String setName;
	private String setDesc;
	private UserPhotos photos;
	public UserPhotos getPhotos() {
		return photos;
	}

	public void setPhotos(UserPhotos photos) {
		this.photos = photos;
	}

	public void setSetId(int setId) {
		this.setId = setId;
	}

	public int getSetId() {
		return this.setId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getUserId() {
		return this.userId;
	}

	public void setSetName(String setName) {
		this.setName = setName;
	}

	public String getSetName() {
		return this.setName;
	}

	public void setSetDesc(String setDesc) {
		this.setDesc = setDesc;
	}

	public String getSetDesc() {
		return this.setDesc;
	}
}