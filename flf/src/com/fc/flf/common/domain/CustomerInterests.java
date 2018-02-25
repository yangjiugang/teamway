package com.fc.flf.common.domain;

import java.io.Serializable;
public class CustomerInterests implements Serializable {

	private static final long serialVersionUID = 1L;
	private int id;
	private int cusId;
	private String interests;
	private String hobby;
	private String purchasingCondition;
	private String purchasingDirection;
	private String purchasingPrice;
	private String purchasingPlan;

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return this.id;
	}

	public void setCusId(int cusId) {
		this.cusId = cusId;
	}

	public int getCusId() {
		return this.cusId;
	}

	public void setInterests(String interests) {
		this.interests = interests;
	}

	public String getInterests() {
		return this.interests;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	public String getHobby() {
		return this.hobby;
	}

	public void setPurchasingCondition(String purchasingCondition) {
		this.purchasingCondition = purchasingCondition;
	}

	public String getPurchasingCondition() {
		return this.purchasingCondition;
	}

	public void setPurchasingDirection(String purchasingDirection) {
		this.purchasingDirection = purchasingDirection;
	}

	public String getPurchasingDirection() {
		return this.purchasingDirection;
	}

	public void setPurchasingPrice(String purchasingPrice) {
		this.purchasingPrice = purchasingPrice;
	}

	public String getPurchasingPrice() {
		return this.purchasingPrice;
	}

	public void setPurchasingPlan(String purchasingPlan) {
		this.purchasingPlan = purchasingPlan;
	}

	public String getPurchasingPlan() {
		return this.purchasingPlan;
	}
}