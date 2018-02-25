package com.fc.flf.common.domain;

import java.io.Serializable;
import java.util.Date;

public class HouseInfo implements Serializable {

	private static final long serialVersionUID = 1L;
	private int houseId;
	private String houseNum;
	private int tenementId;
	private int developerId;
	private int areaId;
	private String houseName;
	private String houseNameExtend;
	private String houseDevelopersName;
	private String houseLogo;
	private String housePic;
	private int houseLocation;
	private int houseProperties;
	private int housePrice;
	private int houseMinArea;
	private int houseMaxArea;
	private String houseStructureType;
	private int houseDecorations;
	private int houseBuildProcess;
	private int houseSights;
	private int brokerageRate;
	private Date signDate;
	private int houseSaleEvent;
	private int houseBuildType;
	private String businessRegion;
	private String belongToRegion;
	private int metroIn15minBywalk;
	private int busIn15minBywalk;
	private int longDistanceBus;
	private int wharf;
	private int airportBus;
	private int kindergartenIn15minBywalk;
	private int kindergartenIn20minBycar;
	private int kindergartenIn15minBybus;
	private int elementarySchoolIn15minBywalk;
	private int elementarySchoolIn20minBycar;
	private int elementarySchoolIn15minBybus;
	private int juniorHighSchoolIn15minBywalk;
	private int juniorHighSchoolIn20minBycar;
	private int juniorHighSchoolIn15minBybus;
	private int clubHospitalIn15minBywalk;
	private int clubHospitalIn20minBycar;
	private int clubHospitalIn15minBybus;
	private int aaaHospitalIn15minBywalk;
	private int aaaHospitalIn20minBycar;
	private int aaaHospitalIn15minBybus;
	private int hospitalIn15minBywalk;
	private int hospitalIn15minBycar;
	private int hospitalIn15minBybus;
	private int marketIn15minBywalk;
	private int supermarketIn15minBywalk;
	private int restaurantIn15minBywalk;
	private int shoppingIn15minBywalk;
	private int hopscaIn15minBywalk;
	private int cbdIn15minBywalk;
	private int marketIn5minBywalk;
	private int supermarketIn5minBywalk;
	private int restaurantIn5minBywalk;
	private int shoppingIn5minBywalk;
	private int hopscaIn5minBywalk;
	private int cbdIn5minBywalk;
	private int houseAttenttionCnt;
	private int houseCollectCnt;
	private int houseCommentCnt;
	private int userRecommendCnt;
	private int createdUser;
	private Date createdAt;
	private int updatedUser;
	private Date updatedAt;
	private HouseInfoDetail houseInfoDetail;
	private String houseDesc;
	private EventInfo eventInfo;
	private FcSysArea fcSysArea;
	private String areaName;
	private UserStudySaleHouse userStudySaleHouse;
	private HouseSaleControlInfo houseSaleControlInfo;
	
	public HouseSaleControlInfo getHouseSaleControlInfo() {
		return houseSaleControlInfo;
	}

	public void setHouseSaleControlInfo(HouseSaleControlInfo houseSaleControlInfo) {
		this.houseSaleControlInfo = houseSaleControlInfo;
	}

	public UserStudySaleHouse getUserStudySaleHouse() {
		return userStudySaleHouse;
	}

	public void setUserStudySaleHouse(UserStudySaleHouse userStudySaleHouse) {
		this.userStudySaleHouse = userStudySaleHouse;
	}

	// 临时字段
	private String limitValue;
	private int priceMax ;
	private String traffic;
	private String school;
	private String hospital;
	private String live;
	
	public String getLive() {
		return live;
	}

	public void setLive(String live) {
		this.live = live;
	}

	public String getHospital() {
		return hospital;
	}

	public void setHospital(String hospital) {
		this.hospital = hospital;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getTraffic() {
		return traffic;
	}

	public void setTraffic(String traffic) {
		this.traffic = traffic;
	}

	public String getHouseDevelopersName() {
		return houseDevelopersName;
	}

	public void setHouseDevelopersName(String houseDevelopersName) {
		this.houseDevelopersName = houseDevelopersName;
	}
	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public EventInfo getEventInfo() {
		return eventInfo;
	}

	public void setEventInfo(EventInfo eventInfo) {
		this.eventInfo = eventInfo;
	}

	public FcSysArea getFcSysArea() {
		return fcSysArea;
	}

	public void setFcSysArea(FcSysArea fcSysArea) {
		this.fcSysArea = fcSysArea;
	}

	public HouseInfoDetail getHouseInfoDetail() {
		return houseInfoDetail;
	}

	public void setHouseInfoDetail(HouseInfoDetail houseInfoDetail) {
		this.houseInfoDetail = houseInfoDetail;
	}

	public int getPriceMax() {
		return priceMax;
	}

	public void setPriceMax(int priceMax) {
		this.priceMax = priceMax;
	}

	public String getLimitValue() {
		return limitValue;
	}

	public void setLimitValue(String limitValue) {
		this.limitValue = limitValue;
	}

	public void setHouseId(int houseId) {
		this.houseId = houseId;
	}

	public int getHouseId() {
		return this.houseId;
	}

	public void setHouseNum(String houseNum) {
		this.houseNum = houseNum;
	}

	public String getHouseNum() {
		return this.houseNum;
	}

	public void setTenementId(int tenementId) {
		this.tenementId = tenementId;
	}

	public int getTenementId() {
		return this.tenementId;
	}

	public void setDeveloperId(int developerId) {
		this.developerId = developerId;
	}

	public int getDeveloperId() {
		return this.developerId;
	}

	public void setAreaId(int areaId) {
		this.areaId = areaId;
	}

	public int getAreaId() {
		return this.areaId;
	}

	public void setHouseName(String houseName) {
		this.houseName = houseName;
	}

	public String getHouseName() {
		return this.houseName;
	}

	public void setHouseNameExtend(String houseNameExtend) {
		this.houseNameExtend = houseNameExtend;
	}

	public String getHouseNameExtend() {
		return this.houseNameExtend;
	}

	public void setHouseLogo(String houseLogo) {
		this.houseLogo = houseLogo;
	}

	public String getHouseLogo() {
		return this.houseLogo;
	}

	public void setHousePic(String housePic) {
		this.housePic = housePic;
	}

	public String getHousePic() {
		return this.housePic;
	}

	public void setHouseLocation(int houseLocation) {
		this.houseLocation = houseLocation;
	}

	public int getHouseLocation() {
		return this.houseLocation;
	}

	public void setHouseProperties(int houseProperties) {
		this.houseProperties = houseProperties;
	}

	public int getHouseProperties() {
		return this.houseProperties;
	}

	public void setHousePrice(int housePrice) {
		this.housePrice = housePrice;
	}

	public int getHousePrice() {
		return this.housePrice;
	}

	public void setHouseMinArea(int houseMinArea) {
		this.houseMinArea = houseMinArea;
	}

	public int getHouseMinArea() {
		return this.houseMinArea;
	}

	public void setHouseMaxArea(int houseMaxArea) {
		this.houseMaxArea = houseMaxArea;
	}

	public int getHouseMaxArea() {
		return this.houseMaxArea;
	}

	public void setHouseStructureType(String houseStructureType) {
		this.houseStructureType = houseStructureType;
	}

	public String getHouseStructureType() {
		return this.houseStructureType;
	}

	public void setHouseDecorations(int houseDecorations) {
		this.houseDecorations = houseDecorations;
	}

	public int getHouseDecorations() {
		return this.houseDecorations;
	}

	public void setHouseBuildProcess(int houseBuildProcess) {
		this.houseBuildProcess = houseBuildProcess;
	}

	public int getHouseBuildProcess() {
		return this.houseBuildProcess;
	}

	public void setHouseSights(int houseSights) {
		this.houseSights = houseSights;
	}

	public int getHouseSights() {
		return this.houseSights;
	}

	public void setBrokerageRate(int brokerageRate) {
		this.brokerageRate = brokerageRate;
	}

	public int getBrokerageRate() {
		return this.brokerageRate;
	}

	public void setSignDate(Date signDate) {
		this.signDate = signDate;
	}

	public Date getSignDate() {
		return this.signDate;
	}

	public void setHouseSaleEvent(int houseSaleEvent) {
		this.houseSaleEvent = houseSaleEvent;
	}

	public int getHouseSaleEvent() {
		return this.houseSaleEvent;
	}

	public void setHouseBuildType(int houseBuildType) {
		this.houseBuildType = houseBuildType;
	}

	public int getHouseBuildType() {
		return this.houseBuildType;
	}

	public void setBusinessRegion(String businessRegion) {
		this.businessRegion = businessRegion;
	}

	public String getBusinessRegion() {
		return this.businessRegion;
	}

	public void setBelongToRegion(String belongToRegion) {
		this.belongToRegion = belongToRegion;
	}

	public String getBelongToRegion() {
		return this.belongToRegion;
	}

	public void setMetroIn15minBywalk(int metroIn15minBywalk) {
		this.metroIn15minBywalk = metroIn15minBywalk;
	}

	public int getMetroIn15minBywalk() {
		return this.metroIn15minBywalk;
	}

	public void setBusIn15minBywalk(int busIn15minBywalk) {
		this.busIn15minBywalk = busIn15minBywalk;
	}

	public int getBusIn15minBywalk() {
		return this.busIn15minBywalk;
	}

	public void setLongDistanceBus(int longDistanceBus) {
		this.longDistanceBus = longDistanceBus;
	}

	public int getLongDistanceBus() {
		return this.longDistanceBus;
	}

	public void setWharf(int wharf) {
		this.wharf = wharf;
	}

	public int getWharf() {
		return this.wharf;
	}

	public void setAirportBus(int airportBus) {
		this.airportBus = airportBus;
	}

	public int getAirportBus() {
		return this.airportBus;
	}

	public void setKindergartenIn15minBywalk(int kindergartenIn15minBywalk) {
		this.kindergartenIn15minBywalk = kindergartenIn15minBywalk;
	}

	public int getKindergartenIn15minBywalk() {
		return this.kindergartenIn15minBywalk;
	}

	public void setKindergartenIn20minBycar(int kindergartenIn20minBycar) {
		this.kindergartenIn20minBycar = kindergartenIn20minBycar;
	}

	public int getKindergartenIn20minBycar() {
		return this.kindergartenIn20minBycar;
	}

	public void setKindergartenIn15minBybus(int kindergartenIn15minBybus) {
		this.kindergartenIn15minBybus = kindergartenIn15minBybus;
	}

	public int getKindergartenIn15minBybus() {
		return this.kindergartenIn15minBybus;
	}

	public void setElementarySchoolIn15minBywalk(int elementarySchoolIn15minBywalk) {
		this.elementarySchoolIn15minBywalk = elementarySchoolIn15minBywalk;
	}

	public int getElementarySchoolIn15minBywalk() {
		return this.elementarySchoolIn15minBywalk;
	}

	public void setElementarySchoolIn20minBycar(int elementarySchoolIn20minBycar) {
		this.elementarySchoolIn20minBycar = elementarySchoolIn20minBycar;
	}

	public int getElementarySchoolIn20minBycar() {
		return this.elementarySchoolIn20minBycar;
	}

	public void setElementarySchoolIn15minBybus(int elementarySchoolIn15minBybus) {
		this.elementarySchoolIn15minBybus = elementarySchoolIn15minBybus;
	}

	public int getElementarySchoolIn15minBybus() {
		return this.elementarySchoolIn15minBybus;
	}

	public void setJuniorHighSchoolIn15minBywalk(int juniorHighSchoolIn15minBywalk) {
		this.juniorHighSchoolIn15minBywalk = juniorHighSchoolIn15minBywalk;
	}

	public int getJuniorHighSchoolIn15minBywalk() {
		return this.juniorHighSchoolIn15minBywalk;
	}

	public void setJuniorHighSchoolIn20minBycar(int juniorHighSchoolIn20minBycar) {
		this.juniorHighSchoolIn20minBycar = juniorHighSchoolIn20minBycar;
	}

	public int getJuniorHighSchoolIn20minBycar() {
		return this.juniorHighSchoolIn20minBycar;
	}

	public void setJuniorHighSchoolIn15minBybus(int juniorHighSchoolIn15minBybus) {
		this.juniorHighSchoolIn15minBybus = juniorHighSchoolIn15minBybus;
	}

	public int getJuniorHighSchoolIn15minBybus() {
		return this.juniorHighSchoolIn15minBybus;
	}

	public void setClubHospitalIn15minBywalk(int clubHospitalIn15minBywalk) {
		this.clubHospitalIn15minBywalk = clubHospitalIn15minBywalk;
	}

	public int getClubHospitalIn15minBywalk() {
		return this.clubHospitalIn15minBywalk;
	}

	public void setClubHospitalIn20minBycar(int clubHospitalIn20minBycar) {
		this.clubHospitalIn20minBycar = clubHospitalIn20minBycar;
	}

	public int getClubHospitalIn20minBycar() {
		return this.clubHospitalIn20minBycar;
	}

	public void setClubHospitalIn15minBybus(int clubHospitalIn15minBybus) {
		this.clubHospitalIn15minBybus = clubHospitalIn15minBybus;
	}

	public int getClubHospitalIn15minBybus() {
		return this.clubHospitalIn15minBybus;
	}

	public void setAaaHospitalIn15minBywalk(int aaaHospitalIn15minBywalk) {
		this.aaaHospitalIn15minBywalk = aaaHospitalIn15minBywalk;
	}

	public int getAaaHospitalIn15minBywalk() {
		return this.aaaHospitalIn15minBywalk;
	}

	public void setAaaHospitalIn20minBycar(int aaaHospitalIn20minBycar) {
		this.aaaHospitalIn20minBycar = aaaHospitalIn20minBycar;
	}

	public int getAaaHospitalIn20minBycar() {
		return this.aaaHospitalIn20minBycar;
	}

	public void setAaaHospitalIn15minBybus(int aaaHospitalIn15minBybus) {
		this.aaaHospitalIn15minBybus = aaaHospitalIn15minBybus;
	}

	public int getAaaHospitalIn15minBybus() {
		return this.aaaHospitalIn15minBybus;
	}

	public void setHospitalIn15minBywalk(int hospitalIn15minBywalk) {
		this.hospitalIn15minBywalk = hospitalIn15minBywalk;
	}

	public int getHospitalIn15minBywalk() {
		return this.hospitalIn15minBywalk;
	}

	public void setHospitalIn15minBycar(int hospitalIn15minBycar) {
		this.hospitalIn15minBycar = hospitalIn15minBycar;
	}

	public int getHospitalIn15minBycar() {
		return this.hospitalIn15minBycar;
	}

	public void setHospitalIn15minBybus(int hospitalIn15minBybus) {
		this.hospitalIn15minBybus = hospitalIn15minBybus;
	}

	public int getHospitalIn15minBybus() {
		return this.hospitalIn15minBybus;
	}

	public void setMarketIn15minBywalk(int marketIn15minBywalk) {
		this.marketIn15minBywalk = marketIn15minBywalk;
	}

	public int getMarketIn15minBywalk() {
		return this.marketIn15minBywalk;
	}

	public void setSupermarketIn15minBywalk(int supermarketIn15minBywalk) {
		this.supermarketIn15minBywalk = supermarketIn15minBywalk;
	}

	public int getSupermarketIn15minBywalk() {
		return this.supermarketIn15minBywalk;
	}

	public void setRestaurantIn15minBywalk(int restaurantIn15minBywalk) {
		this.restaurantIn15minBywalk = restaurantIn15minBywalk;
	}

	public int getRestaurantIn15minBywalk() {
		return this.restaurantIn15minBywalk;
	}

	public void setShoppingIn15minBywalk(int shoppingIn15minBywalk) {
		this.shoppingIn15minBywalk = shoppingIn15minBywalk;
	}

	public int getShoppingIn15minBywalk() {
		return this.shoppingIn15minBywalk;
	}

	public void setHopscaIn15minBywalk(int hopscaIn15minBywalk) {
		this.hopscaIn15minBywalk = hopscaIn15minBywalk;
	}

	public int getHopscaIn15minBywalk() {
		return this.hopscaIn15minBywalk;
	}

	public void setCbdIn15minBywalk(int cbdIn15minBywalk) {
		this.cbdIn15minBywalk = cbdIn15minBywalk;
	}

	public int getCbdIn15minBywalk() {
		return this.cbdIn15minBywalk;
	}

	public void setMarketIn5minBywalk(int marketIn5minBywalk) {
		this.marketIn5minBywalk = marketIn5minBywalk;
	}

	public int getMarketIn5minBywalk() {
		return this.marketIn5minBywalk;
	}

	public void setSupermarketIn5minBywalk(int supermarketIn5minBywalk) {
		this.supermarketIn5minBywalk = supermarketIn5minBywalk;
	}

	public int getSupermarketIn5minBywalk() {
		return this.supermarketIn5minBywalk;
	}

	public void setRestaurantIn5minBywalk(int restaurantIn5minBywalk) {
		this.restaurantIn5minBywalk = restaurantIn5minBywalk;
	}

	public int getRestaurantIn5minBywalk() {
		return this.restaurantIn5minBywalk;
	}

	public void setShoppingIn5minBywalk(int shoppingIn5minBywalk) {
		this.shoppingIn5minBywalk = shoppingIn5minBywalk;
	}

	public int getShoppingIn5minBywalk() {
		return this.shoppingIn5minBywalk;
	}

	public void setHopscaIn5minBywalk(int hopscaIn5minBywalk) {
		this.hopscaIn5minBywalk = hopscaIn5minBywalk;
	}

	public int getHopscaIn5minBywalk() {
		return this.hopscaIn5minBywalk;
	}

	public void setCbdIn5minBywalk(int cbdIn5minBywalk) {
		this.cbdIn5minBywalk = cbdIn5minBywalk;
	}

	public int getCbdIn5minBywalk() {
		return this.cbdIn5minBywalk;
	}

	public void setHouseAttenttionCnt(int houseAttenttionCnt) {
		this.houseAttenttionCnt = houseAttenttionCnt;
	}

	public int getHouseAttenttionCnt() {
		return this.houseAttenttionCnt;
	}

	public void setHouseCollectCnt(int houseCollectCnt) {
		this.houseCollectCnt = houseCollectCnt;
	}

	public int getHouseCollectCnt() {
		return this.houseCollectCnt;
	}

	public void setHouseCommentCnt(int houseCommentCnt) {
		this.houseCommentCnt = houseCommentCnt;
	}

	public int getHouseCommentCnt() {
		return this.houseCommentCnt;
	}

	public void setUserRecommendCnt(int userRecommendCnt) {
		this.userRecommendCnt = userRecommendCnt;
	}

	public int getUserRecommendCnt() {
		return this.userRecommendCnt;
	}

	public void setCreatedUser(int createdUser) {
		this.createdUser = createdUser;
	}

	public int getCreatedUser() {
		return this.createdUser;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getCreatedAt() {
		return this.createdAt;
	}

	public void setUpdatedUser(int updatedUser) {
		this.updatedUser = updatedUser;
	}

	public int getUpdatedUser() {
		return this.updatedUser;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public Date getUpdatedAt() {
		return this.updatedAt;
	}

	public void setHouseDesc(String houseDesc) {
		this.houseDesc = houseDesc;
	}

	public String getHouseDesc() {
		return this.houseDesc;
	}

}