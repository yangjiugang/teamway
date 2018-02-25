package com.fc.brms.common.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.fc.brms.common.conf.DateTimeSerializer;

public class EmployeeInfo implements Serializable {

	private static final long serialVersionUID = 1L;
	private int employeeId;
	private int userId;
	private String employeeNum;
	private String englishName;
	private String userName;
	private int userSex;
	private Date userBirthday;
	private String telephone;
	private String officePhone;
	private String enterpriseMail;
	private String photoPath;
	private int highestEducation;
	private String graduateSchool;
	private int areaId;
	private String hkPlace;
	private String socialSecurityNum;
	private int organizationId;
	private String organizationName;
	private int postId;
	private String postName;
	private int jobGradeId;
	private String jobGradeName;
	private int jobLevelId;
	private String jobLevelName;
	private int salaryLevelId;
	private String salaryLevelOrder;
	private int salaryTotal;
	private int structureType;
	private int socialSecurityId;
	private Date applyDate;
	private int isChange;
	private int fpsgPost;
	private Date entryDate;
	private Date turnoverDate;
	private String turnoverCause;
	private int submitId;
	private int bankId;
	private String bankNum;
	private int trainingCnt;
	private int contactCnt;
	private int isConsultant;
	private Date birthday;
	private int companyId;
	private Date fpsgTime;
	
	private Date lastContactTime;
	private String lastContactEmployee;
	private int mainContactCnt;
	private Date lastMainContactTime;
	private String lastMainContactEmployee;
	
	private CfgCompany cfgCompany;
	
	private String remindName;
	private FcSysMsg fcSysMsg;
	
	private List<FcSysVisitorRole> fcSysVisitorRole;
	private List<FcSysRole> fcSysRole;
	private String fcSysRoleNames;
	private String idOrName;
	private String startTime;
	private String endTime;
	private String Limit;
	
	private EmployeeInfoDetail employeeInfoDetail;
	
	@JsonSerialize(using=DateTimeSerializer.class)
	public Date getFpsgTime() {
		return fpsgTime;
	}

	public void setFpsgTime(Date fpsgTime) {
		this.fpsgTime = fpsgTime;
	}

	public String getLimit() {
		return Limit;
	}

	public void setLimit(String limit) {
		Limit = limit;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getIdOrName() {
		return idOrName;
	}

	public void setIdOrName(String idOrName) {
		this.idOrName = idOrName;
	}

	public String getRemindName() {
		return remindName;
	}

	public void setRemindName(String remindName) {
		this.remindName = remindName;
	}	

	public FcSysMsg getFcSysMsg() {
		return fcSysMsg;
	}

	public void setFcSysMsg(FcSysMsg fcSysMsg) {
		this.fcSysMsg = fcSysMsg;
	}
	
	public CfgCompany getCfgCompany() {
		return cfgCompany;
	}

	public void setCfgCompany(CfgCompany cfgCompany) {
		this.cfgCompany = cfgCompany;
	}

	@JsonSerialize(using=DateTimeSerializer.class)
	public Date getLastContactTime() {
		return lastContactTime;
	}

	public void setLastContactTime(Date lastContactTime) {
		this.lastContactTime = lastContactTime;
	}

	public String getLastContactEmployee() {
		return lastContactEmployee;
	}

	public void setLastContactEmployee(String lastContactEmployee) {
		this.lastContactEmployee = lastContactEmployee;
	}

	public int getMainContactCnt() {
		return mainContactCnt;
	}

	public void setMainContactCnt(int mainContactCnt) {
		this.mainContactCnt = mainContactCnt;
	}

	@JsonSerialize(using=DateTimeSerializer.class)
	public Date getLastMainContactTime() {
		return lastMainContactTime;
	}

	public void setLastMainContactTime(Date lastMainContactTime) {
		this.lastMainContactTime = lastMainContactTime;
	}

	public String getLastMainContactEmployee() {
		return lastMainContactEmployee;
	}

	public void setLastMainContactEmployee(String lastMainContactEmployee) {
		this.lastMainContactEmployee = lastMainContactEmployee;
	}

	public int getCompanyId() {
		return companyId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	@JsonSerialize(using=DateTimeSerializer.class)
	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	private java.util.Date submitTime; //参与时间
	private int score;  //得分
	private int isSubmit; //是否交卷（状态）
	private int bigScore; 
	private int smallScore;
	private Date bigTime;
	private Date smallTime;

	public int getBigScore() {
		return bigScore;
	}

	public void setBigScore(int bigScore) {
		this.bigScore = bigScore;
	}

	public int getSmallScore() {
		return smallScore;
	}

	public void setSmallScore(int smallScore) {
		this.smallScore = smallScore;
	}

	public Date getBigTime() {
		return bigTime;
	}

	public void setBigTime(Date bigTime) {
		this.bigTime = bigTime;
	}

	public Date getSmallTime() {
		return smallTime;
	}

	public void setSmallTime(Date smallTime) {
		this.smallTime = smallTime;
	}

	public java.util.Date getSubmitTime() {
		return submitTime;
	}

	public void setSubmitTime(java.util.Date submitTime) {
		this.submitTime = submitTime;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getIsSubmit() {
		return isSubmit;
	}

	public void setIsSubmit(int isSubmit) {
		this.isSubmit = isSubmit;
	}

	public String getOrganizationName() {
		return organizationName;
	}

	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName;
	}

	public String getPostName() {
		return postName;
	}

	public void setPostName(String postName) {
		this.postName = postName;
	}

	public String getJobGradeName() {
		return jobGradeName;
	}

	public void setJobGradeName(String jobGradeName) {
		this.jobGradeName = jobGradeName;
	}

	public String getJobLevelName() {
		return jobLevelName;
	}

	public void setJobLevelName(String jobLevelName) {
		this.jobLevelName = jobLevelName;
	}

	public String getSalaryLevelOrder() {
		return salaryLevelOrder;
	}

	public void setSalaryLevelOrder(String salaryLevelOrder) {
		this.salaryLevelOrder = salaryLevelOrder;
	}

	public int getSubmitId() {
		return submitId;
	}

	public void setSubmitId(int submitId) {
		this.submitId = submitId;
	}

	public int getIsConsultant() {
		return isConsultant;
	}

	public void setIsConsultant(int isConsultant) {
		this.isConsultant = isConsultant;
	}


	private EmployeeFamilyInfo employeeFamilyInfo;
	
	public EmployeeFamilyInfo getEmployeeFamilyInfo() {
		return employeeFamilyInfo;
	}

	public void setEmployeeFamilyInfo(EmployeeFamilyInfo employeeFamilyInfo) {
		this.employeeFamilyInfo = employeeFamilyInfo;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}

	public int getEmployeeId() {
		return this.employeeId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getUserId() {
		return this.userId;
	}

	public void setEmployeeNum(String employeeNum) {
		this.employeeNum = employeeNum;
	}

	public String getEmployeeNum() {
		return this.employeeNum;
	}

	public void setEnglishName(String englishName) {
		this.englishName = englishName;
	}

	public String getEnglishName() {
		return this.englishName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserSex(int userSex) {
		this.userSex = userSex;
	}

	public int getUserSex() {
		return this.userSex;
	}

	public void setUserBirthday(Date userBirthday) {
		this.userBirthday = userBirthday;
	}

	@JsonSerialize(using=DateTimeSerializer.class)
	public Date getUserBirthday() {
		return this.userBirthday;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getTelephone() {
		return this.telephone;
	}

	public void setOfficePhone(String officePhone) {
		this.officePhone = officePhone;
	}

	public String getOfficePhone() {
		return this.officePhone;
	}

	public void setEnterpriseMail(String enterpriseMail) {
		this.enterpriseMail = enterpriseMail;
	}

	public String getEnterpriseMail() {
		return this.enterpriseMail;
	}

	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}

	public String getPhotoPath() {
		return this.photoPath;
	}

	public void setHighestEducation(int highestEducation) {
		this.highestEducation = highestEducation;
	}

	public int getHighestEducation() {
		return this.highestEducation;
	}

	public void setGraduateSchool(String graduateSchool) {
		this.graduateSchool = graduateSchool;
	}

	public String getGraduateSchool() {
		return this.graduateSchool;
	}

	public void setAreaId(int areaId) {
		this.areaId = areaId;
	}

	public int getAreaId() {
		return this.areaId;
	}

	public void setHkPlace(String hkPlace) {
		this.hkPlace = hkPlace;
	}

	public String getHkPlace() {
		return this.hkPlace;
	}

	public void setSocialSecurityNum(String socialSecurityNum) {
		this.socialSecurityNum = socialSecurityNum;
	}

	public String getSocialSecurityNum() {
		return this.socialSecurityNum;
	}

	public void setOrganizationId(int organizationId) {
		this.organizationId = organizationId;
	}

	public int getOrganizationId() {
		return this.organizationId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public int getPostId() {
		return this.postId;
	}

	public void setJobGradeId(int jobGradeId) {
		this.jobGradeId = jobGradeId;
	}

	public int getJobGradeId() {
		return this.jobGradeId;
	}

	public void setJobLevelId(int jobLevelId) {
		this.jobLevelId = jobLevelId;
	}

	public int getJobLevelId() {
		return this.jobLevelId;
	}

	public void setSalaryLevelId(int salaryLevelId) {
		this.salaryLevelId = salaryLevelId;
	}

	public int getSalaryLevelId() {
		return this.salaryLevelId;
	}

	public void setSalaryTotal(int salaryTotal) {
		this.salaryTotal = salaryTotal;
	}

	public int getSalaryTotal() {
		return this.salaryTotal;
	}

	public void setStructureType(int structureType) {
		this.structureType = structureType;
	}

	public int getStructureType() {
		return this.structureType;
	}

	public void setSocialSecurityId(int socialSecurityId) {
		this.socialSecurityId = socialSecurityId;
	}

	public int getSocialSecurityId() {
		return this.socialSecurityId;
	}

	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}
	
	@JsonSerialize(using=DateTimeSerializer.class)
	public Date getApplyDate() {
		return this.applyDate;
	}

	public void setIsChange(int isChange) {
		this.isChange = isChange;
	}

	public int getIsChange() {
		return this.isChange;
	}

	public void setFpsgPost(int fpsgPost) {
		this.fpsgPost = fpsgPost;
	}

	public int getFpsgPost() {
		return this.fpsgPost;
	}

	public void setEntryDate(Date entryDate) {
		this.entryDate = entryDate;
	}

	@JsonSerialize(using=DateTimeSerializer.class)
	public Date getEntryDate() {
		return this.entryDate;
	}

	public void setTurnoverDate(Date turnoverDate) {
		this.turnoverDate = turnoverDate;
	}

	@JsonSerialize(using=DateTimeSerializer.class)
	public Date getTurnoverDate() {
		return this.turnoverDate;
	}

	public String getTurnoverCause() {
		return turnoverCause;
	}

	public void setTurnoverCause(String turnoverCause) {
		this.turnoverCause = turnoverCause;
	}

	public void setBankId(int bankId) {
		this.bankId = bankId;
	}

	public int getBankId() {
		return this.bankId;
	}

	public void setBankNum(String bankNum) {
		this.bankNum = bankNum;
	}

	public String getBankNum() {
		return this.bankNum;
	}

	public void setTrainingCnt(int trainingCnt) {
		this.trainingCnt = trainingCnt;
	}

	public int getTrainingCnt() {
		return this.trainingCnt;
	}

	public void setContactCnt(int contactCnt) {
		this.contactCnt = contactCnt;
	}

	public int getContactCnt() {
		return this.contactCnt;
	}

	public List<FcSysVisitorRole> getFcSysVisitorRole() {
		return fcSysVisitorRole;
	}

	public void setFcSysVisitorRole(List<FcSysVisitorRole> fcSysVisitorRole) {
		this.fcSysVisitorRole = fcSysVisitorRole;
	}

	public List<FcSysRole> getFcSysRole() {
		return fcSysRole;
	}

	public void setFcSysRole(List<FcSysRole> fcSysRole) {
		this.fcSysRole = fcSysRole;
	}

	public String getFcSysRoleNames() {
		return fcSysRoleNames;
	}

	public void setFcSysRoleNames(String fcSysRoleNames) {
		this.fcSysRoleNames = fcSysRoleNames;
	}

	public EmployeeInfoDetail getEmployeeInfoDetail() {
		return employeeInfoDetail;
	}

	public void setEmployeeInfoDetail(EmployeeInfoDetail employeeInfoDetail) {
		this.employeeInfoDetail = employeeInfoDetail;
	}
	
}