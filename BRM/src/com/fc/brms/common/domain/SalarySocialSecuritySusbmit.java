package com.fc.brms.common.domain;

import java.io.Serializable;

public class SalarySocialSecuritySusbmit implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private int submitId;
	private int companyId;
	private String companyName;
	private int areaId;
	private String submitPlace;
	private int socialSecurityBase;
	private int houseFundBase;
	private int isChange;
	private String submitName;
	
	public String getSubmitName() {
		return submitName;
	}
	public void setSubmitName(String submitName) {
		this.submitName = submitName;
	}
	public int getSubmitId() {
		return submitId;
	}
	public void setSubmitId(int submitId) {
		this.submitId = submitId;
	}
	public int getCompanyId() {
		return companyId;
	}
	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public int getAreaId() {
		return areaId;
	}
	public void setAreaId(int areaId) {
		this.areaId = areaId;
	}
	public String getSubmitPlace() {
		return submitPlace;
	}
	public void setSubmitPlace(String submitPlace) {
		this.submitPlace = submitPlace;
	}
	public int getSocialSecurityBase() {
		return socialSecurityBase;
	}
	public void setSocialSecurityBase(int socialSecurityBase) {
		this.socialSecurityBase = socialSecurityBase;
	}
	public int getHouseFundBase() {
		return houseFundBase;
	}
	public void setHouseFundBase(int houseFundBase) {
		this.houseFundBase = houseFundBase;
	}
	public int getIsChange() {
		return isChange;
	}
	public void setIsChange(int isChange) {
		this.isChange = isChange;
	}
}
