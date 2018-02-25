package com.fc.flf.common.domain;

import java.io.Serializable;

public class FcSysAd implements Serializable {

	private static final long serialVersionUID = 1L;
	private int adId;
	private int adType;
	private String hostIp;
	private String adPath;
	private String adDescPic;
	private int adOrder;
	private int adUrlId;
	private int isEnable;
	private String adUrl;
	private HouseInfo houseInfo;
	
	public String getAdUrl() {
		return adUrl;
	}

	public void setAdUrl(String adUrl) {
		this.adUrl = adUrl;
	}
	public HouseInfo getHouseInfo() {
		return houseInfo;
	}

	public int getAdUrlId() {
		return adUrlId;
	}

	public void setAdUrlId(int adUrlId) {
		this.adUrlId = adUrlId;
	}

	public void setHouseInfo(HouseInfo houseInfo) {
		this.houseInfo = houseInfo;
	}

	public void setAdId(int adId) {
		this.adId = adId;
	}

	public int getAdId() {
		return this.adId;
	}

	public void setAdType(int adType) {
		this.adType = adType;
	}

	public int getAdType() {
		return this.adType;
	}

	public void setHostIp(String hostIp) {
		this.hostIp = hostIp;
	}

	public String getHostIp() {
		return this.hostIp;
	}

	public void setAdPath(String adPath) {
		this.adPath = adPath;
	}

	public String getAdPath() {
		return this.adPath;
	}

	public void setAdDescPic(String adDescPic) {
		this.adDescPic = adDescPic;
	}

	public String getAdDescPic() {
		return this.adDescPic;
	}

	public void setAdOrder(int adOrder) {
		this.adOrder = adOrder;
	}

	public int getAdOrder() {
		return this.adOrder;
	}

	public void setIsEnable(int isEnable) {
		this.isEnable = isEnable;
	}

	public int getIsEnable() {
		return this.isEnable;
	}
	@Override
	public String toString() {
		return "id:"+this.getAdId()+", type:"
				+this.getAdType()+
				", order"+this.getAdOrder()+
				", path:"+this.getAdPath()+
				", urlId:"+this.getAdUrlId()+
				", ip:"+this.getHostIp();
	}
}
