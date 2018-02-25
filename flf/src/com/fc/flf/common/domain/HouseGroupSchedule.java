package com.fc.flf.common.domain;
import java.io.Serializable;
import java.util.List;
public class HouseGroupSchedule implements Serializable {

	private static final long serialVersionUID = 1L;
	private int groupScheduleId;
	private int houseGroupId;
	private String picPath;
	private int orderNo;
	private FcSysArea fcSysArea;
	private String groupDestination;
	private String scheduleDesc;
	private List<HouseGroupScheduleHouse> houseGroupScheduleHouseList;
	private List<HouseGroupScheduleEvent> houseGroupScheduleEventList;
	
	
	public List<HouseGroupScheduleHouse> getHouseGroupScheduleHouseList() {
		return houseGroupScheduleHouseList;
	}
	public void setHouseGroupScheduleHouseList(
			List<HouseGroupScheduleHouse> houseGroupScheduleHouseList) {
		this.houseGroupScheduleHouseList = houseGroupScheduleHouseList;
	}
	public List<HouseGroupScheduleEvent> getHouseGroupScheduleEventList() {
		return houseGroupScheduleEventList;
	}
	public void setHouseGroupScheduleEventList(
			List<HouseGroupScheduleEvent> houseGroupScheduleEventList) {
		this.houseGroupScheduleEventList = houseGroupScheduleEventList;
	}
	public int getGroupScheduleId() {
		return groupScheduleId;
	}
	public void setGroupScheduleId(int groupScheduleId) {
		this.groupScheduleId = groupScheduleId;
	}
	public int getHouseGroupId() {
		return houseGroupId;
	}
	public void setHouseGroupId(int houseGroupId) {
		this.houseGroupId = houseGroupId;
	}
	public String getPicPath() {
		return picPath;
	}
	public void setPicPath(String picPath) {
		this.picPath = picPath;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	
	public FcSysArea getFcSysArea() {
		return fcSysArea;
	}
	public void setFcSysArea(FcSysArea fcSysArea) {
		this.fcSysArea = fcSysArea;
	}
	public String getGroupDestination() {
		return groupDestination;
	}
	public void setGroupDestination(String groupDestination) {
		this.groupDestination = groupDestination;
	}
	public String getScheduleDesc() {
		return scheduleDesc;
	}
	public void setScheduleDesc(String scheduleDesc) {
		this.scheduleDesc = scheduleDesc;
	}
	
	

}