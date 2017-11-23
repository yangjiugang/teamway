package com.teamway.cms.model;

import java.util.List;

import com.teamway.cms.dbentity.Cms_config_roleEntity;
import com.teamway.cms.dbentity.Cms_config_userEntity;
import com.teamway.cms.dbentity.Cms_config_user_roleEntity;

public class UserModel {
	private Cms_config_userEntity user;
	private List<Cms_config_roleEntity> roles;
	private List<Cms_config_user_roleEntity> user_roles;
	
	public Cms_config_userEntity getUser() {
		return user;
	}
	public void setUser(Cms_config_userEntity user) {
		this.user = user;
	}
	public List<Cms_config_roleEntity> getRoles() {
		return roles;
	}
	public void setRoles(List<Cms_config_roleEntity> roles) {
		this.roles = roles;
	}
	public  List<Cms_config_user_roleEntity> getUser_roles() {
		return user_roles;
	}
	public void setUser_roles( List<Cms_config_user_roleEntity> user_roles) {
		this.user_roles = user_roles;
	}
	
	
}
