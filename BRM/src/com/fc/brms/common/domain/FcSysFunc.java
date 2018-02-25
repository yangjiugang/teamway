package com.fc.brms.common.domain;

import java.io.Serializable;

public class FcSysFunc implements Serializable {

	private static final long serialVersionUID = 1L;
	private int funcId;
	private String funcCode;
	private String funcName;
	private String funcDsc;
	private int son;

	public void setFuncId(int funcId) {
		this.funcId = funcId;
	}

	public int getFuncId() {
		return this.funcId;
	}

	public void setFuncName(String funcName) {
		this.funcName = funcName;
	}

	public String getFuncName() {
		return this.funcName;
	}

	public String getFuncCode() {
		return funcCode;
	}

	public void setFuncCode(String funcCode) {
		this.funcCode = funcCode;
	}

	public String getFuncDsc() {
		return funcDsc;
	}

	public void setFuncDsc(String funcDsc) {
		this.funcDsc = funcDsc;
	}

	public int getSon() {
		return son;
	}

	public void setSon(int son) {
		this.son = son;
	}

}