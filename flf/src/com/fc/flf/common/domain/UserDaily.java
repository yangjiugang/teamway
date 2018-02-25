package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.fc.flf.common.conf.DateTimeSerializer;

public class UserDaily implements Serializable {

	private static final long serialVersionUID = 1L;
	private int id;
	private int userId;
	private String dailyTitle;
	private Date dailyTime;
	private String dailyContent;

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return this.id;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getUserId() {
		return this.userId;
	}

	public void setDailyTitle(String dailyTitle) {
		this.dailyTitle = dailyTitle;
	}

	public String getDailyTitle() {
		return this.dailyTitle;
	}

	public void setDailyTime(Date dailyTime) {
		this.dailyTime = dailyTime;
	}

	@JsonSerialize(using=DateTimeSerializer.class)
	public Date getDailyTime() {
		return this.dailyTime;
	}

	public void setDailyContent(String dailyContent) {
		this.dailyContent = dailyContent;
	}

	public String getDailyContent() {
		return this.dailyContent;
	}
}