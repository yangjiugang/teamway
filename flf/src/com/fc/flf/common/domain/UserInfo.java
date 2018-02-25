package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;

public class UserInfo implements Serializable {

	private static final long serialVersionUID = 1L;
	private int userId;
	private String name;
	private Date birth;
	private int sex;
	private String photoPath;
	private int areaId;
	private String userCity;
	private int bhri;
	private int trustrank;
	private String userSkills;
	private Date firstWorkDate;
	private String userDesc;
	private UserInfoDetail userInfoDetail;

	public UserInfoDetail getUserInfoDetail() {
		return userInfoDetail;
	}

	public void setUserInfoDetail(UserInfoDetail userInfoDetail) {
		this.userInfoDetail = userInfoDetail;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getUserId() {
		return this.userId;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return this.name;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public Date getBirth() {
		return this.birth;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public int getSex() {
		return this.sex;
	}

	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}

	public String getPhotoPath() {
		return this.photoPath;
	}

	public void setAreaId(int areaId) {
		this.areaId = areaId;
	}

	public int getAreaId() {
		return this.areaId;
	}

	public void setUserCity(String userCity) {
		this.userCity = userCity;
	}

	public String getUserCity() {
		return this.userCity;
	}

	public void setBhri(int bhri) {
		this.bhri = bhri;
	}

	public int getBhri() {
		return this.bhri;
	}

	public void setTrustrank(int trustrank) {
		this.trustrank = trustrank;
	}

	public int getTrustrank() {
		return this.trustrank;
	}

	public void setUserSkills(String userSkills) {
		this.userSkills = userSkills;
	}

	public String getUserSkills() {
		return this.userSkills;
	}

	public void setFirstWorkDate(Date firstWorkDate) {
		this.firstWorkDate = firstWorkDate;
	}

	public Date getFirstWorkDate() {
		return this.firstWorkDate;
	}

	public void setUserDesc(String userDesc) {
		this.userDesc = userDesc;
	}

	public String getUserDesc() {
		return this.userDesc;
	}
}