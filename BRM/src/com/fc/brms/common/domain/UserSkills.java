/**
 * Create Code By Zhenglh
 * Create Date : 2012.03.20
 * Class Desc : 用户技能专长信息
 * 
 */
package com.fc.brms.common.domain;

import java.io.Serializable;

public class UserSkills implements Serializable {

	private static final long serialVersionUID = 1L;
	private int skillId;
	private int userId;
	private String skillDesc;

	public void setSkillId(int skillId) {
		this.skillId = skillId;
	}

	public int getSkillId() {
		return this.skillId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getUserId() {
		return this.userId;
	}

	public void setSkillDesc(String skillDesc) {
		this.skillDesc = skillDesc;
	}

	public String getSkillDesc() {
		return this.skillDesc;
	}
}