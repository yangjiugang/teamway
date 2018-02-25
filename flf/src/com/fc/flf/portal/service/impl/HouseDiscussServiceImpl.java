package com.fc.flf.portal.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.flf.common.domain.HouseDiscuss;
import com.fc.flf.common.domain.HouseInfo;
import com.fc.flf.common.util.DateTools;
import com.fc.flf.common.util.Page;
import com.fc.flf.portal.mapper.HouseInfoMapper;
import com.fc.flf.portal.mapper.IHouseDiscussMapper;
import com.fc.flf.portal.service.IHouseDiscussService;

@Service
public class HouseDiscussServiceImpl implements IHouseDiscussService {

	@Resource
	private IHouseDiscussMapper houseDiscussMapper;
	@Resource
	private HouseInfoMapper houseInfoMapper;
	
	@Transactional(readOnly=true)
	public List<HouseDiscuss> queryHouseDiscuss(Page page,int houseId) {
		int count = houseDiscussMapper.queryCountDiscuss(houseId);
		page.setRowCount(count);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("houseId", houseId);
		map.put("limit", page.getLimit());
		return houseDiscussMapper.queryHouseDiscuss(map);
	}

	@Transactional(readOnly=true)
	public List<HouseDiscuss> queryHouseDiscussByType(Page page,Map<String, Object> map) {
		int count = houseDiscussMapper.queryCountDiscussByType(map);
		page.setRowCount(count);
		map.put("limit", page.getLimit());
		return houseDiscussMapper.queryHouseDiscussByType(map);
	}

	@Transactional(readOnly=true)
	public int queryCountDiscussByType(Map<String, Object> map) {
		return houseDiscussMapper.queryCountDiscussByType(map);
	}

	@Transactional(readOnly=true)
	public int queryCountDiscuss(int houseId) {
		return houseDiscussMapper.queryCountDiscuss(houseId);
	}

	@Transactional
	public void saveDiscussByContent(HouseDiscuss houseDiscuss) {
		houseDiscuss.setCreateDate(DateTools.dateToYear());
		houseDiscussMapper.saveDiscussByContent(houseDiscuss);
	}

	@Transactional(readOnly=true)
	public List<HouseDiscuss> queryHouseDiscussByUser(Page page,int visitorId) {
		
		int count = houseDiscussMapper.queryCountDiscussByUser(visitorId);
		page.setRowCount(count);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("visitorId", visitorId);
		map.put("limit", page.getLimit());
		List<HouseDiscuss> hds=houseDiscussMapper.queryHouseDiscussByUser(map);
		for (int i = 0; i < hds.size(); i++) {
			List<HouseInfo> houseInfos = hds.get(i).getHouseInfo();
			HouseInfo houseInfo = houseInfoMapper.findHouseInfoById(hds.get(i).getHouseId());
			if(houseInfos==null)
				houseInfos=new ArrayList<HouseInfo>();
			houseInfos.add(houseInfo);
			hds.get(i).setHouseInfo(houseInfos);
		}
		return hds;
	}

	@Transactional(readOnly=true)
	public int queryCountDiscussByUser(int visitorId) {
		// TODO Auto-generated method stub
		return houseDiscussMapper.queryCountDiscussByUser(visitorId);
	}

	@Transactional(readOnly=true)
	public List<HouseDiscuss> findDiscussByUserId(int userId,String limit) {
		return houseDiscussMapper.selectDiscussByUserId(userId,limit);
	}

	@Transactional(readOnly=true)
	public int findCountHouseDisByUserId(int userId) {
		return houseDiscussMapper.selectCountHouseDisByUserId(userId);
	}

	@Transactional(readOnly=true)
	public HouseDiscuss findDiscussById(int discussId) {
		return houseDiscussMapper.selectDiscussById(discussId);
	}

	@Transactional
	public void delHouseDisByDisId(int discussId) {
		houseDiscussMapper.deleteHouseDisById(discussId);
	}

}
