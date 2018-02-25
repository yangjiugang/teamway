package com.fc.flf.portal.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.flf.common.domain.HouseInfo;
import com.fc.flf.common.util.Page;
import com.fc.flf.portal.mapper.IAbroadPurchaseMapper;
import com.fc.flf.portal.service.IAbroadPurchaseService;

@Service
public class AbroadPurchaseServiceImpl implements IAbroadPurchaseService{
	@Resource
	private IAbroadPurchaseMapper apm;
	

	
	@Transactional(readOnly=true)
	public int getCountAbraod() {
		return apm.getCountAbraod();
	}

	@Transactional(readOnly=true)
	public List<HouseInfo> getAllAbroad(Page page) {
		return apm.getAllAbroad(page.getLimit());
	}

	@Transactional(readOnly=true)
	public List<HouseInfo> getHotHousesName() {
		return apm.getHotHousesName();
	}

}
