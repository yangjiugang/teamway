package com.fc.flf.portal.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.flf.common.domain.HouseEstimate;
import com.fc.flf.portal.mapper.HouseEstimateMapper;
import com.fc.flf.portal.service.IHouseEstimateService;

@Service
public class HouseEstimateServiceImpl implements IHouseEstimateService {

	@Resource
	private HouseEstimateMapper houseEstimateMapper; 
	
	@Transactional(readOnly=true)
	public HouseEstimate findHouseEstimateById(int houseId) {
		HouseEstimate houseEstimate=houseEstimateMapper.findHouseEstimateById(houseId);
		return houseEstimate;
	}

}
