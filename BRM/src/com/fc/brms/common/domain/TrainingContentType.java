package com.fc.brms.common.domain;

import java.io.Serializable;
import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.fc.brms.common.conf.DateTimeSerializer;

public class TrainingContentType implements Serializable {

	private static final long serialVersionUID = 1L;
	private int typeId;
	private int companyId;
	private String typeName;
	private Date createTime;
	private int createUser;
	private Date lastUpdateTime;
	private int lastUpdateUser;

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	public int getTypeId() {
		return this.typeId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public int getCompanyId() {
		return this.companyId;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getTypeName() {
		return this.typeName;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	@JsonSerialize(using=DateTimeSerializer.class)
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
	@JsonSerialize(using=DateTimeSerializer.class)
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