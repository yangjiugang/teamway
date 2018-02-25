package com.fc.brms.common.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.fc.brms.common.conf.DateTimeSerializer;

public class UserTrackRecord implements Serializable {

	private static final long serialVersionUID = 1L;
	private int trackId;
	private int companyId;
	private int userId;
	private String talkNum;
	private int mainTalkOrganizationId;
	private String mainTalkOrganizationName;
	private int mainTalkPostId;
	private String mainTalkPostName;
	private int mainTalkEmployee;
	private String mainTalkEmployeeName;
	private Date startTime;
	private Date endTime;
	private int talkType;
	private String talkPlace;
	private String talkEstimate;
	private Date createTime;
	
	private List<UserTrackRecordContent> contents;
	
	public List<UserTrackRecordContent> getContents() {
		return contents;
	}

	public void setContents(List<UserTrackRecordContent> contents) {
		this.contents = contents;
	}

	public void setTrackId(int trackId) {
		this.trackId = trackId;
	}

	public int getTrackId() {
		return this.trackId;
	}

	public int getCompanyId() {
		return companyId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getUserId() {
		return this.userId;
	}

	public void setTalkNum(String talkNum) {
		this.talkNum = talkNum;
	}

	public String getTalkNum() {
		return this.talkNum;
	}

	public void setMainTalkOrganizationId(int mainTalkOrganizationId) {
		this.mainTalkOrganizationId = mainTalkOrganizationId;
	}

	public int getMainTalkOrganizationId() {
		return this.mainTalkOrganizationId;
	}

	public void setMainTalkOrganizationName(String mainTalkOrganizationName) {
		this.mainTalkOrganizationName = mainTalkOrganizationName;
	}

	public String getMainTalkOrganizationName() {
		return this.mainTalkOrganizationName;
	}

	public void setMainTalkPostId(int mainTalkPostId) {
		this.mainTalkPostId = mainTalkPostId;
	}

	public int getMainTalkPostId() {
		return this.mainTalkPostId;
	}

	public void setMainTalkPostName(String mainTalkPostName) {
		this.mainTalkPostName = mainTalkPostName;
	}

	public String getMainTalkPostName() {
		return this.mainTalkPostName;
	}

	public void setMainTalkEmployee(int mainTalkEmployee) {
		this.mainTalkEmployee = mainTalkEmployee;
	}

	public int getMainTalkEmployee() {
		return this.mainTalkEmployee;
	}

	public void setMainTalkEmployeeName(String mainTalkEmployeeName) {
		this.mainTalkEmployeeName = mainTalkEmployeeName;
	}

	public String getMainTalkEmployeeName() {
		return this.mainTalkEmployeeName;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	@JsonSerialize(using=DateTimeSerializer.class)
	public Date getStartTime() {
		return this.startTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public Date getEndTime() {
		return this.endTime;
	}

	public void setTalkType(int talkType) {
		this.talkType = talkType;
	}

	public int getTalkType() {
		return this.talkType;
	}

	public void setTalkPlace(String talkPlace) {
		this.talkPlace = talkPlace;
	}

	public String getTalkPlace() {
		return this.talkPlace;
	}

	public void setTalkEstimate(String talkEstimate) {
		this.talkEstimate = talkEstimate;
	}

	public String getTalkEstimate() {
		return this.talkEstimate;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getCreateTime() {
		return this.createTime;
	}
}