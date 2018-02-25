package com.fc.brms.common.domain;

import java.io.Serializable;
import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.fc.brms.common.conf.DateTimeSerializer;

public class EmployeeTransactionInfo implements Serializable {

	private static final long serialVersionUID = 1L;
	private int infoId;
	private int companyId;
	private int employeeId;
	private Date transactionDate;
	private int transactionType;
	private String transactionDesc;
	private int organizationId;
	private String organizationName;
	private int postId;
	private String postName;
	private int jobGradeId;
	private String jobGradeName;
	private int jobLevelId;
	private String jobLevelName;
	private int structureType;
	private int salaryLevelId;
	private int totalSalary;
	private int ssCompanyId;
	private int ssAreaId;
	private int ssBase;
	private String ssType;
	private int transactionStatus;
	// 异动前信息
	private int beforAreaId;
	private int beforCompanyId;
	private String beforOrganizationName;
	private int beforOrganizationId;
	private String beforPostName;         // 岗位
	private int beforPostId;
	private String beforJobGradeName;     // 职系
	private int beforJobGradeId;
	private String beforJobLevelName;     // 职等、职级
	private int beforJobLevelId;
	private int beforStructureType;
	private String beforCompanyName;      // 社保缴纳公司
	private String beforSubmitPlace;      // 社保缴纳地
	private int beforSocialSecurityBase;  // 社保缴纳基数
	private String beforSsName;
	private String beforSalaryLevelOrder;   // 薪酬等级
	private int beforSalaryTotal;  // 金额
	
	private EmployeeInfo employeeInfo;
	
	private SalarySocialSecurity salarySocialSecurity;
	
	private SalarySocialSecuritySusbmit salarySocialSecuritySusbmit;

	
	public int getBeforAreaId() {
		return beforAreaId;
	}

	public void setBeforAreaId(int beforAreaId) {
		this.beforAreaId = beforAreaId;
	}

	public int getBeforCompanyId() {
		return beforCompanyId;
	}

	public void setBeforCompanyId(int beforCompanyId) {
		this.beforCompanyId = beforCompanyId;
	}

	public int getBeforSalaryTotal() {
		return beforSalaryTotal;
	}

	public void setBeforSalaryTotal(int beforSalaryTotal) {
		this.beforSalaryTotal = beforSalaryTotal;
	}

	public String getBeforSalaryLevelOrder() {
		return beforSalaryLevelOrder;
	}

	public void setBeforSalaryLevelOrder(String beforSalaryLevelOrder) {
		this.beforSalaryLevelOrder = beforSalaryLevelOrder;
	}

	public String getBeforSsName() {
		return beforSsName;
	}

	public void setBeforSsName(String beforSsName) {
		this.beforSsName = beforSsName;
	}

	public SalarySocialSecurity getSalarySocialSecurity() {
		return salarySocialSecurity;
	}

	public void setSalarySocialSecurity(SalarySocialSecurity salarySocialSecurity) {
		this.salarySocialSecurity = salarySocialSecurity;
	}

	public SalarySocialSecuritySusbmit getSalarySocialSecuritySusbmit() {
		return salarySocialSecuritySusbmit;
	}
	
	public void setSalarySocialSecuritySusbmit(SalarySocialSecuritySusbmit salarySocialSecuritySusbmit) {
		this.salarySocialSecuritySusbmit = salarySocialSecuritySusbmit;
	}
	
	public int getInfoId() {
		return infoId;
	}

	public void setInfoId(int infoId) {
		this.infoId = infoId;
	}

	public int getCompanyId() {
		return companyId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public int getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}

	@JsonSerialize(using=DateTimeSerializer.class)
	public Date getTransactionDate() {
		return transactionDate;
	}

	public void setTransactionDate(Date transactionDate) {
		this.transactionDate = transactionDate;
	}

	public int getTransactionType() {
		return transactionType;
	}

	public void setTransactionType(int transactionType) {
		this.transactionType = transactionType;
	}

	public String getTransactionDesc() {
		return transactionDesc;
	}

	public void setTransactionDesc(String transactionDesc) {
		this.transactionDesc = transactionDesc;
	}

	public int getOrganizationId() {
		return organizationId;
	}

	public void setOrganizationId(int organizationId) {
		this.organizationId = organizationId;
	}

	public String getOrganizationName() {
		return organizationName;
	}

	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName;
	}

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public String getPostName() {
		return postName;
	}

	public void setPostName(String postName) {
		this.postName = postName;
	}

	public int getJobGradeId() {
		return jobGradeId;
	}

	public void setJobGradeId(int jobGradeId) {
		this.jobGradeId = jobGradeId;
	}

	public String getJobGradeName() {
		return jobGradeName;
	}

	public void setJobGradeName(String jobGradeName) {
		this.jobGradeName = jobGradeName;
	}

	public int getJobLevelId() {
		return jobLevelId;
	}

	public void setJobLevelId(int jobLevelId) {
		this.jobLevelId = jobLevelId;
	}

	public String getJobLevelName() {
		return jobLevelName;
	}

	public void setJobLevelName(String jobLevelName) {
		this.jobLevelName = jobLevelName;
	}

	public int getStructureType() {
		return structureType;
	}

	public void setStructureType(int structureType) {
		this.structureType = structureType;
	}

	public int getSalaryLevelId() {
		return salaryLevelId;
	}

	public void setSalaryLevelId(int salaryLevelId) {
		this.salaryLevelId = salaryLevelId;
	}

	public int getTotalSalary() {
		return totalSalary;
	}

	public void setTotalSalary(int totalSalary) {
		this.totalSalary = totalSalary;
	}

	public int getSsCompanyId() {
		return ssCompanyId;
	}

	public void setSsCompanyId(int ssCompanyId) {
		this.ssCompanyId = ssCompanyId;
	}

	public int getSsAreaId() {
		return ssAreaId;
	}

	public void setSsAreaId(int ssAreaId) {
		this.ssAreaId = ssAreaId;
	}

	public int getSsBase() {
		return ssBase;
	}

	public void setSsBase(int ssBase) {
		this.ssBase = ssBase;
	}

	public String getSsType() {
		return ssType;
	}

	public void setSsType(String ssType) {
		this.ssType = ssType;
	}

	public int getTransactionStatus() {
		return transactionStatus;
	}

	public void setTransactionStatus(int transactionStatus) {
		this.transactionStatus = transactionStatus;
	}

	public String getBeforOrganizationName() {
		return beforOrganizationName;
	}

	public void setBeforOrganizationName(String beforOrganizationName) {
		this.beforOrganizationName = beforOrganizationName;
	}

	public int getBeforOrganizationId() {
		return beforOrganizationId;
	}

	public void setBeforOrganizationId(int beforOrganizationId) {
		this.beforOrganizationId = beforOrganizationId;
	}

	public String getBeforPostName() {
		return beforPostName;
	}

	public void setBeforPostName(String beforPostName) {
		this.beforPostName = beforPostName;
	}

	public int getBeforPostId() {
		return beforPostId;
	}

	public void setBeforPostId(int beforPostId) {
		this.beforPostId = beforPostId;
	}

	public String getBeforJobGradeName() {
		return beforJobGradeName;
	}

	public void setBeforJobGradeName(String beforJobGradeName) {
		this.beforJobGradeName = beforJobGradeName;
	}

	public int getBeforJobGradeId() {
		return beforJobGradeId;
	}

	public void setBeforJobGradeId(int beforJobGradeId) {
		this.beforJobGradeId = beforJobGradeId;
	}

	public String getBeforJobLevelName() {
		return beforJobLevelName;
	}

	public void setBeforJobLevelName(String beforJobLevelName) {
		this.beforJobLevelName = beforJobLevelName;
	}

	public int getBeforJobLevelId() {
		return beforJobLevelId;
	}

	public void setBeforJobLevelId(int beforJobLevelId) {
		this.beforJobLevelId = beforJobLevelId;
	}

	public int getBeforStructureType() {
		return beforStructureType;
	}

	public void setBeforStructureType(int beforStructureType) {
		this.beforStructureType = beforStructureType;
	}

	public String getBeforCompanyName() {
		return beforCompanyName;
	}

	public void setBeforCompanyName(String beforCompanyName) {
		this.beforCompanyName = beforCompanyName;
	}

	public String getBeforSubmitPlace() {
		return beforSubmitPlace;
	}

	public void setBeforSubmitPlace(String beforSubmitPlace) {
		this.beforSubmitPlace = beforSubmitPlace;
	}

	public int getBeforSocialSecurityBase() {
		return beforSocialSecurityBase;
	}

	public void setBeforSocialSecurityBase(int beforSocialSecurityBase) {
		this.beforSocialSecurityBase = beforSocialSecurityBase;
	}

	public EmployeeInfo getEmployeeInfo() {
		return employeeInfo;
	}

	public void setEmployeeInfo(EmployeeInfo employeeInfo) {
		this.employeeInfo = employeeInfo;
	}
}