package com.fc.brms.common.domain;

import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.fc.brms.common.conf.DateTimeSerializer;


/**
 * 
 * @author 邓祥
 * 招聘任务
 * @version 2012-3-28
 */
public class RecruitTask  {
	
	/** **/
	private int taskId;
	/** 公司ID**/
	private int companyId;
	/**申请单号 **/
	private String requirementNum;
	/** **/
	private int requirementId;
	/** 任务单号**/
	private String taskNum;
	/** 用工部门ID**/
	private int organizationId;
	/** 用工部门**/
	private String organizationName;
	/** 待聘岗位名称ID**/
	private int postId;
	/** 待聘岗位名称**/
	private String postName;
	/** 用工人数**/
	private int userCnt;
	/** 招聘任务发出日期**/
	private Date recruitDate;
	/** 希望到岗日期**/
	private Date hopeWorkDate;
	/** 申请人id**/
	private int requireUserId;
	/** 申请人**/
	private String requireUserName;
	/** 申请人时间**/
	private Date requireDate;
	/** 配对简历数**/
	private int matchUsers;
	/** 已到岗人数**/
	private int recruitMembers;
	/** 任务单状态**/
	private int taskStatus;
	/** 任务单创建时间**/
	private Date taskCreateTime;
	/** 招聘原因**/
	private String taskDesc;
	
	
	
	public int getTaskId() {
		return taskId;
	}
	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}
	public int getCompanyId() {
		return companyId;
	}
	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}
	public String getRequirementNum() {
		return requirementNum;
	}
	public void setRequirementNum(String requirementNum) {
		this.requirementNum = requirementNum;
	}
	public int getRequirementId() {
		return requirementId;
	}
	public void setRequirementId(int requirementId) {
		this.requirementId = requirementId;
	}
	public String getTaskNum() {
		return taskNum;
	}
	public void setTaskNum(String taskNum) {
		this.taskNum = taskNum;
	}
	public int getOrganizationId() {
		return organizationId;
	}
	public void setOrganizationId(int organizationId) {
		this.organizationId = organizationId;
	}
	public String getOrganizationName() {
		return organizationName;
	}
	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName;
	}
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public String getPostName() {
		return postName;
	}
	public void setPostName(String postName) {
		this.postName = postName;
	}
	public int getUserCnt() {
		return userCnt;
	}
	public void setUserCnt(int userCnt) {
		this.userCnt = userCnt;
	}
	@JsonSerialize(using=DateTimeSerializer.class)
	public Date getRecruitDate() {
		return recruitDate;
	}
	public void setRecruitDate(Date recruitDate) {
		this.recruitDate = recruitDate;
	}
	@JsonSerialize(using=DateTimeSerializer.class)
	public Date getHopeWorkDate() {
		return hopeWorkDate;
	}
	public void setHopeWorkDate(Date hopeWorkDate) {
		this.hopeWorkDate = hopeWorkDate;
	}
	public int getRequireUserId() {
		return requireUserId;
	}
	public void setRequireUserId(int requireUserId) {
		this.requireUserId = requireUserId;
	}
	public String getRequireUserName() {
		return requireUserName;
	}
	public void setRequireUserName(String requireUserName) {
		this.requireUserName = requireUserName;
	}
	@JsonSerialize(using=DateTimeSerializer.class)
	public Date getRequireDate() {
		return requireDate;
	}
	public void setRequireDate(Date requireDate) {
		this.requireDate = requireDate;
	}
	public int getMatchUsers() {
		return matchUsers;
	}
	public void setMatchUsers(int matchUsers) {
		this.matchUsers = matchUsers;
	}
	public int getRecruitMembers() {
		return recruitMembers;
	}
	public void setRecruitMembers(int recruitMembers) {
		this.recruitMembers = recruitMembers;
	}
	public int getTaskStatus() {
		return taskStatus;
	}
	public void setTaskStatus(int taskStatus) {
		this.taskStatus = taskStatus;
	}
	@JsonSerialize(using=DateTimeSerializer.class)
	public Date getTaskCreateTime() {
		return taskCreateTime;
	}
	public void setTaskCreateTime(Date taskCreateTime) {
		this.taskCreateTime = taskCreateTime;
	}
	public String getTaskDesc() {
		return taskDesc;
	}
	public void setTaskDesc(String taskDesc) {
		this.taskDesc = taskDesc;
	}
	
	
	public RecruitTask() {
		 this.companyId = 0;
		 this.requirementNum= "";
		 this.requirementId = 0;
		 this.taskNum = "";
		 this.organizationId = 0;
		 this.organizationName= "";
		 this.postId =0 ;
		 this.postName = "";
		 this.userCnt = 0;
		 this.requireUserId = 0;
		 this.requireUserName = "";
		 this.matchUsers = 0;
		 this.recruitMembers = 0;
		 this.taskStatus = 0;
		 this.taskDesc = "";
		
	}
	
	
	
	
}
