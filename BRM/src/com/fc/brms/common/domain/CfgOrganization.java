package com.fc.brms.common.domain;

import java.io.Serializable;
import java.util.Date;

public class CfgOrganization implements Serializable {

	private static final long serialVersionUID = 1L;
	private int organizationId;
	private int companyId;
	private String organizationNum;
	private String organizationName;
	private int organizationLevel;
	private int higherOrganizationId;
	private int postPreparation;
	private Date createTime;
	private int createUser;
	private Date lastUpdateTime;
	private int lastUpdateUser;

	public void setOrganizationId(int organizationId) {
		this.organizationId = organizationId;
	}

	public int getOrganizationId() {
		return this.organizationId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public int getCompanyId() {
		return this.companyId;
	}

	public void setOrganizationNum(String organizationNum) {
		this.organizationNum = organizationNum;
	}

	public String getOrganizationNum() {
		return this.organizationNum;
	}

	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName;
	}

	public String getOrganizationName() {
		return this.organizationName;
	}

	public void setOrganizationLevel(int organizationLevel) {
		this.organizationLevel = organizationLevel;
	}

	public int getOrganizationLevel() {
		return this.organizationLevel;
	}

	public void setHigherOrganizationId(int higherOrganizationId) {
		this.higherOrganizationId = higherOrganizationId;
	}

	public int getHigherOrganizationId() {
		return this.higherOrganizationId;
	}

	public void setPostPreparation(int postPreparation) {
		this.postPreparation = postPreparation;
	}

	public int getPostPreparation() {
		return this.postPreparation;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateUser(int createUser) {
		this.createUser = createUser;
	}

	public int getCreateUser() {
		return this.createUser;
	}

	public void setLastUpdateTime(Date lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}

	public Date getLastUpdateTime() {
		return this.lastUpdateTime;
	}

	public void setLastUpdateUser(int lastUpdateUser) {
		this.lastUpdateUser = lastUpdateUser;
	}

	public int getLastUpdateUser() {
		return this.lastUpdateUser;
	}
}