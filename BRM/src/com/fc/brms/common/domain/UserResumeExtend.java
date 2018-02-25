/**
 * Create Code By Zhenglh
 * Create Date : 2012.03.20
 * Class Desc : 用户基本数据信息(用户简历)
 * 
 */
package com.fc.brms.common.domain;

import java.io.Serializable;

public class UserResumeExtend implements Serializable {

	private static final long serialVersionUID = 1L;
	private int userId;
	private int nationId;
	private String nation;
	private int politicalConnection;
	private int foreignLanguages1;
	private int foreignLanguageLevel1;
	private int foreignLanguages2;
	private int foreignLanguageLevel2;
	private int drivingCertificateType;
	private int computerLevel;
	private String userHomeAddress;
	private String hobbies;
	private String msn;
	private String qQ;

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getUserId() {
		return this.userId;
	}

	public void setNationId(int nationId) {
		this.nationId = nationId;
	}

	public int getNationId() {
		return this.nationId;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getNation() {
		return this.nation;
	}

	public void setPoliticalConnection(int politicalConnection) {
		this.politicalConnection = politicalConnection;
	}

	public int getPoliticalConnection() {
		return this.politicalConnection;
	}

	public void setForeignLanguages1(int foreignLanguages1) {
		this.foreignLanguages1 = foreignLanguages1;
	}

	public int getForeignLanguages1() {
		return this.foreignLanguages1;
	}

	public void setForeignLanguageLevel1(int foreignLanguageLevel1) {
		this.foreignLanguageLevel1 = foreignLanguageLevel1;
	}

	public int getForeignLanguageLevel1() {
		return this.foreignLanguageLevel1;
	}

	public void setForeignLanguages2(int foreignLanguages2) {
		this.foreignLanguages2 = foreignLanguages2;
	}

	public int getForeignLanguages2() {
		return this.foreignLanguages2;
	}

	public void setForeignLanguageLevel2(int foreignLanguageLevel2) {
		this.foreignLanguageLevel2 = foreignLanguageLevel2;
	}

	public int getForeignLanguageLevel2() {
		return this.foreignLanguageLevel2;
	}

	public void setDrivingCertificateType(int drivingCertificateType) {
		this.drivingCertificateType = drivingCertificateType;
	}

	public int getDrivingCertificateType() {
		return this.drivingCertificateType;
	}

	public void setComputerLevel(int computerLevel) {
		this.computerLevel = computerLevel;
	}

	public int getComputerLevel() {
		return this.computerLevel;
	}

	public void setUserHomeAddress(String userHomeAddress) {
		this.userHomeAddress = userHomeAddress;
	}

	public String getUserHomeAddress() {
		return this.userHomeAddress;
	}

	public void setHobbies(String hobbies) {
		this.hobbies = hobbies;
	}

	public String getHobbies() {
		return this.hobbies;
	}

	public void setMsn(String msn) {
		this.msn = msn;
	}

	public String getMsn() {
		return this.msn;
	}

	public void setQQ(String qQ) {
		this.qQ = qQ;
	}

	public String getQQ() {
		return this.qQ;
	}
}