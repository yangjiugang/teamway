package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;

public class UserFamilyInfo implements Serializable {

	private static final long serialVersionUID = 1L;
	private int id;
	private int userId;
	private String memberName;
	private String relationship;
	private Date birth;
	private String workCompany;
	private String duty;
	private String contactphone;

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return this.id;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getUserId() {
		return this.userId;
	}


	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public void setRelationship(String relationship) {
		this.relationship = relationship;
	}

	public String getRelationship() {
		return this.relationship;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public Date getBirth() {
		return this.birth;
	}

	public void setWorkCompany(String workCompany) {
		this.workCompany = workCompany;
	}

	public String getWorkCompany() {
		return this.workCompany;
	}

	public void setDuty(String duty) {
		this.duty = duty;
	}

	public String getDuty() {
		return this.duty;
	}

	public void setContactphone(String contactphone) {
		this.contactphone = contactphone;
	}

	public String getContactphone() {
		return this.contactphone;
	}
}