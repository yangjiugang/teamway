package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;

public class ClubStudyData implements Serializable {

	private static final long serialVersionUID = 1L;
	private int dataId;
	private int dataType;
	private int dataFormat;
	private String dataTitle;
	private int uploadUserType;
	private int uploadUserId;
	private Date uploadDateAt;
	
	private ClubStudyDataInfo clubStudyDataInfo;	//学习资料详细
	private ClubStudyDataAttachment clubStudyDataAttachment;	//学习资料附件
		
	public ClubStudyDataAttachment getClubStudyDataAttachment() {
		return clubStudyDataAttachment;
	}

	public void setClubStudyDataAttachment(
			ClubStudyDataAttachment clubStudyDataAttachment) {
		this.clubStudyDataAttachment = clubStudyDataAttachment;
	}

	public ClubStudyDataInfo getClubStudyDataInfo() {
		return clubStudyDataInfo;
	}

	public void setClubStudyDataInfo(ClubStudyDataInfo clubStudyDataInfo) {
		this.clubStudyDataInfo = clubStudyDataInfo;
	}

	public void setDataId(int dataId) {
		this.dataId = dataId;
	}

	public int getDataId() {
		return this.dataId;
	}

	public void setDataType(int dataType) {
		this.dataType = dataType;
	}

	public int getDataType() {
		return this.dataType;
	}

	public void setDataFormat(int dataFormat) {
		this.dataFormat = dataFormat;
	}

	public int getDataFormat() {
		return this.dataFormat;
	}

	public void setDataTitle(String dataTitle) {
		this.dataTitle = dataTitle;
	}

	public String getDataTitle() {
		return this.dataTitle;
	}

	public void setUploadUserType(int uploadUserType) {
		this.uploadUserType = uploadUserType;
	}

	public int getUploadUserType() {
		return this.uploadUserType;
	}

	public void setUploadUserId(int uploadUserId) {
		this.uploadUserId = uploadUserId;
	}

	public int getUploadUserId() {
		return this.uploadUserId;
	}

	public void setUploadDateAt(Date uploadDateAt) {
		this.uploadDateAt = uploadDateAt;
	}

	public Date getUploadDateAt() {
		return this.uploadDateAt;
	}
}