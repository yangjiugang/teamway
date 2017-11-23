package com.teamway.cms.pgutils;

public class PGHeader {
	public byte  Var =1;
	public short Code;
	public byte  HdrLen = 12;
	public short AttrCount;
	public short SeqNum;
	public short SessionId;
	public short TotalLength;
	
	
	public PGHeader() { }
	
	/**
	 * @param code
	 * @param seqNum 
	 * @param sessionId
	 */
	public PGHeader(int code, int seqNum, int sessionId) {
		Code = (short)code;
		SeqNum = (short)seqNum;
		SessionId = (short)sessionId;
	}
	

	public byte getVar() {
		return Var;
	}
	public void setVar(int var) {
		Var = (byte)var;
	}
	public short getCode() {
		return Code;
	}
	public void setCode(int code) {
		Code = (short)code;
	}
	public byte getHdrLen() {
		return HdrLen;
	}
	public void setHdrLen(int hdrLen) {
		HdrLen = (byte)hdrLen;
	}
	public short getAttrCount() {
		return AttrCount;
	}
	public void setAttrCount(int attrCount) {
		AttrCount = (short)attrCount;
	}
	public short getSeqNum() {
		return SeqNum;
	}
	public void setSeqNum(int seqNum) {
		SeqNum = (short)seqNum;
	}
	public short getSessionId() {
		return SessionId;
	}
	public void setSessionId(int sessionId) {
		SessionId = (short)sessionId;
	}
	public short getTotalLength() {
		return TotalLength;
	}
	public void setTotalLength(int totalLength) {
		TotalLength =  (short)totalLength;
	}

	@Override
	public String toString() {
		return "PGHeader [Var=" + Var + ", Code=" + Code + ", HdrLen=" + HdrLen + ", AttrCount=" + AttrCount
				+ ", SeqNum=" + SeqNum + ", SessionId=" + SessionId + ", TotalLength=" + TotalLength + "]";
	}
	
	
}
