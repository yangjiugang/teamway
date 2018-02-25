package com.fc.brms.common.domain;

import java.io.Serializable;
import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.fc.brms.common.conf.DateTimeSerializer;

public class EmployeeCheckingIn implements Serializable {

	private static final long serialVersionUID = 1L;
	private int employeeId;
	private Date startTime;
	private Date endTime;
	private int checkingType;
	private String cause;
	private int companyId;
	private int duration;
	private int checkingStatus;
	private String Limit;
	
	private int comeLateCNT;
	private int leaveEarlyCNT;
	private int absentCNT;
	private int leaveCNT;
	private int sickLeaveCNT;
	private int marriageCNT;
	private int maternityLeaveCNT;
	private int funeralLeaveCNT;
	private int homeLeaveCNT;
	private int annualLeaveCNT;
	private int extraWorkCNT;
	private String idOrName;	
	private String organizationName;
	private String searchTimeStart;
	private String searchTimeEnd;
	private EmployeeInfo employeeInfo;	
	
	
	public String getSearchTimeStart() {
		return searchTimeStart;
	}

	public void setSearchTimeStart(String searchTimeStart) {
		this.searchTimeStart = searchTimeStart;
	}

	public String getSearchTimeEnd() {
		return searchTimeEnd;
	}

	public void setSearchTimeEnd(String searchTimeEnd) {
		this.searchTimeEnd = searchTimeEnd;
	}

	public String getOrganizationName() {
		return organizationName;
	}

	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public int getCheckingStatus() {
		return checkingStatus;
	}

	public void setCheckingStatus(int checkingStatus) {
		this.checkingStatus = checkingStatus;
	}

	public int getCompanyId() {
		return companyId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public String getIdOrName() {
		return idOrName;
	}

	public void setIdOrName(String idOrName) {
		this.idOrName = idOrName;
	}

	public int getComeLateCNT() {
		return comeLateCNT;
	}

	public void setComeLateCNT(int comeLateCNT) {
		this.comeLateCNT = comeLateCNT;
	}

	public int getLeaveEarlyCNT() {
		return leaveEarlyCNT;
	}

	public void setLeaveEarlyCNT(int leaveEarlyCNT) {
		this.leaveEarlyCNT = leaveEarlyCNT;
	}

	public int getAbsentCNT() {
		return absentCNT;
	}

	public void setAbsentCNT(int absentCNT) {
		this.absentCNT = absentCNT;
	}

	public int getLeaveCNT() {
		return leaveCNT;
	}

	public void setLeaveCNT(int leaveCNT) {
		this.leaveCNT = leaveCNT;
	}

	public int getSickLeaveCNT() {
		return sickLeaveCNT;
	}

	public void setSickLeaveCNT(int sickLeaveCNT) {
		this.sickLeaveCNT = sickLeaveCNT;
	}

	public int getMarriageCNT() {
		return marriageCNT;
	}

	public void setMarriageCNT(int marriageCNT) {
		this.marriageCNT = marriageCNT;
	}

	public int getMaternityLeaveCNT() {
		return maternityLeaveCNT;
	}

	public void setMaternityLeaveCNT(int maternityLeaveCNT) {
		this.maternityLeaveCNT = maternityLeaveCNT;
	}

	public int getFuneralLeaveCNT() {
		return funeralLeaveCNT;
	}

	public void setFuneralLeaveCNT(int funeralLeaveCNT) {
		this.funeralLeaveCNT = funeralLeaveCNT;
	}

	public int getHomeLeaveCNT() {
		return homeLeaveCNT;
	}

	public void setHomeLeaveCNT(int homeLeaveCNT) {
		this.homeLeaveCNT = homeLeaveCNT;
	}

	public int getAnnualLeaveCNT() {
		return annualLeaveCNT;
	}

	public void setAnnualLeaveCNT(int annualLeaveCNT) {
		this.annualLeaveCNT = annualLeaveCNT;
	}

	public int getExtraWorkCNT() {
		return extraWorkCNT;
	}

	public void setExtraWorkCNT(int extraWorkCNT) {
		this.extraWorkCNT = extraWorkCNT;
	}

	public String getLimit() {
		return Limit;
	}

	public void setLimit(String limit) {
		Limit = limit;
	}

	public EmployeeInfo getEmployeeInfo() {
		return employeeInfo;
	}

	public void setEmployeeInfo(EmployeeInfo employeeInfo) {
		this.employeeInfo = employeeInfo;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}

	public int getEmployeeId() {
		return this.employeeId;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	
	@JsonSerialize(using=DateTimeSerializer.class)
	public Date getStartTime() {
		return this.startTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	
	@JsonSerialize(using=DateTimeSerializer.class)
	public Date getEndTime() {
		return this.endTime;
	}

	public void setCheckingType(int checkingType) {
		this.checkingType = checkingType;
	}

	public int getCheckingType() {
		return this.checkingType;
	}

	public void setCause(String cause) {
		this.cause = cause;
	}

	public String getCause() {
		return this.cause;
	}
}