package com.fc.flf.portal.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.fc.flf.common.domain.EventInfo;
import com.fc.flf.common.domain.HomeShow;
import com.fc.flf.common.domain.HouseInfo;
import com.fc.flf.common.domain.VisitorSkimHouse;
import com.fc.flf.common.util.CommonUtil;
import com.fc.flf.common.util.CookieUnit;
import com.fc.flf.common.util.Page;
import com.fc.flf.common.util.SessionInfo;
import com.fc.flf.portal.mapper.HouseInfoMapper;
import com.fc.flf.portal.mapper.LineSetMealMapper;
import com.fc.flf.portal.service.IHouseInfoService;

@Service
public class HouseInfoServiceImpl implements IHouseInfoService {

	@Resource
	private HouseInfoMapper houseInfoMapper;
	@Resource
	private LineSetMealMapper lineSetMealMapper;
	
	@Transactional(readOnly=true)
	public HouseInfo findHouseInfoById(int houseId) {
		HouseInfo houseInfo = houseInfoMapper.findHouseInfoById(houseId);
		return houseInfo;
	}

	@Transactional(readOnly=true)
	public List<Object> findHomeInfoNewHouseList() {
		List<Object> objs = new ArrayList<Object>();
		Object obj = new Object();
		List<HomeShow>showList =  houseInfoMapper.findHomeInfoNewHouseList();
		for(HomeShow homeShow : showList){
			// 楼盘 1，旅游团 2，会所活动 3，海外置业 4
			if(homeShow.getShowType() == 1 || homeShow.getShowType() == 4){
				obj = findHouseInfoById(homeShow.getShowContentId());
			}
			if(homeShow.getShowType() == 2){
				obj = lineSetMealMapper.getHouseGroupInfoById(homeShow.getShowContentId());
			}
			if(homeShow.getShowType() == 3){
				
			}
			homeShow.setObj(obj);
			objs.add(homeShow);
		}
		return objs;
	}

	@Override
	public List<HouseInfo> findHouseInfoWithDetail() {
		java.sql.Date currentTime=new java.sql.Date(System.currentTimeMillis());
		List<HouseInfo> list = houseInfoMapper.findHouseInfoWithDetail(currentTime);
		return list;
	}
	
	@Transactional(readOnly = true)
	public List<HouseInfo> findRecentBrowsers() throws Exception {
		List<HouseInfo> list = new ArrayList<HouseInfo>();
		try{
			int visitorId = SessionInfo.getVisitorId(CommonUtil.getRequest());
			list = houseInfoMapper.findBrowserRecord(visitorId);
		}catch(Exception e){
			String cookieValue = CookieUnit.getCookieByName(CommonUtil.getRequest(), "house");
			if(cookieValue != null && !"".equals(cookieValue)){
				String[] ids = cookieValue.split("-");
				for(int i = ids.length -1; i>=0; i--){
	            	HouseInfo houseInfo = findHouseInfoById(Integer.parseInt(ids[i]));
	            	list.add(houseInfo);
	            	if(list.size() > 10 ) break;
	            }  
			}
		}
		return list;
	}
	//TODO 保存House浏览记录
	@Transactional(propagation = Propagation.REQUIRED)
	public void saveVisitorSkimHouse(int houseId,HttpServletResponse response) throws Exception {
		try{
			Integer visitorId = SessionInfo.getVisitorId(CommonUtil.getRequest());
			VisitorSkimHouse visitorSkimHouse_ = houseInfoMapper.findVisitorSkimHouse(visitorId.intValue(), houseId);
			if(visitorSkimHouse_ == null){
				VisitorSkimHouse visitorSkimHouse = new VisitorSkimHouse();
				visitorSkimHouse.setHouseId(houseId);
				visitorSkimHouse.setVisitorId(visitorId); // 用户 ID,如果游客则0
				String visitorType = SessionInfo.getVisitorType(CommonUtil.getRequest());
				visitorSkimHouse.setVisitorType(visitorType == "ROLE_0"?1:0); // 0游客1经纪人2客户 TODO 这里需要改
				visitorSkimHouse.setCheckinIp(CommonUtil.getRequest().getRemoteHost());
				visitorSkimHouse.setCheckinType("Computer"); // OR 手机iphone, ipad etc
				visitorSkimHouse.setCheckinTime(new Date());
				visitorSkimHouse.setCheckoutTime(new Date());
				houseInfoMapper.saveVisitorSkimHouse(visitorSkimHouse);
			}else{
				houseInfoMapper.updateVisitorSkimHouseInTime(new Date(System.currentTimeMillis()), visitorId, houseId);
			}
		}catch(Exception e){
			CookieUnit.addCookie(response, "house",CookieUnit.
			buildViewHistory(CommonUtil.getRequest(),houseId,"house"), 30*24*60*60);
		}
	}
	
	@Transactional(propagation = Propagation.REQUIRED)
	public void updateHouseAttenttion(int houseId) {
		houseInfoMapper.updateHouseAttenttion(houseId);
	}
	
	@Transactional(readOnly = true)
	public List<HouseInfo> findCollectHouse() {
		int visitorId = 0;
		try{
			visitorId = SessionInfo.getVisitorId(CommonUtil.getRequest());
		}catch(Exception e){
		}
		return houseInfoMapper.findCollectHouse(visitorId);
	}
	
	@Transactional(readOnly = true)
	public List<HouseInfo> findNewHouseList(Page page) {
		page.setRowCount(getTotalCount());
		return houseInfoMapper.findNewHouseList(page.getLimit());
	}
	
	@Transactional(readOnly = true)
	public int getTotalCount() {
		return houseInfoMapper.getTotalCount();
	}

	@Override
	public List<HouseInfo> findHouseInfoAccurate(HouseInfo houseInfo,Page page) {
		if("请输入关键词".equals(houseInfo.getHouseName()))
				houseInfo.setHouseName("");
		page.setRowCount(getHouseInfoAccurateCount(houseInfo));
		houseInfo.setLimitValue(page.getLimit());
		return houseInfoMapper.findHouseInfoAccurate(houseInfo);
	}
	
	@Override
	public int getHouseInfoAccurateCount(HouseInfo houseInfo) {
		if("请输入关键词".equals(houseInfo.getHouseName()))
			houseInfo.setHouseName("");
		return houseInfoMapper.getHouseInfoAccurateCount(houseInfo);
	}
	
	@Transactional(readOnly = true)
	public List<HouseInfo> findRecentSignHouseInfo() {
		java.sql.Date currentTime=new java.sql.Date(System.currentTimeMillis());
		return houseInfoMapper.findRecentSignHouseInfo(currentTime);
	}
	
	@Override
	public List<HouseInfo> attentionHouseInfos() {
		return houseInfoMapper.attentionHouseInfos();
	}
	
	@Override
	public List<HouseInfo> everyoneAttention() {
		return houseInfoMapper.everyoneAttention();
	}
	
	@Override
	public List<EventInfo> weekActivity(String date) {
		return houseInfoMapper.weekActivity(date);
	}
	
	@Override
	public List<HouseInfo> fangMishuAttention() {
		return houseInfoMapper.fangMishuAttention();
	}
	
	/**
	 * 查询看房团
	 * @param houseInfo
	 * @return
	 * @author 覃启轩 add 2012-2-9
	 */
	public List<HouseInfo> getSeeHouseAccurate(HouseInfo houseInfo,Page page) {
		if("请输入关键词".equals(houseInfo.getHouseName()))
				houseInfo.setHouseName("");
		page.setRowCount(getSeeHouseAccurateCount(houseInfo));
		houseInfo.setLimitValue(page.getLimit());
		return houseInfoMapper.getSeeHouseAccurate(houseInfo);
	}
	
	/**
	 * 查询看房团总记录数
	 * @param houseInfo
	 * @return
	 * @author 覃启轩 add 2012-2-9
	 */
	public int getSeeHouseAccurateCount(HouseInfo houseInfo) {
		if("请输入关键词".equals(houseInfo.getHouseName()))
			houseInfo.setHouseName("");
		return houseInfoMapper.getSeeHouseAccurateCount(houseInfo);
	}
}
