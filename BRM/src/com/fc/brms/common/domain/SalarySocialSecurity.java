package com.fc.brms.common.domain;

import java.io.Serializable;

public class SalarySocialSecurity implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private int socialSecurityId;
	private int companyId;
	private String ssName;
	private String ssDesc;
	private int areaId;
	private String areaName;
	private int hkType;
	private float endowmentInsuranceRate;
	private float endowmentInsurancePersonRate;
	private float endowmentInsuranceCompanyRate;
	private int endowmentInsurancePlus;
	private float unemploymentRate;
	private float unemploymentPersonRate;
	private float unemploymentCompanyRate;
	private int unemploymentPlus;
	private float healthInsuranceRate;
	private float healthInsurancePersonRate;
	private float healthInsuranceCompanyRate;
	private int healthInsurancePlus;
	private float injuryInsuranceRate;
	private float injuryInsurancePersonRate;
	private float injuryInsuranceCompanyRate;
	private int injuryInsurancePlus;
	private float birthInsuranceRate;
	private float birthInsurancePersonRate;
	private float birthInsuranceCompanyRate;
	private int birthInsurancePlus;
	private float housingFundRate;
	private float housingFundPersonRate;
	private float housingFundCompanyRate;
	private int housingFundPlus;
	private int others1;
	private int others2;
	private int others3;
	private int others4;
	private int isChange;
	public int getSocialSecurityId() {
		return socialSecurityId;
	}
	public void setSocialSecurityId(int socialSecurityId) {
		this.socialSecurityId = socialSecurityId;
	}
	public int getCompanyId() {
		return companyId;
	}
	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}
	public String getSsName() {
		return ssName;
	}
	public void setSsName(String ssName) {
		this.ssName = ssName;
	}
	public String getSsDesc() {
		return ssDesc;
	}
	public void setSsDesc(String ssDesc) {
		this.ssDesc = ssDesc;
	}
	public int getAreaId() {
		return areaId;
	}
	public void setAreaId(int areaId) {
		this.areaId = areaId;
	}
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	public int getHkType() {
		return hkType;
	}
	public void setHkType(int hkType) {
		this.hkType = hkType;
	}
	public float getEndowmentInsuranceRate() {
		return endowmentInsuranceRate;
	}
	public void setEndowmentInsuranceRate(float endowmentInsuranceRate) {
		this.endowmentInsuranceRate = endowmentInsuranceRate;
	}
	public float getEndowmentInsurancePersonRate() {
		return endowmentInsurancePersonRate;
	}
	public void setEndowmentInsurancePersonRate(float endowmentInsurancePersonRate) {
		this.endowmentInsurancePersonRate = endowmentInsurancePersonRate;
	}
	public float getEndowmentInsuranceCompanyRate() {
		return endowmentInsuranceCompanyRate;
	}
	public void setEndowmentInsuranceCompanyRate(float endowmentInsuranceCompanyRate) {
		this.endowmentInsuranceCompanyRate = endowmentInsuranceCompanyRate;
	}
	public int getEndowmentInsurancePlus() {
		return endowmentInsurancePlus;
	}
	public void setEndowmentInsurancePlus(int endowmentInsurancePlus) {
		this.endowmentInsurancePlus = endowmentInsurancePlus;
	}
	public float getUnemploymentRate() {
		return unemploymentRate;
	}
	public void setUnemploymentRate(float unemploymentRate) {
		this.unemploymentRate = unemploymentRate;
	}
	public float getUnemploymentPersonRate() {
		return unemploymentPersonRate;
	}
	public void setUnemploymentPersonRate(float unemploymentPersonRate) {
		this.unemploymentPersonRate = unemploymentPersonRate;
	}
	public float getUnemploymentCompanyRate() {
		return unemploymentCompanyRate;
	}
	public void setUnemploymentCompanyRate(float unemploymentCompanyRate) {
		this.unemploymentCompanyRate = unemploymentCompanyRate;
	}
	public int getUnemploymentPlus() {
		return unemploymentPlus;
	}
	public void setUnemploymentPlus(int unemploymentPlus) {
		this.unemploymentPlus = unemploymentPlus;
	}
	public float getHealthInsuranceRate() {
		return healthInsuranceRate;
	}
	public void setHealthInsuranceRate(float healthInsuranceRate) {
		this.healthInsuranceRate = healthInsuranceRate;
	}
	public float getHealthInsurancePersonRate() {
		return healthInsurancePersonRate;
	}
	public void setHealthInsurancePersonRate(float healthInsurancePersonRate) {
		this.healthInsurancePersonRate = healthInsurancePersonRate;
	}
	public float getHealthInsuranceCompanyRate() {
		return healthInsuranceCompanyRate;
	}
	public void setHealthInsuranceCompanyRate(float healthInsuranceCompanyRate) {
		this.healthInsuranceCompanyRate = healthInsuranceCompanyRate;
	}
	public int getHealthInsurancePlus() {
		return healthInsurancePlus;
	}
	public void setHealthInsurancePlus(int healthInsurancePlus) {
		this.healthInsurancePlus = healthInsurancePlus;
	}
	public float getInjuryInsuranceRate() {
		return injuryInsuranceRate;
	}
	public void setInjuryInsuranceRate(float injuryInsuranceRate) {
		this.injuryInsuranceRate = injuryInsuranceRate;
	}
	public float getInjuryInsurancePersonRate() {
		return injuryInsurancePersonRate;
	}
	public void setInjuryInsurancePersonRate(float injuryInsurancePersonRate) {
		this.injuryInsurancePersonRate = injuryInsurancePersonRate;
	}
	public float getInjuryInsuranceCompanyRate() {
		return injuryInsuranceCompanyRate;
	}
	public void setInjuryInsuranceCompanyRate(float injuryInsuranceCompanyRate) {
		this.injuryInsuranceCompanyRate = injuryInsuranceCompanyRate;
	}
	public int getInjuryInsurancePlus() {
		return injuryInsurancePlus;
	}
	public void setInjuryInsurancePlus(int injuryInsurancePlus) {
		this.injuryInsurancePlus = injuryInsurancePlus;
	}
	public float getBirthInsuranceRate() {
		return birthInsuranceRate;
	}
	public void setBirthInsuranceRate(float birthInsuranceRate) {
		this.birthInsuranceRate = birthInsuranceRate;
	}
	public float getBirthInsurancePersonRate() {
		return birthInsurancePersonRate;
	}
	public void setBirthInsurancePersonRate(float birthInsurancePersonRate) {
		this.birthInsurancePersonRate = birthInsurancePersonRate;
	}
	public float getBirthInsuranceCompanyRate() {
		return birthInsuranceCompanyRate;
	}
	public void setBirthInsuranceCompanyRate(float birthInsuranceCompanyRate) {
		this.birthInsuranceCompanyRate = birthInsuranceCompanyRate;
	}
	public int getBirthInsurancePlus() {
		return birthInsurancePlus;
	}
	public void setBirthInsurancePlus(int birthInsurancePlus) {
		this.birthInsurancePlus = birthInsurancePlus;
	}
	public float getHousingFundRate() {
		return housingFundRate;
	}
	public void setHousingFundRate(float housingFundRate) {
		this.housingFundRate = housingFundRate;
	}
	public float getHousingFundPersonRate() {
		return housingFundPersonRate;
	}
	public void setHousingFundPersonRate(float housingFundPersonRate) {
		this.housingFundPersonRate = housingFundPersonRate;
	}
	public float getHousingFundCompanyRate() {
		return housingFundCompanyRate;
	}
	public void setHousingFundCompanyRate(float housingFundCompanyRate) {
		this.housingFundCompanyRate = housingFundCompanyRate;
	}
	public int getHousingFundPlus() {
		return housingFundPlus;
	}
	public void setHousingFundPlus(int housingFundPlus) {
		this.housingFundPlus = housingFundPlus;
	}
	public int getOthers1() {
		return others1;
	}
	public void setOthers1(int others1) {
		this.others1 = others1;
	}
	public int getOthers2() {
		return others2;
	}
	public void setOthers2(int others2) {
		this.others2 = others2;
	}
	public int getOthers3() {
		return others3;
	}
	public void setOthers3(int others3) {
		this.others3 = others3;
	}
	public int getOthers4() {
		return others4;
	}
	public void setOthers4(int others4) {
		this.others4 = others4;
	}
	public int getIsChange() {
		return isChange;
	}
	public void setIsChange(int isChange) {
		this.isChange = isChange;
	}
	
}
