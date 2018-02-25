package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class CustomerInfoDetail implements Serializable {

	private static final long serialVersionUID = 1L;
	private int cusId;
	private int customerId;
	private String name;
	private int sex;
	private String photoPath;
	private int idType;
	private String idNum;
	private String iDNum;
	private Date birthday;
	private String telphone;
	private String cellphone;
	private String email;
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
	private Date updatedAt;
	private int isExchange;
	private int customerType;
	private int userPoints;	
	private List<HouseGroupCustomer> houseGroupCustomerList;
	private CustomerInterests customerInterests;
	private CustomerFamilyInfo customerFamilyInfos;
	private List<CustomerFamilyInfo> customerFamilyInfosList;
	private CustomerEduInfo customerEduInfo;
	private String birthPlace;
	private int countOrder;
	public int getIsExchange() {
		return isExchange;
	}

	public void setIsExchange(int isExchange) {
		this.isExchange = isExchange;
	}

	public int getCustomerType() {
		return customerType;
	}

	public void setCustomerType(int customerType) {
		this.customerType = customerType;
	}

	public int getUserPoints() {
		return userPoints;
	}

	public void setUserPoints(int userPoints) {
		this.userPoints = userPoints;
	}
	public int getCountOrder() {
		return countOrder;
	}

	public void setCountOrder(int countOrder) {
		this.countOrder = countOrder;
	}

	public int getCountDiscuss() {
		return countDiscuss;
	}

	public void setCountDiscuss(int countDiscuss) {
		this.countDiscuss = countDiscuss;
	}

	public int getCountGroup() {
		return countGroup;
	}

	public void setCountGroup(int countGroup) {
		this.countGroup = countGroup;
	}

	public int getCountEvent() {
		return countEvent;
	}

	public void setCountEvent(int countEvent) {
		this.countEvent = countEvent;
	}

	public int getCountLookFang() {
		return countLookFang;
	}

	public void setCountLookFang(int countLookFang) {
		this.countLookFang = countLookFang;
	}

	public int getCountOrderCode() {
		return countOrderCode;
	}

	public void setCountOrderCode(int countOrderCode) {
		this.countOrderCode = countOrderCode;
	}

	private int countDiscuss;
	private int countGroup;
	private int countEvent;
	private int countLookFang;
	private int countOrderCode;

	public String getBirthPlace() {
		return birthPlace;
	}

	public void setBirthPlace(String birthPlace) {
		this.birthPlace = birthPlace;
	}

	public CustomerEduInfo getCustomerEduInfo() {
		return customerEduInfo;
	}

	public void setCustomerEduInfo(CustomerEduInfo customerEduInfo) {
		this.customerEduInfo = customerEduInfo;
	}

	public CustomerFamilyInfo getCustomerFamilyInfos() {
		return customerFamilyInfos;
	}

	public void setCustomerFamilyInfos(CustomerFamilyInfo customerFamilyInfos) {
		this.customerFamilyInfos = customerFamilyInfos;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	public int getCusId() {
		return cusId;
	}

	public void setCusId(int cusId) {
		this.cusId = cusId;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public String getPhotoPath() {
		return photoPath;
	}

	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}

	public int getIdType() {
		return idType;
	}

	public void setIdType(int idType) {
		this.idType = idType;
	}	

	public String getIdNum() {
		return idNum;
	}

	public void setIdNum(String idNum) {
		this.idNum = idNum;
	}

	public Date getBirthday() {
		return birthday;
	}

	public String getiDNum() {
		return iDNum;
	}

	public void setiDNum(String iDNum) {
		this.iDNum = iDNum;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getTelphone() {
		return telphone;
	}

	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}

	public String getCellphone() {
		return cellphone;
	}

	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
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

	public String getBlog() {
		return blog;
	}

	public void setBlog(String blog) {
		this.blog = blog;
	}

	public String getWeibo() {
		return weibo;
	}

	public void setWeibo(String weibo) {
		this.weibo = weibo;
	}

	public String getWorkPlace() {
		return workPlace;
	}

	public void setWorkPlace(String workPlace) {
		this.workPlace = workPlace;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRegisteredAddress() {
		return registeredAddress;
	}

	public void setRegisteredAddress(String registeredAddress) {
		this.registeredAddress = registeredAddress;
	}

	public int getCitizenshipId() {
		return citizenshipId;
	}

	public void setCitizenshipId(int citizenshipId) {
		this.citizenshipId = citizenshipId;
	}

	public String getCitizenship() {
		return citizenship;
	}

	public void setCitizenship(String citizenship) {
		this.citizenship = citizenship;
	}

	public int getNationId() {
		return nationId;
	}

	public void setNationId(int nationId) {
		this.nationId = nationId;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public int getMaritalStatus() {
		return maritalStatus;
	}

	public void setMaritalStatus(int maritalStatus) {
		this.maritalStatus = maritalStatus;
	}

	public String getHighestEdu() {
		return highestEdu;
	}

	public void setHighestEdu(String highestEdu) {
		this.highestEdu = highestEdu;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getProfession() {
		return profession;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}

	public Date getFirstWorkDate() {
		return firstWorkDate;
	}

	public void setFirstWorkDate(Date firstWorkDate) {
		this.firstWorkDate = firstWorkDate;
	}

	public String getBusiness() {
		return business;
	}

	public void setBusiness(String business) {
		this.business = business;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getJobDuty() {
		return jobDuty;
	}

	public void setJobDuty(String jobDuty) {
		this.jobDuty = jobDuty;
	}

	public int getIncome() {
		return income;
	}

	public void setIncome(int income) {
		this.income = income;
	}

	public int getCreatedUser() {
		return createdUser;
	}

	public void setCreatedUser(int createdUser) {
		this.createdUser = createdUser;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public CustomerInterests getCustomerInterests() {
		return customerInterests;
	}

	public void setCustomerInterests(CustomerInterests customerInterests) {
		this.customerInterests = customerInterests;
	}

	public List<HouseGroupCustomer> getHouseGroupCustomerList() {
		return houseGroupCustomerList;
	}

	public void setHouseGroupCustomerList(List<HouseGroupCustomer> houseGroupCustomerList) {
		this.houseGroupCustomerList = houseGroupCustomerList;
	}
	
	public List<CustomerFamilyInfo> getCustomerFamilyInfosList() {
		return customerFamilyInfosList;
	}

	public void setCustomerFamilyInfosList(List<CustomerFamilyInfo> customerFamilyInfosList) {
		this.customerFamilyInfosList = customerFamilyInfosList;
	}

}