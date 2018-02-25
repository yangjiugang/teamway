package com.fc.brms.common.domain;

import java.io.Serializable;
import java.util.Date;
import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.codehaus.jackson.map.ser.std.DateSerializer;

import com.fc.brms.common.conf.DateTimeSerializer;

public class EmployeeFamilyInfo implements Serializable {

	private static final long serialVersionUID = 1L;
	private int id;
	private int employeeId;
	private String memberName;
	private int relationship;
	private Date memberBirthday;
	private Date birthday;
	private String memberUnit;
	private String memberPost;
	private String telephone;
	private EmployeeInfo employeeInfo;

	public EmployeeInfo getEmployeeInfo() {
		return employeeInfo;
	}

	public void setEmployeeInfo(EmployeeInfo employeeInfo) {
		this.employeeInfo = employeeInfo;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return this.id;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}

	public int getEmployeeId() {
		return this.employeeId;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberName() {
		return this.memberName;
	}

	public void setRelationship(int relationship) {
		this.relationship = relationship;
	}

	public int getRelationship() {
		return this.relationship;
	}

	public void setMemberBirthday(Date memberBirthday) {
		this.memberBirthday = memberBirthday;
	}
	
	public Date getMemberBirthday() {
		return this.memberBirthday;
	}

	public void setMemberUnit(String memberUnit) {
		this.memberUnit = memberUnit;
	}

	public String getMemberUnit() {
		return this.memberUnit;
	}

	public void setMemberPost(String memberPost) {
		this.memberPost = memberPost;
	}

	public String getMemberPost() {
		return this.memberPost;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getTelephone() {
		return this.telephone;
	}
	
	@JsonSerialize(using=DateTimeSerializer.class)
	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

}