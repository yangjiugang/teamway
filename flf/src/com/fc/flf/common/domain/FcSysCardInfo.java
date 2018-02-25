package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;

public class FcSysCardInfo implements Serializable {

	private static final long serialVersionUID = 1L;
	private int id;
	private String memberNum;
	private int visitorId;
	private int cardType;
	private int cardNum;
	private Date indate;

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return this.id;
	}

	public void setMemberNum(String memberNum) {
		this.memberNum = memberNum;
	}

	public String getMemberNum() {
		return this.memberNum;
	}

	public void setVisitorId(int visitorId) {
		this.visitorId = visitorId;
	}

	public int getVisitorId() {
		return this.visitorId;
	}

	public void setCardType(int cardType) {
		this.cardType = cardType;
	}

	public int getCardType() {
		return this.cardType;
	}

	public void setCardNum(int cardNum) {
		this.cardNum = cardNum;
	}

	public int getCardNum() {
		return this.cardNum;
	}

	public void setIndate(Date indate) {
		this.indate = indate;
	}

	public Date getIndate() {
		return this.indate;
	}
}