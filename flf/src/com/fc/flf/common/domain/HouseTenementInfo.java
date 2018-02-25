package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;

public class HouseTenementInfo implements Serializable {

	private static final long serialVersionUID = 1L;
	private int tenementId;
	private String tenementName;
	private Date registerDate;
	private int tenementLevel;
	private String companyAddress;
	private String telephone;
	private String parkingFee;
	private String companyUrl;
	private String managerCase;
	private int managerAreaTotal;
	private int managerFamilyTotal;
	private String tenementFee;
	private String legalPerson;

	public void setTenementId(int tenementId) {
		this.tenementId = tenementId;
	}

	public int getTenementId() {
		return this.tenementId;
	}

	public void setTenementName(String tenementName) {
		this.tenementName = tenementName;
	}

	public String getTenementName() {
		return this.tenementName;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	public Date getRegisterDate() {
		return this.registerDate;
	}

	public void setTenementLevel(int tenementLevel) {
		this.tenementLevel = tenementLevel;
	}

	public int getTenementLevel() {
		return this.tenementLevel;
	}

	public void setCompanyAddress(String companyAddress) {
		this.companyAddress = companyAddress;
	}

	public String getCompanyAddress() {
		return this.companyAddress;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getTelephone() {
		return this.telephone;
	}

	public void setParkingFee(String parkingFee) {
		this.parkingFee = parkingFee;
	}

	public String getParkingFee() {
		return this.parkingFee;
	}

	public void setCompanyUrl(String companyUrl) {
		this.companyUrl = companyUrl;
	}

	public String getCompanyUrl() {
		return this.companyUrl;
	}

	public void setManagerCase(String managerCase) {
		this.managerCase = managerCase;
	}

	public String getManagerCase() {
		return this.managerCase;
	}

	public void setManagerAreaTotal(int managerAreaTotal) {
		this.managerAreaTotal = managerAreaTotal;
	}

	public int getManagerAreaTotal() {
		return this.managerAreaTotal;
	}

	public void setManagerFamilyTotal(int managerFamilyTotal) {
		this.managerFamilyTotal = managerFamilyTotal;
	}

	public int getManagerFamilyTotal() {
		return this.managerFamilyTotal;
	}

	public void setTenementFee(String tenementFee) {
		this.tenementFee = tenementFee;
	}

	public String getTenementFee() {
		return this.tenementFee;
	}

	public void setLegalPerson(String legalPerson) {
		this.legalPerson = legalPerson;
	}

	public String getLegalPerson() {
		return this.legalPerson;
	}
}