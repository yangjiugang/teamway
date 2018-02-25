package com.fc.brms.common.domain;

import java.io.Serializable;

public class EmployeeTalkContent implements Serializable {

	private static final long serialVersionUID = 1L;
	private int contentId;
	private int talkId;
	private int contentType;
	private String content;

	public void setContentId(int contentId) {
		this.contentId = contentId;
	}

	public int getContentId() {
		return this.contentId;
	}

	public void setTalkId(int talkId) {
		this.talkId = talkId;
	}

	public int getTalkId() {
		return this.talkId;
	}

	public void setContentType(int contentType) {
		this.contentType = contentType;
	}

	public int getContentType() {
		return this.contentType;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getContent() {
		return this.content;
	}
}