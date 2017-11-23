package com.teamway.cms.model;

import java.util.Date;
import java.util.List;

import com.teamway.cms.dbentity.Cms_config_roleEntity;
import com.teamway.cms.dbentity.Cms_config_userEntity;
import com.teamway.cms.dbentity.Cms_config_user_roleEntity;

public class TourCfgModel {
	private Long id;
	private String name;
	private String region;
	private String indexName;
	private Integer index;
	private Date gmt_modifield;
	private String code;
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long long1) {
		this.id = long1;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getIndexName() {
		return indexName;
	}
	public void setIndexName(String indexName) {
		this.indexName = indexName;
	}
	public Integer getIndex() {
		return index;
	}
	public void setIndex(Integer index) {
		this.index = index;
	}
	public Date getGmt_modifield() {
		return gmt_modifield;
	}
	public void setGmt_modifield(Date gmt_modifield) {
		this.gmt_modifield = gmt_modifield;
	}
	
	
	
}
