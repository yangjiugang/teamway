package com.fc.flf.common.domain;

import java.io.Serializable;

public class FcSysUser implements Serializable {

	private static final long serialVersionUID = 1L;
	private int id;
	private int visitorId;
	private String column2;
	private String column3;
	private String column4;

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return this.id;
	}

	public void setVisitorId(int visitorId) {
		this.visitorId = visitorId;
	}

	public int getVisitorId() {
		return this.visitorId;
	}

	public void setColumn2(String column2) {
		this.column2 = column2;
	}

	public String getColumn2() {
		return this.column2;
	}

	public void setColumn3(String column3) {
		this.column3 = column3;
	}

	public String getColumn3() {
		return this.column3;
	}

	public void setColumn4(String column4) {
		this.column4 = column4;
	}

	public String getColumn4() {
		return this.column4;
	}
}