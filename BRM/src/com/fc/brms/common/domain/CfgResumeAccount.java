package com.fc.brms.common.domain;

import java.util.Date;

/**
 * 
 * @author 邓祥
 * 简历账号关联配置bean
 * @version 2012-3-30
 */
public class CfgResumeAccount {

	private int accountId;
	/** 账号名称(网站名称) 1:人才热线2:前程无忧3:58同城4:中华英才网**/ 
	private String accountName;
	/**会员名 **/
	private String memberName;
	/**账号 **/
	private String account;
	/** 密码**/
	private String accountPassword;
	/**发布职位数 **/
	private int publishJobs;
	/** 剩余职位数**/
	private int surplusJobs;
	/** 下载简历数**/
	private int downResumes;
	/** 剩余简历数**/
	private int surplusResumes;
	/**结束时间 **/
	private Date endDate;
	/** 使用状态**/
	private int accountStatus;
	/** 公司ID**/
	private int companyId;
	
	private String type;
	
	public int getAccountId() {
		return accountId;
	}
	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}
	public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getAccountPassword() {
		return accountPassword;
	}
	public void setAccountPassword(String accountPassword) {
		this.accountPassword = accountPassword;
	}
	public int getPublishJobs() {
		return publishJobs;
	}
	public void setPublishJobs(int publishJobs) {
		this.publishJobs = publishJobs;
	}
	public int getSurplusJobs() {
		return surplusJobs;
	}
	public void setSurplusJobs(int surplusJobs) {
		this.surplusJobs = surplusJobs;
	}
	public int getDownResumes() {
		return downResumes;
	}
	public void setDownResumes(int downResumes) {
		this.downResumes = downResumes;
	}
	public int getSurplusResumes() {
		return surplusResumes;
	}
	public void setSurplusResumes(int surplusResumes) {
		this.surplusResumes = surplusResumes;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public int getAccountStatus() {
		return accountStatus;
	}
	public void setAccountStatus(int accountStatus) {
		this.accountStatus = accountStatus;
	}
	public int getCompanyId() {
		return companyId;
	}
	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	public CfgResumeAccount() {
		this.accountName = "";
		
		this.memberName = "";
	
		this.account = "";
		
		this.accountPassword = "";
	
		this.publishJobs = 0;
		
		this.surplusJobs = 0;
		
		this.downResumes =0 ;
	
		this.surplusResumes = 0;
		
		this.accountStatus = 0;
		
		this.companyId = 0;
	}
	
}
