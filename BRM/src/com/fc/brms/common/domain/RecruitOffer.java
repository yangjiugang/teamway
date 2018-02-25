/**
 * Create Code By Zhenglh
 * Create Date : 2012.03.26
 * 
 */
package com.fc.brms.common.domain;

import java.io.Serializable;
import java.util.Date;

public class RecruitOffer implements Serializable {

	private static final long serialVersionUID = 1L;
	private int offerId;
	private int taskId;
	private int interviewId;
	private int companyId;
	private int resumeId;
	private String userName;
	private String userTelphone;
	private String email;
	private int userDept;
	private String organizationName;
	private int userPost;
	private String postName;
	private Date probationDate;
	private Date positiveDate;
	private int probationSalary;
	private int positiveSalary;
	private int contactId;
	private String contactUser;
	private String contactUserEmail;
	private String contactPhone;
	private int offerStatus;
	private Date arriveDate;

	public void setOfferId(int offerId) {
		this.offerId = offerId;
	}

	public int getOfferId() {
		return this.offerId;
	}

	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}

	public int getTaskId() {
		return this.taskId;
	}

	public void setInterviewId(int interviewId) {
		this.interviewId = interviewId;
	}

	public int getInterviewId() {
		return this.interviewId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public int getCompanyId() {
		return this.companyId;
	}

	public void setResumeId(int resumeId) {
		this.resumeId = resumeId;
	}

	public int getResumeId() {
		return this.resumeId;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserTelphone(String userTelphone) {
		this.userTelphone = userTelphone;
	}

	public String getUserTelphone() {
		return this.userTelphone;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmail() {
		return this.email;
	}

	public void setUserDept(int userDept) {
		this.userDept = userDept;
	}

	public int getUserDept() {
		return this.userDept;
	}

	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName;
	}

	public String getOrganizationName() {
		return this.organizationName;
	}

	public void setUserPost(int userPost) {
		this.userPost = userPost;
	}

	public int getUserPost() {
		return this.userPost;
	}

	public void setPostName(String postName) {
		this.postName = postName;
	}

	public String getPostName() {
		return this.postName;
	}

	public void setProbationDate(Date probationDate) {
		this.probationDate = probationDate;
	}

	public Date getProbationDate() {
		return this.probationDate;
	}

	public void setPositiveDate(Date positiveDate) {
		this.positiveDate = positiveDate;
	}

	public Date getPositiveDate() {
		return this.positiveDate;
	}

	public void setProbationSalary(int probationSalary) {
		this.probationSalary = probationSalary;
	}

	public int getProbationSalary() {
		return this.probationSalary;
	}

	public void setPositiveSalary(int positiveSalary) {
		this.positiveSalary = positiveSalary;
	}

	public int getPositiveSalary() {
		return this.positiveSalary;
	}

	public void setContactId(int contactId) {
		this.contactId = contactId;
	}

	public int getContactId() {
		return this.contactId;
	}

	public void setContactUser(String contactUser) {
		this.contactUser = contactUser;
	}

	public String getContactUser() {
		return this.contactUser;
	}

	public void setContactUserEmail(String contactUserEmail) {
		this.contactUserEmail = contactUserEmail;
	}

	public String getContactUserEmail() {
		return this.contactUserEmail;
	}

	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}

	public String getContactPhone() {
		return this.contactPhone;
	}

	public void setOfferStatus(int offerStatus) {
		this.offerStatus = offerStatus;
	}

	public int getOfferStatus() {
		return this.offerStatus;
	}

	public void setArriveDate(Date arriveDate) {
		this.arriveDate = arriveDate;
	}

	public Date getArriveDate() {
		return this.arriveDate;
	}
}