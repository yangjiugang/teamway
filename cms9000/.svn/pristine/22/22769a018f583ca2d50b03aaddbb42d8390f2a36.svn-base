package com.teamway.cms.pgutils;

public class PGAttrHeader {
	public byte  Type;
	public byte  Reserved = 0;
	public short  Length;
	
	public PGAttrHeader() { }
	
	public PGAttrHeader(int type) {
		Type = (byte)type;
	}
	public PGAttrHeader(int type, int length) {
		Type =  (byte)type;
		Length =  (short)length;
	}
	public PGAttrHeader(int type, int reserved, int length) {
		Type =  (byte)type;
		Reserved =  (byte)reserved;
		Length =  (short)length;
	}
	public byte getType() {
		return Type;
	}
	public void setType(int type) {
		Type =  (byte)type;
	}
	public byte getReserved() {
		return Reserved;
	}
	public void setReserved(int reserved) {
		Reserved =  (byte)reserved;
	}
	public short getLength() {
		return Length;
	}
	public void setLength(int length) {
		Length = (short)length;
	}

	@Override
	public String toString() {
		return "PGAttrHeader [Type=" + Type + ", Reserved=" + Reserved + ", Length=" + Length + "]";
	}
	
	
	
}
