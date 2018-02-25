package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class EventInfoCustomer implements Serializable {

	private static final long serialVersionUID = 1L;
	private CustomerInfoDetail customerInfoDetail;
	private int id;
	private int eventId;
	private int cusId;
	private int visitorType;
	private int customerId;
	private int isCheckin;
	private int isRegister;
	private String customerName;
	
	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	private String valuation;
	private String valuation1;
	private String valuation2;
	private String valuation3;
	private String valuation4;
	private Date createAt;
	public Date getCreateAt() {
		return createAt;
	}

	public void setCreate_at(Date createAt) {
		this.createAt = createAt;
	}

	private List<EventInfo> eventInfo;

	public List<EventInfo> getEventInfo() {
		return eventInfo;
	}

	public void setEventInfo(List<EventInfo> eventInfo) {
		this.eventInfo = eventInfo;
	}

	public CustomerInfoDetail getCustomerInfoDetail() {
		return customerInfoDetail;
	}

	public void setCustomerInfoDetail(CustomerInfoDetail customerInfoDetail) {
		this.customerInfoDetail = customerInfoDetail;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return this.id;
	}

	public void setEventId(int eventId) {
		this.eventId = eventId;
	}

	public int getEventId() {
		return this.eventId;
	}

	public void setCusId(int cusId) {
		this.cusId = cusId;
	}

	public int getCusId() {
		return this.cusId;
	}



	public int getVisitorType() {
		return visitorType;
	}

	public void setVisitorType(int visitorType) {
		this.visitorType = visitorType;
	}

	public void setIsCheckin(int isCheckin) {
		this.isCheckin = isCheckin;
	}

	public int getIsCheckin() {
		return this.isCheckin;
	}

	public void setIsRegister(int isRegister) {
		this.isRegister = isRegister;
	}

	public int getIsRegister() {
		return this.isRegister;
	}

	public void setValuation(String valuation) {
		this.valuation = valuation;
	}

	public String getValuation() {
		return this.valuation;
	}

	public void setValuation1(String valuation1) {
		this.valuation1 = valuation1;
	}

	public String getValuation1() {
		return this.valuation1;
	}

	public void setValuation2(String valuation2) {
		this.valuation2 = valuation2;
	}

	public String getValuation2() {
		return this.valuation2;
	}

	public void setValuation3(String valuation3) {
		this.valuation3 = valuation3;
	}

	public String getValuation3() {
		return this.valuation3;
	}

	public void setValuation4(String valuation4) {
		this.valuation4 = valuation4;
	}

	public String getValuation4() {
		return this.valuation4;
	}
}