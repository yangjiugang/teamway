package com.fc.flf.common.domain;

import java.io.Serializable;

public class FcSysFunc implements Serializable {

	private static final long serialVersionUID = 1L;
	private int funcId;
	private String funcName;
	private String column3;
	private String column4;

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