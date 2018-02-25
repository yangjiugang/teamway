package com.fc.flf.portal.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.flf.common.domain.HouseInfoDetail;
import com.fc.flf.portal.mapper.HouseInfoDetailMapper;
import com.fc.flf.portal.service.IHouseInfoDetailService;

@Service
public class HouseInfoDetailServiceImpl implements IHouseInfoDetailService {

	@Resource
	private HouseInfoDetailMapper houseInfoDetailMapper;

	@Transactional(readOnly=true)
	public HouseInfoDetail findHouseInfoDetailById(int houseId) {
		HouseInfoDetail houseInfoDetail = houseInfoDetailMapper.findHouseInfoDetailById(houseId);
		return houseInfoDetail;
	}
	
	
	
}
