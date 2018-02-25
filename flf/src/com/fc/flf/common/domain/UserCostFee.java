package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.fc.flf.common.conf.DateSerializer;

public class UserCostFee implements Serializable {

	private static final long serialVersionUID = 1L;
	private int costId;
	private int userId;
	private Date costTime;
	private int costItem;
	private int costFee;
	private String costRemark;
	private String iCountFee;

	public String getiCountFee() {
		return iCountFee;
	}

	public void setiCountFee(String iCountFee) {
		this.iCountFee = iCountFee;
	}

	public void setCostId(int costId) {
		this.costId = costId;
	}

	public int getCostId() {
		return this.costId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getUserId() {
		return this.userId;
	}

	public void setCostTime(Date costTime) {
		this.costTime = costTime;
	}

	// 修改String型便于页面显示
	@JsonSerialize(using=DateSerializer.class)
	public Date getCostTime() {
		return this.costTime;
	}
	
	public void setCostItem(int costItem) {
		this.costItem = costItem;
	}

	public int getCostItem() {
		return this.costItem;
	}

	public void setCostFee(int costFee) {
		this.costFee = costFee;
	}

	public int getCostFee() {
		return this.costFee;
	}

	public void setCostRemark(String costRemark) {
		this.costRemark = costRemark;
	}

	public String getCostRemark() {
		return this.costRemark;
	}
}