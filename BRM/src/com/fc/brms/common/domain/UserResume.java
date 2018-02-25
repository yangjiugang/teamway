/**
 * Create Code By Zhenglh
 * Create Date : 2012.03.20
 * Class Desc : 用户基本数据信息(用户简历)
 * 
 */
package com.fc.brms.common.domain;
import java.io.Serializable;
import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.fc.brms.common.conf.DateTimeSerializer;

public class UserResume implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int userId;
	/*
	 * 外部简历user_id
	 */
	private String resumeUserId;
	
	/*
	 * 外部简历概述
	 */
	private String resumeDepict;
	
	private String checkboxId;
	
	/*
	 * 人才编号
	 */
	private String userNum;
	/*
	 * 姓名
	 */
	private String userName;
	
	/*
	 * 年龄
	 */
	private String year;
	/*
	 * 性别
	 */
	private int userSex;
	/*
	 * 联系电话
	 */
	private String userTelphone;
	/*
	 * email
	 */
	private String email;
	/*
	 * 出生日期
	 */
	private Date userBirthday;
	/*
	 * 证件类型
	 */
	private int certificateType;
	/*
	 * 证件号码
	 */
	private String certificateNum;
	/*
	 * 身高
	 */
	private int userHeight;
	/*
	 * 照片
	 */
	private String photoPath;
	/*
	 * 户口所在城市id
	 */
	private int areaId;
	/*
	 * 户口所在地
	 */
	private String hkPlace;
	/*
	 * 籍贯
	 */
	private String birthPlace;
	/*
	 * 目前居住地
	 */
	private String userAddress;
	/*
	 * 最高学历
	 */
	private int highestEducation;
	/*
	 * 最高学历名称
	 */
	private String highestEducationName;
	/*
	 * 专业id
	 */
	private int professionId;
	/*
	 * 专业
	 */
	private String profession;
	/*
	 * 学位
	 */
	private int degree;
	/*
	 * 毕业院校
	 */
	private String graduateSchool;
	/*
	 * 毕业时间
	 */
	private Date graduateDate;
	/*
	 * 工作年限
	 */
	private String workYears;
	/*
	 * 婚姻
	 */
	private int isMarry;
	/*
	 * 政治身份
	 */
	private int politicalConnection;
	/*
	 * 
	 */
	private int businessId;
	/*
	 * 目前行业
	 */
	private String presentBusiness;
	/*
	 * 
	 */
	private int postId;
	/*
	 * 目前岗位
	 */
	private String presentPost;
	/*
	 * 目前年薪
	 */
	private int presentSalaryYear;
	/*
	 * 目前月薪
	 */
	private int presentSalaryMonth;
	/*
	 * 求职状态
	 */
	private int workStatus;
	/*
	 * 简历来源
	 */
	private String resumeFrom;
	/*
	 * 收录时间
	 */
	private Date createDate;
	/*
	 * 交流次数
	 */
	private int contactCnt;
	/*
	 * 最后交流人
	 */
	private int lastUpdateUser;
	/*
	 * 最后更新时间
	 */
	private Date lastUpdateDate;
	/*
	 * 简历更新日期
	 */
	private String updateDate;
	
	private EmployeeInfo employeeInfo;
	
	private CfgOrganization cfgOrganization;
	
	private CfgPost cfgPost;
	
	private RecruitInterviewProcess rip;
	
	private RecruitInterview ri;
	
	private int taskId;
	
	public int getTaskId() {
		return taskId;
	}

	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}

	public RecruitInterview getRi() {
		return ri;
	}

	public void setRi(RecruitInterview ri) {
		this.ri = ri;
	}

	public RecruitInterviewProcess getRip() {
		return rip;
	}

	public void setRip(RecruitInterviewProcess rip) {
		this.rip = rip;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getUserId() {
		return this.userId;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public String getResumeUserId() {
		return resumeUserId;
	}

	public void setResumeUserId(String resumeUserId) {
		this.resumeUserId = resumeUserId;
	}

	public void setUserNum(String userNum) {
		this.userNum = userNum;
	}

	public String getUserNum() {
		return this.userNum;
	}

	public String getResumeDepict() {
		return resumeDepict;
	}

	public void setResumeDepict(String resumeDepict) {
		this.resumeDepict = resumeDepict;
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

	public void setUserTelphone(String userTelphone) {
		this.userTelphone = userTelphone;
	}

	public String getUserTelphone() {
		return this.userTelphone;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmail() {
		return this.email;
	}

	public void setUserBirthday(Date userBirthday) {
		this.userBirthday = userBirthday;
	}

	@JsonSerialize(using=DateTimeSerializer.class)
	public Date getUserBirthday() {
		return this.userBirthday;
	}

	public void setCertificateType(int certificateType) {
		this.certificateType = certificateType;
	}

	public int getCertificateType() {
		return this.certificateType;
	}

	public void setCertificateNum(String certificateNum) {
		this.certificateNum = certificateNum;
	}

	public String getCertificateNum() {
		return this.certificateNum;
	}

	public void setUserHeight(int userHeight) {
		this.userHeight = userHeight;
	}

	public int getUserHeight() {
		return this.userHeight;
	}

	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}

	public String getPhotoPath() {
		return this.photoPath;
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

	public void setBirthPlace(String birthPlace) {
		this.birthPlace = birthPlace;
	}

	public String getBirthPlace() {
		return this.birthPlace;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserAddress() {
		return this.userAddress;
	}

	public void setHighestEducation(int highestEducation) {
		this.highestEducation = highestEducation;
	}

	public int getHighestEducation() {
		return this.highestEducation;
	}

	public void setProfessionId(int professionId) {
		this.professionId = professionId;
	}

	public int getProfessionId() {
		return this.professionId;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}

	public String getProfession() {
		return this.profession;
	}

	public void setDegree(int degree) {
		this.degree = degree;
	}

	public int getDegree() {
		return this.degree;
	}

	public void setGraduateSchool(String graduateSchool) {
		this.graduateSchool = graduateSchool;
	}

	public String getGraduateSchool() {
		return this.graduateSchool;
	}

	public void setGraduateDate(Date graduateDate) {
		this.graduateDate = graduateDate;
	}

	@JsonSerialize(using=DateTimeSerializer.class)
	public Date getGraduateDate() {
		return this.graduateDate;
	}

	public void setWorkYears(String workYears) {
		this.workYears = workYears;
	}

	public String getWorkYears() {
		return this.workYears;
	}
	
	public String getHighestEducationName() {
		return highestEducationName;
	}

	public void setHighestEducationName(String highestEducationName) {
		this.highestEducationName = highestEducationName;
	}

	public int getPresentSalaryMonth() {
		return presentSalaryMonth;
	}

	public void setPresentSalaryMonth(int presentSalaryMonth) {
		this.presentSalaryMonth = presentSalaryMonth;
	}

	public void setIsMarry(int isMarry) {
		this.isMarry = isMarry;
	}

	public int getIsMarry() {
		return this.isMarry;
	}

	public void setPoliticalConnection(int politicalConnection) {
		this.politicalConnection = politicalConnection;
	}

	public int getPoliticalConnection() {
		return this.politicalConnection;
	}

	public void setBusinessId(int businessId) {
		this.businessId = businessId;
	}

	public int getBusinessId() {
		return this.businessId;
	}

	public void setPresentBusiness(String presentBusiness) {
		this.presentBusiness = presentBusiness;
	}

	public String getPresentBusiness() {
		return this.presentBusiness;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public int getPostId() {
		return this.postId;
	}

	public void setPresentPost(String presentPost) {
		this.presentPost = presentPost;
	}
	
	public String getCheckboxId() {
		return checkboxId;
	}

	public void setCheckboxId(String checkboxId) {
		this.checkboxId = checkboxId;
	}

	public String getPresentPost() {
		return this.presentPost;
	}

	public void setPresentSalaryYear(int presentSalaryYear) {
		this.presentSalaryYear = presentSalaryYear;
	}

	public int getPresentSalaryYear() {
		return this.presentSalaryYear;
	}

	public void setWorkStatus(int workStatus) {
		this.workStatus = workStatus;
	}

	public int getWorkStatus() {
		return this.workStatus;
	}

	public void setResumeFrom(String resumeFrom) {
		this.resumeFrom = resumeFrom;
	}

	public String getResumeFrom() {
		return this.resumeFrom;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@JsonSerialize(using=DateTimeSerializer.class)
	public Date getCreateDate() {
		return this.createDate;
	}

	public void setContactCnt(int contactCnt) {
		this.contactCnt = contactCnt;
	}

	public int getContactCnt() {
		return this.contactCnt;
	}

	public void setLastUpdateUser(int lastUpdateUser) {
		this.lastUpdateUser = lastUpdateUser;
	}

	public int getLastUpdateUser() {
		return this.lastUpdateUser;
	}

	public void setLastUpdateDate(Date lastUpdateDate) {
		this.lastUpdateDate = lastUpdateDate;
	}

	@JsonSerialize(using=DateTimeSerializer.class)
	public Date getLastUpdateDate() {
		return this.lastUpdateDate;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public EmployeeInfo getEmployeeInfo() {
		return employeeInfo;
	}

	public void setEmployeeInfo(EmployeeInfo employeeInfo) {
		this.employeeInfo = employeeInfo;
	}

	public CfgOrganization getCfgOrganization() {
		return cfgOrganization;
	}

	public void setCfgOrganization(CfgOrganization cfgOrganization) {
		this.cfgOrganization = cfgOrganization;
	}

	public CfgPost getCfgPost() {
		return cfgPost;
	}

	public void setCfgPost(CfgPost cfgPost) {
		this.cfgPost = cfgPost;
	}
	
}