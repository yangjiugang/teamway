package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;

public class CustomerFamilyInfo implements Serializable {

	private static final long serialVersionUID = 1L;
	private int famId;
	private int cusId;
	private String memberName;
	private String relationship;
	private Date birthday;
	private String workPlace;
	private String jobDuty;
	private String contactphone;
	private int age;

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public void setFamId(int famId) {
		this.famId = famId;
	}

	public int getFamId() {
		return this.famId;
	}

	public void setCusId(int cusId) {
		this.cusId = cusId;
	}

	public int getCusId() {
		return this.cusId;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberName() {
		return this.memberName;
	}

	public void setRelationship(String relationship) {
		this.relationship = relationship;
	}

	public String getRelationship() {
		return this.relationship;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public Date getBirthday() {
		return this.birthday;
	}

	public void setWorkPlace(String workPlace) {
		this.workPlace = workPlace;
	}

	public String getWorkPlace() {
		return this.workPlace;
	}

	public void setJobDuty(String jobDuty) {
		this.jobDuty = jobDuty;
	}

	public String getJobDuty() {
		return this.jobDuty;
	}

	public void setContactphone(String contactphone) {
		this.contactphone = contactphone;
	}

	public String getContactphone() {
		return this.contactphone;
	}
}