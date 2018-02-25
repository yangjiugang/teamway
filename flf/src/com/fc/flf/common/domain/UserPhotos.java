package com.fc.flf.common.domain;

import java.io.Serializable;
public class UserPhotos implements Serializable {

	private static final long serialVersionUID = 1L;
	private int photoId;
	private int setId;
	private int userId;
	private int hostIp;
	private String photoPath;

	public void setPhotoId(int photoId) {
		this.photoId = photoId;
	}

	public int getPhotoId() {
		return this.photoId;
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

	public void setHostIp(int hostIp) {
		this.hostIp = hostIp;
	}

	public int getHostIp() {
		return this.hostIp;
	}

	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}

	public String getPhotoPath() {
		return this.photoPath;
	}
}