package com.teamway.cms.pgutils;
import java.util.Arrays;

import com.teamway.cms.pgutils.PGUtil;

/**
 * @author Administrator
 *
 */
/**
 * @author Administrator
 *
 */
public class PGAttr {
	public PGAttrHeader  header = new PGAttrHeader();
	public byte[]  data;
	public Object  dataObj;



	public PGAttrHeader getHeader() {
		return header;
	}

	public void setHeader(PGAttrHeader header) {
		this.header = header;
	}

	public byte[] getData() {
		return data;
	}

	public void setData(byte[] data) {
		this.data = data;
	}
	
	public Object getDataObj() {
		return dataObj;
	}
	
	public Object getDataObj(Class mc) {
		return getAttrDataObject(mc);
	}

	public int setDataObj(Object dataObj) {
		this.dataObj = dataObj;
		return setObjectAttrData(dataObj);
	}
	
	
	/**
	 * 将一个属性内的数据byte数组转换成对象 
	 * @param mc 类
	 * @return 对象
	 */
	public Object getAttrDataObject(Class mc) {
		if(data == null || data.length==0)
			return null;
		
		return PGUtil.byteArrayToObject(data,mc);
	}

	/**
	 * 将一个对象装换成byte数组，赋给属性数据
	 * @param info
	 * @return
	 */
	public int setObjectAttrData(Object info) {
		data = PGUtil.objectToByteArray(info);
		return data.length;
	}

 
	@Override
	public String toString() {
		return "PGAttr [ header=" + header + ", data=[" +PGUtil.byteArraytoHexString(data) + "] ]";
	}
	
	

}
