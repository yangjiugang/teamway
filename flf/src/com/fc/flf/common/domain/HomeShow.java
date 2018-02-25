package com.fc.flf.common.domain;

import java.io.Serializable;

public class HomeShow implements Serializable {

	private static final long serialVersionUID = 1L;
	private int id;
	private int showType;
	private int showOrderNo;
	private int isEnable;
	private int showContentId;
	private Object obj;
	
	
	public Object getObj() {
		return obj;
	}

	public void setObj(Object obj) {
		this.obj = obj;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getShowType() {
		return showType;
	}

	public void setShowType(int showType) {
		this.showType = showType;
	}

	public int getShowOrderNo() {
		return showOrderNo;
	}

	public void setShowOrderNo(int showOrderNo) {
		this.showOrderNo = showOrderNo;
	}

	public int getIsEnable() {
		return isEnable;
	}

	public void setIsEnable(int isEnable) {
		this.isEnable = isEnable;
	}

	public int getShowContentId() {
		return showContentId;
	}

	public void setShowContentId(int showContentId) {
		this.showContentId = showContentId;
	}
	
	

}
