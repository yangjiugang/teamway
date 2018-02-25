package com.fc.flf.common.domain;

import java.io.Serializable;

public class UserInfoDetail implements Serializable {

	private static final long serialVersionUID = 1L;
	private int userId;
	private String iDcard;
	private String telphone;
	private String cellphone;
	private String qQ;
	private String mSN;
	private String weibo;
	private int citizenshipId;
	private String citizenship;
	private int nationId;
	private String nation;
	private int maritalStatus;
	private int height;
	private int weight;
	private String career;
	private int salary;
	private String highestDegree;
	private String graduateSchool;
	private String profession;
//	private String address;
	private String registeredAddress;
	private String emergencyPerson;
	private String emergencyPhone;
	private String hobbies;
	private String skills;
	private String blog;
	private String homeAddress;
	private String birthPlace;
	private CustomerInfoDetail customerInfoDetail;
	private CustomerInterests customerInterests;
	

	public String getBirthPlace() {
		return birthPlace;
	}

	public void setBirthPlace(String birthPlace) {
		this.birthPlace = birthPlace;
	}

	public String getHomeAddress() {
		return homeAddress;
	}

	public void setHomeAddress(String homeAddress) {
		this.homeAddress = homeAddress;
	}

	public CustomerInfoDetail getCustomerInfoDetail() {
		return customerInfoDetail;
	}

	public void setCustomerInfoDetail(CustomerInfoDetail customerInfoDetail) {
		this.customerInfoDetail = customerInfoDetail;
	}

	public CustomerInterests getCustomerInterests() {
		return customerInterests;
	}

	public void setCustomerInterests(CustomerInterests customerInterests) {
		this.customerInterests = customerInterests;
	}
	public String getBlog() {
		return blog;
	}

	public void setBlog(String blog) {
		this.blog = blog;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getUserId() {
		return this.userId;
	}

	public void setIDcard(String iDcard) {
		this.iDcard = iDcard;
	}

	public String getIDcard() {
		return this.iDcard;
	}

	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}

	public String getTelphone() {
		return this.telphone;
	}

	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}

	public String getCellphone() {
		return this.cellphone;
	}


	public String getiDcard() {
		return iDcard;
	}

	public void setiDcard(String iDcard) {
		this.iDcard = iDcard;
	}

	public String getqQ() {
		return qQ;
	}

	public void setqQ(String qQ) {
		this.qQ = qQ;
	}

	public String getmSN() {
		return mSN;
	}

	public void setmSN(String mSN) {
		this.mSN = mSN;
	}

	public void setWeibo(String weibo) {
		this.weibo = weibo;
	}

	public String getWeibo() {
		return this.weibo;
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

	public void setHeight(int height) {
		this.height = height;
	}

	public int getHeight() {
		return this.height;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public int getWeight() {
		return this.weight;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public String getCareer() {
		return this.career;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	public int getSalary() {
		return this.salary;
	}

	public void setHighestDegree(String highestDegree) {
		this.highestDegree = highestDegree;
	}

	public String getHighestDegree() {
		return this.highestDegree;
	}

	public void setGraduateSchool(String graduateSchool) {
		this.graduateSchool = graduateSchool;
	}

	public String getGraduateSchool() {
		return this.graduateSchool;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}

	public String getProfession() {
		return this.profession;
	}

//	public void setAddress(String address) {
//		this.address = address;
//	}
//
//	public String getAddress() {
//		return this.address;
//	}

	public void setRegisteredAddress(String registeredAddress) {
		this.registeredAddress = registeredAddress;
	}

	public String getRegisteredAddress() {
		return this.registeredAddress;
	}

	public void setEmergencyPerson(String emergencyPerson) {
		this.emergencyPerson = emergencyPerson;
	}

	public String getEmergencyPerson() {
		return this.emergencyPerson;
	}

	public void setEmergencyPhone(String emergencyPhone) {
		this.emergencyPhone = emergencyPhone;
	}

	public String getEmergencyPhone() {
		return this.emergencyPhone;
	}

	public void setHobbies(String hobbies) {
		this.hobbies = hobbies;
	}

	public String getHobbies() {
		return this.hobbies;
	}

	public void setSkills(String skills) {
		this.skills = skills;
	}

	public String getSkills() {
		return this.skills;
	}
}