package com.fc.flf.common.domain;

import java.io.Serializable;

public class ClubStudyDataAttachment implements Serializable {

	private static final long serialVersionUID = 1L;
	private int attachmentId;
	private int dataId;
	private int attachmentHost;
	private String attachmentPath;

	public void setAttachmentId(int attachmentId) {
		this.attachmentId = attachmentId;
	}

	public int getAttachmentId() {
		return this.attachmentId;
	}

	public void setDataId(int dataId) {
		this.dataId = dataId;
	}

	public int getDataId() {
		return this.dataId;
	}

	public void setAttachmentHost(int attachmentHost) {
		this.attachmentHost = attachmentHost;
	}

	public int getAttachmentHost() {
		return this.attachmentHost;
	}

	public void setAttachmentPath(String attachmentPath) {
		this.attachmentPath = attachmentPath;
	}

	public String getAttachmentPath() {
		return this.attachmentPath;
	}
}