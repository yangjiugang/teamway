package com.fc.flf.portal.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.flf.common.domain.VisitorCollectHouse;
import com.fc.flf.portal.mapper.IVisitorCollectHouseMapper;
import com.fc.flf.portal.service.IVisitorCollectHouseService;

@Service
public class VisitorCollectHouseServiceImpl implements
		IVisitorCollectHouseService {
	
	@Resource
	private IVisitorCollectHouseMapper collectHouseMapper;

	@Transactional
	public int userCollectHouse(VisitorCollectHouse visitorCollectHouse) {
		int userId = visitorCollectHouse.getVisitorId();
		int houseId = visitorCollectHouse.getHouseId();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("houseId", houseId);
		int count = collectHouseMapper.isInCollectHouseById(map);
		
		//如果已经收藏过该楼盘
		if (count > 0) {
			return 0;
		}
		
		int isSave = collectHouseMapper.userCollectHouse(visitorCollectHouse);
		if (isSave>0) {
			collectHouseMapper.updateHouseInfoCnt(houseId);		//楼盘收藏数+1
		}
		
		return isSave;
	}

}
