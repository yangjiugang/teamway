package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;

public class UserStudyHouse implements Serializable {

	private static final long serialVersionUID = 1L;
	private int studyId;
	private int houseId;
	private int userId;
	private Date studyStarttime;
	private Date studyEndtime;
	private String studyPlace;
	private String studyNotes;

	public void setStudyId(int studyId) {
		this.studyId = studyId;
	}

	public int getStudyId() {
		return this.studyId;
	}

	public void setHouseId(int houseId) {
		this.houseId = houseId;
	}

	public int getHouseId() {
		return this.houseId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getUserId() {
		return this.userId;
	}

	public void setStudyStarttime(Date studyStarttime) {
		this.studyStarttime = studyStarttime;
	}

	public Date getStudyStarttime() {
		return this.studyStarttime;
	}

	public void setStudyEndtime(Date studyEndtime) {
		this.studyEndtime = studyEndtime;
	}

	public Date getStudyEndtime() {
		return this.studyEndtime;
	}

	public void setStudyPlace(String studyPlace) {
		this.studyPlace = studyPlace;
	}

	public String getStudyPlace() {
		return this.studyPlace;
	}

	public void setStudyNotes(String studyNotes) {
		this.studyNotes = studyNotes;
	}

	public String getStudyNotes() {
		return this.studyNotes;
	}
}