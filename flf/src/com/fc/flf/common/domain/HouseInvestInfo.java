package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;

public class HouseInvestInfo implements Serializable {

	private static final long serialVersionUID = 1L;
	private int investId;
	private int houseId;
	private String investName;
	private Date registerDate;
	private int registerCapital;
	private String telephone;
	private String legalPerson;
	private String companyUrl;
	private String companyAddress;

	public void setInvestId(int investId) {
		this.investId = investId;
	}

	public int getInvestId() {
		return this.investId;
	}

	public void setHouseId(int houseId) {
		this.houseId = houseId;
	}

	public int getHouseId() {
		return this.houseId;
	}

	public void setInvestName(String investName) {
		this.investName = investName;
	}

	public String getInvestName() {
		return this.investName;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	public Date getRegisterDate() {
		return this.registerDate;
	}

	public void setRegisterCapital(int registerCapital) {
		this.registerCapital = registerCapital;
	}

	public int getRegisterCapital() {
		return this.registerCapital;
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