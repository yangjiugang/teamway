package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.fc.flf.common.conf.DateSerializer;

public class CustomerInfo implements Serializable {

	private static final long serialVersionUID = 1L;
	private int customerId;
	private String name;
//	private int sex = -1;
	private String photoPath;
	private int idType = -1;
	private String idNum;
	private Date birthday;
//	private String email;
	private String telphone;
//	private String cellphone;
	private String qQ;
	private String mSN;
	private String blog;
	private String weibo;
	private String workPlace;
	private String address;
	private String registeredAddress;
	private int citizenshipId;
	private String citizenship;
	private int nationId;
	private String nation;
	private int maritalStatus;
	private String highestEdu;
	private String school;
	private String profession;
	private Date firstWorkDate;
	private String business;
	private String company;
	private String jobDuty;
	private int income;
	private int createdUser;
	private Date createdAt;
	private int updatedUser;
	private Date updatedAt;
	private FcSysVisitor fcSysVisitor;

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public int getCustomerId() {
		return this.customerId;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return this.name;
	}

//	public void setSex(int sex) {
//		this.sex = sex;
//	}
//
//	public int getSex() {
//		return this.sex;
//	}

	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}

	public String getPhotoPath() {
		return this.photoPath;
	}

	public void setIdType(int idType) {
		this.idType = idType;
	}

	public int getIdType() {
		return this.idType;
	}

	public void setIdNum(String idNum) {
		this.idNum = idNum;
	}

	public String getIdNum() {
		return this.idNum;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	
	@JsonSerialize(using=DateSerializer.class)
	public Date getBirthday() {
		return this.birthday;
	}

//	public void setEmail(String email) {
//		this.email = email;
//	}
//
//	public String getEmail() {
//		return this.email;
//	}

	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}

	public String getTelphone() {
		return this.telphone;
	}

//	public void setCellphone(String cellphone) {
//		this.cellphone = cellphone;
//	}
//
//	public String getCellphone() {
//		return this.cellphone;
//	}

	public void setQQ(String qQ) {
		this.qQ = qQ;
	}

	public String getQQ() {
		return this.qQ;
	}

	public void setMSN(String mSN) {
		this.mSN = mSN;
	}

	public String getMSN() {
		return this.mSN;
	}

	public void setBlog(String blog) {
		this.blog = blog;
	}

	public String getBlog() {
		return this.blog;
	}

	public void setWeibo(String weibo) {
		this.weibo = weibo;
	}

	public String getWeibo() {
		return this.weibo;
	}

	public void setWorkPlace(String workPlace) {
		this.workPlace = workPlace;
	}

	public String getWorkPlace() {
		return this.workPlace;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress() {
		return this.address;
	}

	public void setRegisteredAddress(String registeredAddress) {
		this.registeredAddress = registeredAddress;
	}

	public String getRegisteredAddress() {
		return this.registeredAddress;
	}

	public void setCitizenshipId(int citizenshipId) {
		this.citizenshipId = citizenshipId;
	}

	public int getCitizenshipId() {
		return this.citizenshipId;
	}

	public void setCitizenship(String citizenship) {
		this.citizenship = citizenship;
	}

	public String getCitizenship() {
		return this.citizenship;
	}

	public void setNationId(int nationId) {
		this.nationId = nationId;
	}

	public int getNationId() {
		return this.nationId;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getNation() {
		return this.nation;
	}

	public void setMaritalStatus(int maritalStatus) {
		this.maritalStatus = maritalStatus;
	}

	public int getMaritalStatus() {
		return this.maritalStatus;
	}

	public void setHighestEdu(String highestEdu) {
		this.highestEdu = highestEdu;
	}

	public String getHighestEdu() {
		return this.highestEdu;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getSchool() {
		return this.school;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}

	public String getProfession() {
		return this.profession;
	}

	public void setFirstWorkDate(Date firstWorkDate) {
		this.firstWorkDate = firstWorkDate;
	}

	public Date getFirstWorkDate() {
		return this.firstWorkDate;
	}

	public void setBusiness(String business) {
		this.business = business;
	}

	public String getBusiness() {
		return this.business;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getCompany() {
		return this.company;
	}

	public void setJobDuty(String jobDuty) {
		this.jobDuty = jobDuty;
	}

	public String getJobDuty() {
		return this.jobDuty;
	}

	public void setIncome(int income) {
		this.income = income;
	}

	public int getIncome() {
		return this.income;
	}

	public void setCreatedUser(int createdUser) {
		this.createdUser = createdUser;
	}

	public int getCreatedUser() {
		return this.createdUser;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getCreatedAt() {
		return this.createdAt;
	}

	public void setUpdatedUser(int updatedUser) {
		this.updatedUser = updatedUser;
	}

	public int getUpdatedUser() {
		return this.updatedUser;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public Date getUpdatedAt() {
		return this.updatedAt;
	}

	public FcSysVisitor getFcSysVisitor() {
		return fcSysVisitor;
	}

	public void setFcSysVisitor(FcSysVisitor fcSysVisitor) {
		this.fcSysVisitor = fcSysVisitor;
	}
}