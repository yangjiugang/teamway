package com.fc.brms.common.domain;

import java.io.Serializable;
import java.util.Date;

public class CfgCompany implements Serializable {

	private static final long serialVersionUID = 1L;
	private int companyId;
	private String companyName;
	private String companyShortName;
	private int areaId;
	private String companyCity;
	private String companyAddress;
	private String companyEmail;
	private String companyPhone;
	private String companyFax;
	private String companyLogo;
	private String companyUrl;
	private int companyPopulationScale;
	private String companyDesc;
	private String companyLegalPerson;
	private Date createDate;
	private int createUser;

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public int getCompanyId() {
		return this.companyId;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCompanyName() {
		return this.companyName;
	}

	public void setCompanyShortName(String companyShortName) {
		this.companyShortName = companyShortName;
	}

	public String getCompanyShortName() {
		return this.companyShortName;
	}

	public void setAreaId(int areaId) {
		this.areaId = areaId;
	}

	public int getAreaId() {
		return this.areaId;
	}

	public void setCompanyCity(String companyCity) {
		this.companyCity = companyCity;
	}

	public String getCompanyCity() {
		return this.companyCity;
	}

	public void setCompanyAddress(String companyAddress) {
		this.companyAddress = companyAddress;
	}

	public String getCompanyAddress() {
		return this.companyAddress;
	}

	public void setCompanyEmail(String email) {
		this.companyEmail = email;
	}

	public String getCompanyEmail() {
		return this.companyEmail;
	}

	public void setCompanyPhone(String companyPhone) {
		this.companyPhone = companyPhone;
	}

	public String getCompanyPhone() {
		return this.companyPhone;
	}

	public void setCompanyFax(String companyFax) {
		this.companyFax = companyFax;
	}

	public String getCompanyFax() {
		return this.companyFax;
	}

	public void setCompanyLogo(String companyLogo) {
		this.companyLogo = companyLogo;
	}

	public String getCompanyLogo() {
		return this.companyLogo;
	}

	public void setCompanyUrl(String companyUrl) {
		this.companyUrl = companyUrl;
	}

	public String getCompanyUrl() {
		return this.companyUrl;
	}

	public void setCompanyPopulationScale(int companyPopulationScale) {
		this.companyPopulationScale = companyPopulationScale;
	}

	public int getCompanyPopulationScale() {
		return this.companyPopulationScale;
	}

	public void setCompanyDesc(String companyDesc) {
		this.companyDesc = companyDesc;
	}

	public String getCompanyDesc() {
		return this.companyDesc;
	}

	public void setCompanyLegalPerson(String companyLegalPerson) {
		this.companyLegalPerson = companyLegalPerson;
	}

	public String getCompanyLegalPerson() {
		return this.companyLegalPerson;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateUser(int createUser) {
		this.createUser = createUser;
	}

	public int getCreateUser() {
		return this.createUser;
	}
}