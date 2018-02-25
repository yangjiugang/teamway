/**
 * Create Code By Zhenglh
 * Create Date : 2012.03.20
 * Class Desc : 用户项目经历信息
 * 
 */
package com.fc.brms.common.domain;

import java.io.Serializable;
import java.util.Date;

public class UserProjectExperience implements Serializable {

	private static final long serialVersionUID = 1L;
	private int projectId;
	private int userId;
	private String projectDesc;

	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}

	public int getProjectId() {
		return this.projectId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getUserId() {
		return this.userId;
	}

	public void setProjectDesc(String projectDesc) {
		this.projectDesc = projectDesc;
	}

	public String getProjectDesc() {
		return this.projectDesc;
	}
}