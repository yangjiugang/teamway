package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;

public class HouseCertificates implements Serializable {

	private static final long serialVersionUID = 1L;
	private int certificateId;
	private int houseId;
	private int picId;
	private String certificatNum;
	private String certificateName;
	private String certificatedOrganization;
	private Date certificateDate;

	public void setCertificateId(int certificateId) {
		this.certificateId = certificateId;
	}

	public int getCertificateId() {
		return this.certificateId;
	}

	public void setHouseId(int houseId) {
		this.houseId = houseId;
	}

	public int getHouseId() {
		return this.houseId;
	}

	public void setPicId(int picId) {
		this.picId = picId;
	}

	public int getPicId() {
		return this.picId;
	}

	public void setCertificatNum(String certificatNum) {
		this.certificatNum = certificatNum;
	}

	public String getCertificatNum() {
		return this.certificatNum;
	}

	public void setCertificateName(String certificateName) {
		this.certificateName = certificateName;
	}

	public String getCertificateName() {
		return this.certificateName;
	}

	public void setCertificatedOrganization(String certificatedOrganization) {
		this.certificatedOrganization = certificatedOrganization;
	}

	public String getCertificatedOrganization() {
		return this.certificatedOrganization;
	}

	public void setCertificateDate(Date certificateDate) {
		this.certificateDate = certificateDate;
	}

	public Date getCertificateDate() {
		return this.certificateDate;
	}
}