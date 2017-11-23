package com.teamway.cms.env;



public class ProtoObjectModel {
	private	int type;

	private byte[] msgData;
	private	int   length;
	private	int   offset;
	

	public ProtoObjectModel(int type, byte[] msgData,int offset,int length) {
		this.type = type;
		this.msgData = msgData;
		this.length = length;
		this.offset = offset;
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public int getType() {
		return type;
	}

	public int getLength() {
		return length;
	}

	public void setLength(int length) {
		this.length = length;
	}

	public void setType(int type) {
		this.type = type;
	}

	public byte[] getMsgData() {
		return msgData;
	}

	public void setMsgData(byte[] msgData) {
		this.msgData = msgData;
	}
	
}
