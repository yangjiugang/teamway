package com.fc.brms.common.domain;

import java.io.Serializable;
import java.util.Date;

public class CfgPost implements Serializable {

	private static final long serialVersionUID = 1L;
	private int postId;
	private String postNo;
	private String postName;
	private int organizationId;
	private int jobGradeId;
	private int postPersons;
	private int isFpsg;
	private int lowestSalaryLevel;
	private int highestSalaryLevel;
	private int higherPostId;
	private Date createDate;
	private int createUser;
	private Date lastUpdateTime;
	private int lastUpdateUser;
	private CfgJobGrade cfgJobGrade;
	private CfgJobLevel cfgJobLevel;
	private CfgPostJoblevel cfgPostJobLevel;
	public CfgJobLevel getCfgJobLevel() {
		return cfgJobLevel;
	}

	public void setCfgJobLevel(CfgJobLevel cfgJobLevel) {
		this.cfgJobLevel = cfgJobLevel;
	}

	public CfgPostJoblevel getCfgPostJoblevel() {
		return cfgPostJoblevel;
	}

	public void setCfgPostJoblevel(CfgPostJoblevel cfgPostJoblevel) {
		this.cfgPostJoblevel = cfgPostJoblevel;
	}

	private CfgPostJoblevel cfgPostJoblevel;

	public CfgJobGrade getCfgJobGrade() {
		return cfgJobGrade;
	}

	public void setCfgJobGrade(CfgJobGrade cfgJobGrade) {
		this.cfgJobGrade = cfgJobGrade;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public int getPostId() {
		return this.postId;
	}

	public void setPostNo(String postNo) {
		this.postNo = postNo;
	}

	public String getPostNo() {
		return this.postNo;
	}

	public void setPostName(String postName) {
		this.postName = postName;
	}

	public String getPostName() {
		return this.postName;
	}

	public void setOrganizationId(int organizationId) {
		this.organizationId = organizationId;
	}

	public int getOrganizationId() {
		return this.organizationId;
	}

	public void setJobGradeId(int jobGradeId) {
		this.jobGradeId = jobGradeId;
	}

	public int getJobGradeId() {
		return this.jobGradeId;
	}

	public void setPostPersons(int postPersons) {
		this.postPersons = postPersons;
	}

	public int getPostPersons() {
		return this.postPersons;
	}

	public void setIsFpsg(int isFpsg) {
		this.isFpsg = isFpsg;
	}

	public int getIsFpsg() {
		return this.isFpsg;
	}

	public void setLowestSalaryLevel(int lowestSalaryLevel) {
		this.lowestSalaryLevel = lowestSalaryLevel;
	}

	public int getLowestSalaryLevel() {
		return this.lowestSalaryLevel;
	}

	public void setHighestSalaryLevel(int highestSalaryLevel) {
		this.highestSalaryLevel = highestSalaryLevel;
	}

	public int getHighestSalaryLevel() {
		return this.highestSalaryLevel;
	}

	public void setHigherPostId(int higherPostId) {
		this.higherPostId = higherPostId;
	}

	public int getHigherPostId() {
		return this.higherPostId;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getCreateDate() {
		return this.createDate;
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