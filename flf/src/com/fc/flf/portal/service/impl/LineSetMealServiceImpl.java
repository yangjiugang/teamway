package com.fc.flf.portal.service.impl;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.fc.flf.common.domain.HouseGroupInfo;
import com.fc.flf.common.domain.VisitorSkimHouseGroup;
import com.fc.flf.common.util.CommonUtil;
import com.fc.flf.common.util.CookieUnit;
import com.fc.flf.common.util.DateTools;
import com.fc.flf.common.util.Page;
import com.fc.flf.common.util.SessionInfo;
import com.fc.flf.portal.mapper.LineSetMealMapper;
import com.fc.flf.portal.service.ILineSetMealService;

@Service
public class LineSetMealServiceImpl implements ILineSetMealService {

	@Resource
	private LineSetMealMapper lsm;
	private static final String GROUPTIME3DAY = "2";
	private static final String GROUPTIME7DAY = "3";
	private static final String GROUPTIME15DAY = "4";
	private static final String GROUPTIME1MONTH = "5";
	private static final String AZONIC = "1";
	private static final String GROUPTIME5 = "备用";
	
	private static final String ROLE_0 ="ROLE_0";
	private static final String ROLE_1 ="ROLE_1";
	private static final String ROLE_2 ="ROLE_2";
	private static final String ROLE_3 ="ROLE_3";
	private static final String ROLE_4 ="ROLE_4";
	private static final String ROLE_5 ="ROLE_5";
	private static final String ROLE_6 ="ROLE_6";
	

	@Transactional(readOnly = true)
	public int getTotalCount() {
		return lsm.getTotalCount();
	}

	@Transactional(readOnly = true)
	public List<HouseGroupInfo> getAllHouseGroupInfo(Page page) {
		return lsm.getAllHouseGroupInfo(page.getLimit());
	}

	/**
	 * 得到所有旅游线路即记录数(分页)(客户报名使用)
	 */
	@Transactional(readOnly = true)
	public List<HouseGroupInfo> getAllHouseGroupInfoCus(Map<String, Object> map) {
		if (map.get("lineName") != null) {
			String lineName = (String) map.get("lineName");
			try {
				map.put("lineName", new String(lineName.getBytes("iso8859-1"),
						"UTF-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return lsm.getAllHouseGroupInfoCus(map);
	}

	@Transactional(readOnly = true)
	public HouseGroupInfo getHouseGroupInfoById(int id) {
		return lsm.getHouseGroupInfoById(id);
	}

	@Transactional(readOnly = true)
	public List<HouseGroupInfo> getHotLineRecommend() {
		return lsm.getHotLineRecommend();
	}

	@Transactional(readOnly = true)
	public List<HouseGroupInfo> getTravelPage(int houseGroupId) {
		return lsm.getTravelPage(houseGroupId);
	}

	@Override
	public List<HouseGroupInfo> getRecentOpenHouseGroupInfo() {
		Date currentTime = new Date(
				new Date(System.currentTimeMillis()).getTime());
		return lsm.getRecentOpenHouseGroupInfo(currentTime);
	}

	@Transactional(readOnly = true)
	public List<HouseGroupInfo> RecentBrowsersTouristGroup() {
		List<HouseGroupInfo> list = new ArrayList<HouseGroupInfo>();
		try {
			int visitorId = SessionInfo.getVisitorId(CommonUtil.getRequest());
			list = lsm.getVisitorBrowse(visitorId);
		} catch (Exception e) {
			String cookieValue = CookieUnit.getCookieByName(
					CommonUtil.getRequest(), "houseGroup");
			if (cookieValue != null && !"".equals(cookieValue)) {
				String[] ids = cookieValue.split("-");
				for (String id : ids) {
					HouseGroupInfo houseGroupInfo = getHouseGroupInfoById(Integer
							.parseInt(id));
					list.add(houseGroupInfo);
				}
			}
		}
		return list;
	}

	@Override
	public List<HouseGroupInfo> getVisitorBrowse(int visitor) {
		return lsm.getVisitorBrowse(visitor);
	}

	@Transactional(readOnly = true)
	public List<HouseGroupInfo> getCollectTouristGroup() {
		VisitorSkimHouseGroup vshg = new VisitorSkimHouseGroup();
		String type = "";
		try {
			vshg.setVisitorId(SessionInfo.getVisitorId(CommonUtil.getRequest()));
			type = SessionInfo.getVisitorType(CommonUtil.getRequest());
			if(ROLE_0.equals(type)){
				vshg.setVistorType(0);
			}else if(ROLE_1.equals(type)){
				vshg.setVistorType(1);
			}else if(ROLE_2.equals(type)){
				vshg.setVistorType(2);
			}else if(ROLE_3.equals(type)){
				vshg.setVistorType(3);
			}else if(ROLE_4.equals(type)){
				vshg.setVistorType(4);
			}else if(ROLE_5.equals(type)){
				vshg.setVistorType(5);
			}else if(ROLE_6.equals(type)){
				vshg.setVistorType(6);
			}else{
				vshg.setVistorType(-1);
			}
		} catch (Exception e) {
			vshg.setVisitorId(-1);
			vshg.setVistorType(-1);
		}
		return lsm.getCollectTouristGroup(vshg);
	}	
	
	/**
	 * 查询登陆用户经纪人浏览过的购房团
	 * @param visitor
	 * @return
	 */
	public List<HouseGroupInfo> getEconomicManHouseGroup(){
		VisitorSkimHouseGroup vshg = new VisitorSkimHouseGroup();
		String type = "";
		try {
			vshg.setVisitorId(SessionInfo.getVisitorId(CommonUtil.getRequest()));
			type = SessionInfo.getVisitorType(CommonUtil.getRequest());
			if(ROLE_0.equals(type)){
				vshg.setVistorType(0);
			}else if(ROLE_1.equals(type)){
				vshg.setVistorType(1);
			}else if(ROLE_2.equals(type)){
				vshg.setVistorType(2);
			}else if(ROLE_3.equals(type)){
				vshg.setVistorType(3);
			}else if(ROLE_4.equals(type)){
				vshg.setVistorType(4);
			}else if(ROLE_5.equals(type)){
				vshg.setVistorType(5);
			}else if(ROLE_6.equals(type)){
				vshg.setVistorType(6);
			}else{
				vshg.setVistorType(-1);
			}
		} catch (Exception e) {
			vshg.setVisitorId(-1);
			vshg.setVistorType(-1);
		}
		return lsm.getEconomicManHouseGroup(vshg);
	}

	@SuppressWarnings("static-access")
	@Transactional(readOnly = true)
	public List<HouseGroupInfo> getSearchHouseGroupInfo(
			HouseGroupInfo houseGroupInfo, Page page) {
		DateTools dt = new DateTools();
		Date date = new Date();
		String strTime;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		houseGroupInfo.setNowTime(sdf.format(new Date()));
		Calendar cld = Calendar.getInstance();
		cld.setTime(dt.stringToDate(sdf.format(date)));
		cld.add(Calendar.MONTH, 1);
		if (AZONIC.equals(houseGroupInfo.getGrouptime())) {
			houseGroupInfo.setGrouptime("");
		}
		if (GROUPTIME3DAY.equals(houseGroupInfo.getGrouptime())) {
			
			cld.add(Calendar.DATE, 3);
			strTime = dt.dateToString(cld.getTime());
		} else if (GROUPTIME7DAY.equals(houseGroupInfo.getGrouptime())) {

			cld.add(Calendar.DATE, 7);
			strTime = dt.dateToString(cld.getTime());
		} else if (GROUPTIME15DAY.equals(houseGroupInfo.getGrouptime())) {

			cld.add(Calendar.DATE, 15);
			strTime = dt.dateToString(cld.getTime());
		} else if (GROUPTIME1MONTH.equals(houseGroupInfo.getGrouptime())) {

			cld.add(Calendar.MONTH, 1);
			strTime = dt.dateToString(cld.getTime());
		} else {
			strTime = "2023-01-01";
		}

		System.out.println(cld.getTime());
		System.out.println(houseGroupInfo.getGrouptime());
		houseGroupInfo.setNextTime(strTime);
		page.setRowCount(getSearchHouseGroupInfoCount(houseGroupInfo));
		houseGroupInfo.setLimitStr(page.getLimit());
		return lsm.getSearchHouseGroupInfo(houseGroupInfo);
	}

	@Override
	public int getSearchHouseGroupInfoCount(HouseGroupInfo houseGroupInfo) {

		return lsm.getSearchHouseGroupInfoCount(houseGroupInfo);
	}

	@Transactional(readOnly = true)
	public List<HouseGroupInfo> getCurrentWeekdayOpenHouseGroupInfo() {
		Date currentWeekday = new Date(DateTools.getCurrentWeekday().getTime());
		Date mondayOFWeek = new Date(DateTools.getMondayOFWeek().getTime());
		System.out.println(currentWeekday);
		return lsm.getCurrentWeekdayOpenHouseGroupInfo(currentWeekday,
				mondayOFWeek);
	}

	public VisitorSkimHouseGroup getVisitorSkimHouseGroup(int visitorId,
			int houseGroupId) {
		return null;
	}

	public void updateVisitorSkimHouseGroupInTime(Date currentTime,
			int visitorId, int houseGroupId) {

	}

	/**
	 * 保存用户浏览的信息
	 */
	@Transactional(propagation = Propagation.REQUIRED)
	public void saveVisitorSkimHouseGroup(int houseGroupId) {
		Integer visitorId = null;
		try {
			visitorId = SessionInfo.getVisitorId(CommonUtil.getRequest());
		} catch (Exception e) {
			visitorId = 0;
		}
		VisitorSkimHouseGroup visitorSkimHouseGroup_ = lsm
				.getVisitorSkimHouseGroup(visitorId.intValue(), houseGroupId);
		if (visitorSkimHouseGroup_ == null) {
			VisitorSkimHouseGroup visitorSkimHouseGroup = new VisitorSkimHouseGroup();
			visitorSkimHouseGroup.setHouseGroupId(houseGroupId);
			visitorSkimHouseGroup.setVisitorId(visitorId);
			visitorSkimHouseGroup.setVistorType(1);// 0游客1经纪人2客户
			visitorSkimHouseGroup.setCheckinIp(CommonUtil.getRequest()
					.getRemoteHost());
			visitorSkimHouseGroup.setCheckinType("computer");
			visitorSkimHouseGroup.setCheckinTime(new Date());
			visitorSkimHouseGroup.setCheckoutTime(new Date());
			lsm.saveVisitorSkimHouseGroup(visitorSkimHouseGroup);
		} else {
			lsm.updateVisitorSkimHouseGroupInTime(
					new Date(System.currentTimeMillis()), visitorId,
					houseGroupId);
		}
	}


	@Override
	public String getGroupNameByHouseId(int houseId) {
		// TODO Auto-generated method stub
		return null;
	}

}
