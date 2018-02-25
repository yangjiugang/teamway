package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;

public class HouseBuilder implements Serializable {

	private static final long serialVersionUID = 1L;
	private int builderId;
	private int houseId;
	private String builderName;
	private Date registerDate;
	private int builderLevel;
	private String houseCase;
	private String telephone;
	private String legalPerson;
	private String companyUrl;
	private String companyAddress;

	public void setBuilderId(int builderId) {
		this.builderId = builderId;
	}

	public int getBuilderId() {
		return this.builderId;
	}

	public void setHouseId(int houseId) {
		this.houseId = houseId;
	}

	public int getHouseId() {
		return this.houseId;
	}

	public void setBuilderName(String builderName) {
		this.builderName = builderName;
	}

	public String getBuilderName() {
		return this.builderName;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	public Date getRegisterDate() {
		return this.registerDate;
	}

	public void setBuilderLevel(int builderLevel) {
		this.builderLevel = builderLevel;
	}

	public int getBuilderLevel() {
		return this.builderLevel;
	}

	public void setHouseCase(String houseCase) {
		this.houseCase = houseCase;
	}

	public String getHouseCase() {
		return this.houseCase;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getTelephone() {
		return this.telephone;
	}

	public void setLegalPerson(String legalPerson) {
		this.legalPerson = legalPerson;
	}

	public String getLegalPerson() {
		return this.legalPerson;
	}

	public void setCompanyUrl(String companyUrl) {
		this.companyUrl = companyUrl;
	}

	public String getCompanyUrl() {
		return this.companyUrl;
	}

	public void setCompanyAddress(String companyAddress) {
		this.companyAddress = companyAddress;
	}

	public String getCompanyAddress() {
		return this.companyAddress;
	}
}