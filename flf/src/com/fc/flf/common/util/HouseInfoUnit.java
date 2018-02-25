package com.fc.flf.common.util;

import com.fc.flf.common.domain.HouseInfo;
/**
 * 解析精准搜房多选
 * @author huangshan
 *
 */
public class HouseInfoUnit {

	static final int TRAFFIC_DT = 1301;			// 地铁
	static final int TRAFFIC_GJ = 1302;			// 公交
	static final int TRAFFIC_CTQCZ = 1303;		// 长途客运站
	static final int TRAFFIC_KYMT = 1304;		// 客运码头
	static final int TRAFFIC_JC = 1305;			// 机场
	
	static final int SCHOOL_CHILD_WALK_15 = 1001;
	static final int SCHOOL_CHILD_CAR_20 = 1002;
	static final int SCHOOL_CHILD_BUS_15 = 1003;
	static final int SCHOOL_LITTLE_WALK_15 = 1011;
	static final int SCHOOL_LITTLE_CAR_20 = 1012;
	static final int SCHOOL_LITTLE_BUS_15 = 1013;
	static final int SCHOOL_MIDDLE_WALK_15 = 1021;
	static final int SCHOOL_MIDDLE_CAR_20 = 1022;
	static final int SCHOOL_MIDDLE_BUS_15 = 1023;
	
	static final int HOSPITAL_SK_WALK_15 = 1101;	//社康医院
	static final int HOSPITAL_SK_CAR_20 = 1102;		
	static final int HOSPITAL_SK_BUS_15 = 1103;
	static final int HOSPITAL_SJ_WALK_15 = 1111;	//3甲医院
	static final int HOSPITAL_SJ_CAR_20 = 1112;
	static final int HOSPITAL_SJ_BUS_15 = 1113;
	static final int HOSPITAL_YB_WALK_15 = 1121;	//一般医院
	static final int HOSPITAL_YB_CAR_20 = 1122;
	static final int HOSPITAL_YB_BUS_15 = 1123;
	
	static final int LIVE_CSC_WALK_5 = 1401;		// 菜市场
	static final int LIVE_CSC_WALK_15 = 1402;
	static final int LIVE_DXCS_WALK_5 = 1411;		// 大型超市
	static final int LIVE_DXCS_WALK_15 = 1412;
	static final int LIVE_CY_WALK_5 = 1421;			// 餐饮
	static final int LIVE_CY_WALK_15 = 1422;
	static final int LIVE_SC_WALK_5 = 1431;			// 商场
	static final int LIVE_SC_WALK_15 = 1432;
	static final int LIVE_CSZHT_WALK_5 = 1441;		// 城市综合体
	static final int LIVE_CSZHT_WALK_15 = 1442;
	static final int LIVE_CBD_WALK_5 = 1451;		// CDB
	static final int LIVE_CBD_WALK_15 = 1452;
	
	public static HouseInfo resolveMutiSelectHouseInfo(HouseInfo houseInfo){
		// 交通
		String tra = houseInfo.getTraffic();
		if(tra != null && !"".equals(tra)){
			String[] numbers = tra.split(",");
			for(String number : numbers){
				if(Integer.parseInt(number) == TRAFFIC_DT)
					houseInfo.setMetroIn15minBywalk(1);
				if(Integer.parseInt(number) == TRAFFIC_GJ)
					houseInfo.setBusIn15minBywalk(1);
				if(Integer.parseInt(number) == TRAFFIC_CTQCZ)
					houseInfo.setLongDistanceBus(1);
				if(Integer.parseInt(number) == 1)
					houseInfo.setWharf(TRAFFIC_KYMT);
				if(Integer.parseInt(number) == TRAFFIC_JC)
					houseInfo.setAirportBus(1);
			}
		}
		// 学区
		String sch = houseInfo.getSchool();
		if(sch != null && !"".equals(sch)){
			String[] numbers = sch.split(",");
			for(String number : numbers){
				if(Integer.parseInt(number) == SCHOOL_CHILD_WALK_15)
					houseInfo.setKindergartenIn15minBywalk(1);
				if(Integer.parseInt(number) == SCHOOL_CHILD_CAR_20)
					houseInfo.setKindergartenIn20minBycar(1);
				if(Integer.parseInt(number) == SCHOOL_CHILD_BUS_15)
					houseInfo.setKindergartenIn15minBybus(1);
				
				if(Integer.parseInt(number) == SCHOOL_LITTLE_WALK_15)
					houseInfo.setElementarySchoolIn15minBywalk(1);
				if(Integer.parseInt(number) == SCHOOL_LITTLE_CAR_20)
					houseInfo.setElementarySchoolIn20minBycar(1);
				if(Integer.parseInt(number) == SCHOOL_LITTLE_BUS_15)
					houseInfo.setElementarySchoolIn15minBybus(1);
				
				if(Integer.parseInt(number) == SCHOOL_MIDDLE_WALK_15)
					houseInfo.setJuniorHighSchoolIn15minBywalk(1);
				if(Integer.parseInt(number) == SCHOOL_MIDDLE_CAR_20)
					houseInfo.setJuniorHighSchoolIn20minBycar(1);
				if(Integer.parseInt(number) == SCHOOL_MIDDLE_BUS_15)
					houseInfo.setJuniorHighSchoolIn15minBybus(1);
			}
		}
		// 医疗
		String hos = houseInfo.getHospital();
		if(hos != null && !"".equals(hos)){
			String[] numbers = hos.split(",");
			for(String number : numbers){
				if(Integer.parseInt(number) == HOSPITAL_SK_WALK_15)
					houseInfo.setClubHospitalIn15minBywalk(1);
				if(Integer.parseInt(number) == HOSPITAL_SK_CAR_20)
					houseInfo.setClubHospitalIn20minBycar(1);
				if(Integer.parseInt(number) == HOSPITAL_SK_BUS_15)
					houseInfo.setClubHospitalIn15minBybus(1);
				
				if(Integer.parseInt(number) == HOSPITAL_SJ_WALK_15)
					houseInfo.setAaaHospitalIn15minBywalk(1);
				if(Integer.parseInt(number) == HOSPITAL_SJ_CAR_20)
					houseInfo.setAaaHospitalIn20minBycar(1);
				if(Integer.parseInt(number) == HOSPITAL_SJ_BUS_15)
					houseInfo.setAaaHospitalIn15minBybus(1);
				
				if(Integer.parseInt(number) == HOSPITAL_YB_WALK_15)
					houseInfo.setHospitalIn15minBywalk(1);
				if(Integer.parseInt(number) == HOSPITAL_YB_CAR_20)
					houseInfo.setAaaHospitalIn20minBycar(1);
				if(Integer.parseInt(number) == HOSPITAL_YB_BUS_15)
					houseInfo.setAaaHospitalIn15minBybus(1);
			}
		}
		// 生活设施
		String liv =  houseInfo.getLive();
		if(liv != null && !"".equals(liv)){
			String[] numbers = liv.split(",");
			for(String number : numbers){
				if(Integer.parseInt(number) == LIVE_CSC_WALK_5)
					houseInfo.setMarketIn5minBywalk(1);
				if(Integer.parseInt(number) == LIVE_CSC_WALK_15)
					houseInfo.setMarketIn15minBywalk(1);
				if(Integer.parseInt(number) == LIVE_DXCS_WALK_5)
					houseInfo.setSupermarketIn5minBywalk(1);
				if(Integer.parseInt(number) == LIVE_DXCS_WALK_15)
					houseInfo.setSupermarketIn5minBywalk(1);
				if(Integer.parseInt(number) == LIVE_CY_WALK_5)
					houseInfo.setRestaurantIn5minBywalk(1);
				if(Integer.parseInt(number) == LIVE_CY_WALK_15)
					houseInfo.setRestaurantIn15minBywalk(1);
				if(Integer.parseInt(number) == LIVE_SC_WALK_5)
					houseInfo.setShoppingIn5minBywalk(1);
				if(Integer.parseInt(number) == LIVE_SC_WALK_15)
					houseInfo.setShoppingIn15minBywalk(1);
				if(Integer.parseInt(number) == LIVE_CSZHT_WALK_5)
					houseInfo.setHopscaIn5minBywalk(1);
				if(Integer.parseInt(number) == LIVE_CSZHT_WALK_15)
					houseInfo.setHopscaIn15minBywalk(1);
				if(Integer.parseInt(number) == LIVE_CBD_WALK_5)
					houseInfo.setCbdIn5minBywalk(1);
				if(Integer.parseInt(number) == LIVE_CBD_WALK_15)
					houseInfo.setCbdIn15minBywalk(1);
			}
		}
		return houseInfo;
	}
}
