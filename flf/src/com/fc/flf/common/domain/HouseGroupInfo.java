package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.fc.flf.common.conf.DateSerializer;

public class HouseGroupInfo implements Serializable {

	private static final long serialVersionUID = 1L;
	private int houseGroupId;
	private String groupName;          //团名
	private Date groupStartDate;       //发团时间
	private Date groupDeadlineDate;    //截止时间  
	private String groupDuration;      //时长
	private int groupPrice;			   //参团价格
	private String groupHotline;	   //报名热线
	private int housePurpose;		   //购房目的
	private int houseProperties;		//房产性质
	private int lineProperties;			//线路性质
	private int attentionCnt;			//关注度
	private int joinCnt;				//参加人数
	private String groupDesc;       	//简介
	private String groupLineDesc;     	//路线描述
	private String picPath;           	//图片地址
	private String grouptime;			//搜索时取值用的  发团时间
	private String nowTime;				//搜索时用到
	private String nextTime;			//搜索时用到
	private String limitStr;
	//临时
	private String orderMoeny;
	private String customerName;
	
	private HouseGroupCustomer houseGroupCustomer;
	
	public HouseGroupCustomer getHouseGroupCustomer() {
		return houseGroupCustomer;
	}
	public void setHouseGroupCustomer(HouseGroupCustomer houseGroupCustomer) {
		this.houseGroupCustomer = houseGroupCustomer;
	}
	public String getOrderMoeny() {
		return orderMoeny;
	}
	public void setOrderMoeny(String orderMoeny) {
		this.orderMoeny = orderMoeny;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getLimitStr() {
		return limitStr;
	}
	public void setLimitStr(String limitStr) {
		this.limitStr = limitStr;
	}
	public String getNextTime() {
		return nextTime;
	}
	public void setNextTime(String nextTime) {
		this.nextTime = nextTime;
	}
	public String getNowTime() {
		return nowTime;
	}
	public void setNowTime(String nowTime) {
		this.nowTime = nowTime;
	}
	public String getGrouptime() {
		return grouptime;
	}
	public void setGrouptime(String grouptime) {
		this.grouptime = grouptime;
	}
	private List<HouseGroupSchedule> houseGroupScheduleList;
	private List<HouseGroupCustomer> houseGroupCustomerList;
	
	
	public List<HouseGroupSchedule> getHouseGroupScheduleList() {
		return houseGroupScheduleList;
	}
	public void setHouseGroupScheduleList(
			List<HouseGroupSchedule> houseGroupScheduleList) {
		this.houseGroupScheduleList = houseGroupScheduleList;
	}
	public List<HouseGroupCustomer> getHouseGroupCustomerList() {
		return houseGroupCustomerList;
	}
	public void setHouseGroupCustomerList(
			List<HouseGroupCustomer> houseGroupCustomerList) {
		this.houseGroupCustomerList = houseGroupCustomerList;
	}
	public String getPicPath() {
		return picPath;
	}
	public void setPicPath(String picPath) {
		this.picPath = picPath;
	}
	public int getHouseGroupId() {
		return houseGroupId;
	}
	public void setHouseGroupId(int houseGroupId) {
		this.houseGroupId = houseGroupId;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	@JsonSerialize(using=DateSerializer.class)
	public Date getGroupStartDate() {
		return groupStartDate;
	}
	public void setGroupStartDate(Date groupStartDate) {
		this.groupStartDate = groupStartDate;
	}
	@JsonSerialize(using=DateSerializer.class)
	public Date getGroupDeadlineDate() {
		return groupDeadlineDate;
	}
	public void setGroupDeadlineDate(Date groupDeadlineDate) {
		this.groupDeadlineDate = groupDeadlineDate;
	}
	public String getGroupDuration() {
		return groupDuration;
	}
	public void setGroupDuration(String groupDuration) {
		this.groupDuration = groupDuration;
	}
	public int getGroupPrice() {
		return groupPrice;
	}
	public void setGroupPrice(int groupPrice) {
		this.groupPrice = groupPrice;
	}
	public String getGroupHotline() {
		return groupHotline;
	}
	public void setGroupHotline(String groupHotline) {
		this.groupHotline = groupHotline;
	}
	public int getHousePurpose() {
		return housePurpose;
	}
	public void setHousePurpose(int housePurpose) {
		this.housePurpose = housePurpose;
	}
	public int getHouseProperties() {
		return houseProperties;
	}
	public void setHouseProperties(int houseProperties) {
		this.houseProperties = houseProperties;
	}
	public int getLineProperties() {
		return lineProperties;
	}
	public void setLineProperties(int lineProperties) {
		this.lineProperties = lineProperties;
	}
	public int getAttentionCnt() {
		return attentionCnt;
	}
	public void setAttentionCnt(int attentionCnt) {
		this.attentionCnt = attentionCnt;
	}
	public int getJoinCnt() {
		return joinCnt;
	}
	public void setJoinCnt(int joinCnt) {
		this.joinCnt = joinCnt;
	}
	public String getGroupDesc() {
		return groupDesc;
	}
	public void setGroupDesc(String groupDesc) {
		this.groupDesc = groupDesc;
	}
	public String getGroupLineDesc() {
		return groupLineDesc;
	}
	public void setGroupLineDesc(String groupLineDesc) {
		this.groupLineDesc = groupLineDesc;
	}
	

}