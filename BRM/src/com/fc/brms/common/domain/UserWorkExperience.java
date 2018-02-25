package com.fc.brms.common.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @author 邓祥
 * 工作经历
 * @version 2012-3-26
 */
public class UserWorkExperience implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int experienceId;
	private int userId;
	/**起时间 */
	private Date startDate;
	/**止时间 */
	private Date endDate;
	/** */
	private int businessId;
	/**行业类型 */
	private String industryTypes;
	/**公司名称 */
	private String companyName;
	/**公司简介 */
	private String companyDesc;
	/**公司人数规模 */
	private int companyPopulationScale;
	/** 部门*/
	private String department;
	/**工作性质 */
	private int workType;
	/** 最高职务*/
	private String highestPositions;
	/**主要职责描述 */
	private String mainResponsibilities;
	/**汇报对象 */
	private String reportTo;
	/**直接下属人数 */
	private int directSubordinates;
	/**主要工作成果1 */
	private String mainWork1;
	/**主要工作成果2*/
	private String mainWork2;
	/**主要工作成果3 */
	private String mainWork3;
	/** 补充说明*/
	private String additionalRemarks;
	/**证明人 */
	private String certifier;
	/**证明人联系电话 */
	private String certifierTelephone;
	/** 年收入*/
	private int annualIncome;
	/** 月薪*/
	private int monthlyPay;
	/** 离职原因*/
	private String reasonsForLeaving;

	
	public void setExperienceId(int experienceId) {
		this.experienceId = experienceId;
	}

	public int getExperienceId() {
		return this.experienceId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getUserId() {
		return this.userId;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getStartDate() {
		return this.startDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Date getEndDate() {
		return this.endDate;
	}

	public void setBusinessId(int businessId) {
		this.businessId = businessId;
	}

	public int getBusinessId() {
		return this.businessId;
	}

	public void setIndustryTypes(String industryTypes) {
		this.industryTypes = industryTypes;
	}

	public String getIndustryTypes() {
		return this.industryTypes;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCompanyName() {
		return this.companyName;
	}

	public void setCompanyDesc(String companyDesc) {
		this.companyDesc = companyDesc;
	}

	public String getCompanyDesc() {
		return this.companyDesc;
	}

	public void setCompanyPopulationScale(int companyPopulationScale) {
		this.companyPopulationScale = companyPopulationScale;
	}

	public int getCompanyPopulationScale() {
		return this.companyPopulationScale;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getDepartment() {
		return this.department;
	}

	public void setWorkType(int workType) {
		this.workType = workType;
	}

	public int getWorkType() {
		return this.workType;
	}

	public void setHighestPositions(String highestPositions) {
		this.highestPositions = highestPositions;
	}

	public String getHighestPositions() {
		return this.highestPositions;
	}

	public void setMainResponsibilities(String mainResponsibilities) {
		this.mainResponsibilities = mainResponsibilities;
	}

	public String getMainResponsibilities() {
		return this.mainResponsibilities;
	}

	public void setReportTo(String reportTo) {
		this.reportTo = reportTo;
	}

	public String getReportTo() {
		return this.reportTo;
	}

	public void setDirectSubordinates(int directSubordinates) {
		this.directSubordinates = directSubordinates;
	}

	public int getDirectSubordinates() {
		return this.directSubordinates;
	}

	public void setMainWork1(String mainWork1) {
		this.mainWork1 = mainWork1;
	}

	public String getMainWork1() {
		return this.mainWork1;
	}

	public void setMainWork2(String mainWork2) {
		this.mainWork2 = mainWork2;
	}

	public String getMainWork2() {
		return this.mainWork2;
	}

	public void setMainWork3(String mainWork3) {
		this.mainWork3 = mainWork3;
	}

	public String getMainWork3() {
		return this.mainWork3;
	}

	public void setAdditionalRemarks(String additionalRemarks) {
		this.additionalRemarks = additionalRemarks;
	}

	public String getAdditionalRemarks() {
		return this.additionalRemarks;
	}

	public void setCertifier(String certifier) {
		this.certifier = certifier;
	}

	public String getCertifier() {
		return this.certifier;
	}

	public void setCertifierTelephone(String certifierTelephone) {
		this.certifierTelephone = certifierTelephone;
	}

	public String getCertifierTelephone() {
		return this.certifierTelephone;
	}

	public void setAnnualIncome(int annualIncome) {
		this.annualIncome = annualIncome;
	}

	public int getAnnualIncome() {
		return this.annualIncome;
	}

	public void setMonthlyPay(int monthlyPay) {
		this.monthlyPay = monthlyPay;
	}

	public int getMonthlyPay() {
		return this.monthlyPay;
	}

	public void setReasonsForLeaving(String reasonsForLeaving) {
		this.reasonsForLeaving = reasonsForLeaving;
	}

	public String getReasonsForLeaving() {
		return this.reasonsForLeaving;
	}
}