package com.fc.brms.common.domain;

import java.io.Serializable;


public class CfgPostJoblevel implements Serializable {

	private static final long serialVersionUID = 1L;
	private int postId;
	private int jobLevelId;
	private int companyId;

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public int getPostId() {
		return this.postId;
	}

	public void setJobLevelId(int jobLevelId) {
		this.jobLevelId = jobLevelId;
	}

	public int getJobLevelId() {
		return this.jobLevelId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public int getCompanyId() {
		return this.companyId;
	}
}