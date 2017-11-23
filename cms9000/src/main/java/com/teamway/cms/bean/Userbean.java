package com.teamway.cms.bean;

public class Userbean {
	private int id;
	private String login_name;
	private String password;
	private String user_name;
	private String mobile;
	private String email;
	private String login_time;
	private String last_login_time;
	private int count;
	private String gmt_ctreate;
	private String gmt_modified;
	private String remark;
	
	
	public Userbean(int id, String login_name, String password, String user_name, String mobile, String email,
			String login_time, String last_login_time, int count, String gmt_ctreate, String gmt_modified,
			String remark) {
		super();
		this.id = id;
		this.login_name = login_name;
		this.password = password;
		this.user_name = user_name;
		this.mobile = mobile;
		this.email = email;
		this.login_time = login_time;
		this.last_login_time = last_login_time;
		this.count = count;
		this.gmt_ctreate = gmt_ctreate;
		this.gmt_modified = gmt_modified;
		this.remark = remark;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getLogin_name() {
		return login_name;
	}


	public void setLogin_name(String login_name) {
		this.login_name = login_name;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getUser_name() {
		return user_name;
	}


	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}


	public String getMobile() {
		return mobile;
	}


	public void setMobile(String mobile) {
		this.mobile = mobile;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getLogin_time() {
		return login_time;
	}


	public void setLogin_time(String login_time) {
		this.login_time = login_time;
	}


	public String getLast_login_time() {
		return last_login_time;
	}


	public void setLast_login_time(String last_login_time) {
		this.last_login_time = last_login_time;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public String getGmt_ctreate() {
		return gmt_ctreate;
	}


	public void setGmt_ctreate(String gmt_ctreate) {
		this.gmt_ctreate = gmt_ctreate;
	}


	public String getGmt_modified() {
		return gmt_modified;
	}


	public void setGmt_modified(String gmt_modified) {
		this.gmt_modified = gmt_modified;
	}


	public String getRemark() {
		return remark;
	}


	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
	
}
