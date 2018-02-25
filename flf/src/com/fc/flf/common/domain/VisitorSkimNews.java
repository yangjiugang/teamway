package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;

public class VisitorSkimNews implements Serializable {

	private static final long serialVersionUID = 1L;
	private int skimId;
	private int contentId;
	private int visitorType;
	private int contentType;
	private int visitorId;
	private Date skimTime;

	public void setSkimId(int skimId) {
		this.skimId = skimId;
	}

	public int getSkimId() {
		return this.skimId;
	}

	public void setContentId(int contentId) {
		this.contentId = contentId;
	}

	public int getContentId() {
		return this.contentId;
	}

	public void setVisitorType(int visitorType) {
		this.visitorType = visitorType;
	}

	public int getVisitorType() {
		return this.visitorType;
	}

	public void setContentType(int contentType) {
		this.contentType = contentType;
	}

	public int getContentType() {
		return this.contentType;
	}

	public void setVisitorId(int visitorId) {
		this.visitorId = visitorId;
	}

	public int getVisitorId() {
		return this.visitorId;
	}

	public void setSkimTime(Date skimTime) {
		this.skimTime = skimTime;
	}

	public Date getSkimTime() {
		return this.skimTime;
	}
}