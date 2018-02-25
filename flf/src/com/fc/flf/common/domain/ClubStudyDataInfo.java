package com.fc.flf.common.domain;

import java.io.Serializable;

public class ClubStudyDataInfo implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private int dataId;
	private String contentText;
	
	public int getDataId() {
		return dataId;
	}
	public void setDataId(int dataId) {
		this.dataId = dataId;
	}
	public String getContentText() {
		return contentText;
	}
	public void setContentText(String contentText) {
		this.contentText = contentText;
	}
	
}