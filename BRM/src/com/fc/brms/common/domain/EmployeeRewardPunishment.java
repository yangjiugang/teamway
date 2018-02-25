package com.fc.brms.common.domain;

import java.io.Serializable;
import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.fc.brms.common.conf.DateTimeSerializer;

public class EmployeeRewardPunishment implements Serializable {

	private static final long serialVersionUID = 1L;
	private int recordId;
	private int companyId;
	private int employeeId;
	private int organizationId;
	private String organizationName;
	private int postId;
	private String postName;
	private int jobGradeId;
	private String jobGradeName;
	private int jobLevelId;
	private String jobLevelName;
	private int recordType;
	private Date causeDate;
	private String praisePunishmentDesc;
	private Date recordDate;
	private String praisePunishmentMethod;
	private int praiseOrganizationId;
	private String praiseOrganizationName;
	private int praisePunishmentMoney;
	private int signEmployeeId;
	private String causeDateStart;
	private String causeDateEnd;
	private String idOrName;
	private String Limit;
	private EmployeeInfo employeeInfo;
	
	
	public String getLimit() {
		return Limit;
	}

	public void setLimit(String limit) {
		Limit = limit;
	}

	public String getCauseDateStart() {
		return causeDateStart;
	}

	public void setCauseDateStart(String causeDateStart) {
		this.causeDateStart = causeDateStart;
	}

	public String getCauseDateEnd() {
		return causeDateEnd;
	}

	public void setCauseDateEnd(String causeDateEnd) {
		this.causeDateEnd = causeDateEnd;
	}

	public String getIdOrName() {
		return idOrName;
	}

	public void setIdOrName(String idOrName) {
		this.idOrName = idOrName;
	}

	public EmployeeInfo getEmployeeInfo() {
		return employeeInfo;
	}

	public void setEmployeeInfo(EmployeeInfo employeeInfo) {
		this.employeeInfo = employeeInfo;
	}

	public void setRecordId(int recordId) {
		this.recordId = recordId;
	}

	public int getRecordId() {
		return this.recordId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public int getCompanyId() {
		return this.companyId;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}

	public int getEmployeeId() {
		return this.employeeId;
	}

	public void setOrganizationId(int organizationId) {
		this.organizationId = organizationId;
	}

	public int getOrganizationId() {
		return this.organizationId;
	}

	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName;
	}

	public String getOrganizationName() {
		return this.organizationName;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public int getPostId() {
		return this.postId;
	}

	public void setPostName(String postName) {
		this.postName = postName;
	}

	public String getPostName() {
		return this.postName;
	}

	public void setJobGradeId(int jobGradeId) {
		this.jobGradeId = jobGradeId;
	}

	public int getJobGradeId() {
		return this.jobGradeId;
	}

	public void setJobGradeName(String jobGradeName) {
		this.jobGradeName = jobGradeName;
	}

	public String getJobGradeName() {
		return this.jobGradeName;
	}

	public void setJobLevelId(int jobLevelId) {
		this.jobLevelId = jobLevelId;
	}

	public int getJobLevelId() {
		return this.jobLevelId;
	}

	public void setJobLevelName(String jobLevelName) {
		this.jobLevelName = jobLevelName;
	}

	public String getJobLevelName() {
		return this.jobLevelName;
	}

	public void setRecordType(int recordType) {
		this.recordType = recordType;
	}

	public int getRecordType() {
		return this.recordType;
	}

	public void setCauseDate(Date causeDate) {
		this.causeDate = causeDate;
	}

	@JsonSerialize(using=DateTimeSerializer.class)
	public Date getCauseDate() {
		return this.causeDate;
	}

	public void setPraisePunishmentDesc(String praisePunishmentDesc) {
		this.praisePunishmentDesc = praisePunishmentDesc;
	}

	public String getPraisePunishmentDesc() {
		return this.praisePunishmentDesc;
	}

	public void setRecordDate(Date recordDate) {
		this.recordDate = recordDate;
	}

	public Date getRecordDate() {
		return this.recordDate;
	}

	public void setPraisePunishmentMethod(String praisePunishmentMethod) {
		this.praisePunishmentMethod = praisePunishmentMethod;
	}

	public String getPraisePunishmentMethod() {
		return this.praisePunishmentMethod;
	}

	public void setPraiseOrganizationId(int praiseOrganizationId) {
		this.praiseOrganizationId = praiseOrganizationId;
	}

	public int getPraiseOrganizationId() {
		return this.praiseOrganizationId;
	}

	public void setPraiseOrganizationName(String praiseOrganizationName) {
		this.praiseOrganizationName = praiseOrganizationName;
	}

	public String getPraiseOrganizationName() {
		return this.praiseOrganizationName;
	}

	public void setPraisePunishmentMoney(int praisePunishmentMoney) {
		this.praisePunishmentMoney = praisePunishmentMoney;
	}

	public int getPraisePunishmentMoney() {
		return this.praisePunishmentMoney;
	}

	public void setSignEmployeeId(int signEmployeeId) {
		this.signEmployeeId = signEmployeeId;
	}

	public int getSignEmployeeId() {
		return this.signEmployeeId;
	}
}