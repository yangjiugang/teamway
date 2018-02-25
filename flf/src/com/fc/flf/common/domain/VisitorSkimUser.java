package com.fc.flf.common.domain;
import java.io.Serializable;
import java.util.Date;

public class VisitorSkimUser implements Serializable {

	private static final long serialVersionUID = 1L;
	private int skimId;
	private int visitorType;
	private int visitorId;
	private int userId;
	private Date skimDate;
	// 最近到访客户,如果是当前蜂蜜的客户查询customer_info_detial
	// 否则查询 customer_info
	private Object object;
	private int current;
	
	public int getCurrent() {
		return current;
	}

	public void setCurrent(int current) {
		this.current = current;
	}

	public Object getObject() {
		return object;
	}

	public void setObject(Object object) {
		this.object = object;
	}

	public void setSkimId(int skimId) {
		this.skimId = skimId;
	}

	public int getSkimId() {
		return this.skimId;
	}

	public void setVisitorType(int visitorType) {
		this.visitorType = visitorType;
	}

	public int getVisitorType() {
		return this.visitorType;
	}

	public void setVisitorId(int visitorId) {
		this.visitorId = visitorId;
	}

	public int getVisitorId() {
		return this.visitorId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getUserId() {
		return this.userId;
	}

	public void setSkimDate(Date skimDate) {
		this.skimDate = skimDate;
	}

	public Date getSkimDate() {
		return this.skimDate;
	}
}