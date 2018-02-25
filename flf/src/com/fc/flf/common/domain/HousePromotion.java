package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;

public class HousePromotion implements Serializable {

	private static final long serialVersionUID = 1L;
	private int promotionId;
	private int picId;
	private int houseId;
	private int promotionType;
	private String promotionTitle;
	private String promotionCustomer;
	private String promotionKey;
	private int promotionPrice;
	private String promotionCondition;
	private String promotionContent;
	private Date promotionStartDate;
	private Date promotionEndDate;

	public void setPromotionId(int promotionId) {
		this.promotionId = promotionId;
	}

	public int getPromotionId() {
		return this.promotionId;
	}

	public void setPicId(int picId) {
		this.picId = picId;
	}

	public int getPicId() {
		return this.picId;
	}

	public void setHouseId(int houseId) {
		this.houseId = houseId;
	}

	public int getHouseId() {
		return this.houseId;
	}

	public void setPromotionType(int promotionType) {
		this.promotionType = promotionType;
	}

	public int getPromotionType() {
		return this.promotionType;
	}

	public void setPromotionTitle(String promotionTitle) {
		this.promotionTitle = promotionTitle;
	}

	public String getPromotionTitle() {
		return this.promotionTitle;
	}

	public void setPromotionCustomer(String promotionCustomer) {
		this.promotionCustomer = promotionCustomer;
	}

	public String getPromotionCustomer() {
		return this.promotionCustomer;
	}

	public void setPromotionKey(String promotionKey) {
		this.promotionKey = promotionKey;
	}

	public String getPromotionKey() {
		return this.promotionKey;
	}

	public void setPromotionPrice(int promotionPrice) {
		this.promotionPrice = promotionPrice;
	}

	public int getPromotionPrice() {
		return this.promotionPrice;
	}

	public void setPromotionCondition(String promotionCondition) {
		this.promotionCondition = promotionCondition;
	}

	public String getPromotionCondition() {
		return this.promotionCondition;
	}

	public void setPromotionContent(String promotionContent) {
		this.promotionContent = promotionContent;
	}

	public String getPromotionContent() {
		return this.promotionContent;
	}

	public void setPromotionStartDate(Date promotionStartDate) {
		this.promotionStartDate = promotionStartDate;
	}

	public Date getPromotionStartDate() {
		return this.promotionStartDate;
	}

	public void setPromotionEndDate(Date promotionEndDate) {
		this.promotionEndDate = promotionEndDate;
	}

	public Date getPromotionEndDate() {
		return this.promotionEndDate;
	}
}