package com.fc.brms.common.domain;

import java.io.Serializable;

public class EmployeeInfoDetail implements Serializable {

	private static final long serialVersionUID = 1L;
	private int employeeId;
	private int credentialType;
	private String credentialNum;
	private String userHomeAddress;
	private String userAddress;
	private String profession;
	private int degree;
	private int nationId;
	private String nation;
	private int isMarry;
	private int politicalConnection;
	private String email;
	private String msn;
	private String qq;
	private int foreignLanguages1;
	private int foreignLanguageLevel1;
	private int foreignLanguages2;
	private int foreignLanguageLevel2;
	private int drivingCertificateType;
	private int computerLevel;
	private String hobbies;

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}

	public int getEmployeeId() {
		return this.employeeId;
	}

	public void setCredentialType(int credentialType) {
		this.credentialType = credentialType;
	}

	public int getCredentialType() {
		return this.credentialType;
	}

	public void setCredentialNum(String credentialNum) {
		this.credentialNum = credentialNum;
	}

	public String getCredentialNum() {
		return this.credentialNum;
	}

	public void setUserHomeAddress(String userHomeAddress) {
		this.userHomeAddress = userHomeAddress;
	}

	public String getUserHomeAddress() {
		return this.userHomeAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserAddress() {
		return this.userAddress;
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

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmail() {
		return this.email;
	}

	public void setMsn(String msn) {
		this.msn = msn;
	}

	public String getMsn() {
		return this.msn;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getQq() {
		return this.qq;
	}

	public void setForeignLanguages1(int foreignLanguages1) {
		this.foreignLanguages1 = foreignLanguages1;
	}

	public int getForeignLanguages1() {
		return this.foreignLanguages1;
	}

	public void setForeignLanguageLevel1(int foreignLanguageLevel1) {
		this.foreignLanguageLevel1 = foreignLanguageLevel1;
	}

	public int getForeignLanguageLevel1() {
		return this.foreignLanguageLevel1;
	}

	public void setForeignLanguages2(int foreignLanguages2) {
		this.foreignLanguages2 = foreignLanguages2;
	}

	public int getForeignLanguages2() {
		return this.foreignLanguages2;
	}

	public void setForeignLanguageLevel2(int foreignLanguageLevel2) {
		this.foreignLanguageLevel2 = foreignLanguageLevel2;
	}

	public int getForeignLanguageLevel2() {
		return this.foreignLanguageLevel2;
	}

	public void setDrivingCertificateType(int drivingCertificateType) {
		this.drivingCertificateType = drivingCertificateType;
	}

	public int getDrivingCertificateType() {
		return this.drivingCertificateType;
	}

	public void setComputerLevel(int computerLevel) {
		this.computerLevel = computerLevel;
	}

	public int getComputerLevel() {
		return this.computerLevel;
	}

	public void setHobbies(String hobbies) {
		this.hobbies = hobbies;
	}

	public String getHobbies() {
		return this.hobbies;
	}
}