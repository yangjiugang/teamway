package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;

public class HouseDeveloperInfo implements Serializable {

	private static final long serialVersionUID = 1L;
	private int developerId;
	private String developerName;
	private Date registerDate;
	private int developerLevel;
	private String houseCase;
	private String telephone;
	private String legalPerson;
	private String companyUrl;
	private String companyAddress;

	public void setDeveloperId(int developerId) {
		this.developerId = developerId;
	}

	public int getDeveloperId() {
		return this.developerId;
	}

	public void setDeveloperName(String developerName) {
		this.developerName = developerName;
	}

	public String getDeveloperName() {
		return this.developerName;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	public Date getRegisterDate() {
		return this.registerDate;
	}

	public void setDeveloperLevel(int developerLevel) {
		this.developerLevel = developerLevel;
	}

	public int getDeveloperLevel() {
		return this.developerLevel;
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