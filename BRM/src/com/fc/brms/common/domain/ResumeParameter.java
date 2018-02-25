package com.fc.brms.common.domain;

/**
 * 
 * @author 邓祥
 * 抓取简历需要用的参数
 * @version 2012-3-12
 */
public class ResumeParameter {

	/** 简历ID*/
	private String id;
	
	/** 存放ID的数组 */
    public String[] idList;
    
    private String checkboxId;
	
	/** 关键字*/
	private String key;
	
	/*
	 * 更新时间
	 */
	private String updateTime;
	
	/*
	 * 工作地区
	 */
	private String location;
	
	/*
	 * 人才热线
	 */
	private String eventTarget;
	
	/*
	 * 人才热线
	 */
	private String validation;
	
	/*
	 * 人才热线
	 */
	private String cjolstateid;
	
	/*
	 * 用来做下载简历的
	 */
	private String eventargument;
	
	
	/*
	 * 关联简历的个数
	 */
	private String actorConfig;
	
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getValidation() {
		return validation;
	}

	public void setValidation(String validation) {
		this.validation = validation;
	}

	public String getCjolstateid() {
		return cjolstateid;
	}

	public void setCjolstateid(String cjolstateid) {
		this.cjolstateid = cjolstateid;
	}

	public String getEventTarget() {
		return eventTarget;
	}

	public void setEventTarget(String eventTarget) {
		this.eventTarget = eventTarget;
	}

	public String getEventargument() {
		return eventargument;
	}

	public void setEventargument(String eventargument) {
		this.eventargument = eventargument;
	}

	public String[] getIdList() {
		return idList;
	}

	public void setIdList(String[] idList) {
		this.idList = idList;
	}

	public String getCheckboxId() {
		return checkboxId;
	}

	public void setCheckboxId(String checkboxId) {
		this.checkboxId = checkboxId;
	}

	public String getActorConfig() {
		return actorConfig;
	}

	public void setActorConfig(String actorConfig) {
		this.actorConfig = actorConfig;
	}
	
	
	

}
