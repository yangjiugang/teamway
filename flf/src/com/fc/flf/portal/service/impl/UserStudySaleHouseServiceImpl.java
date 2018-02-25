package com.fc.flf.portal.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.flf.portal.mapper.UserStudySaleHouseMapper;
import com.fc.flf.portal.service.IUserStudySaleHouseService;

@Service
public class UserStudySaleHouseServiceImpl implements IUserStudySaleHouseService {

	@Resource
	private UserStudySaleHouseMapper userSaleHouserMapper;
	
	@Transactional(readOnly=true)
	public int getHouseSaleSum(int houseId) {
		int count=userSaleHouserMapper.getHouseSaleSum(houseId);
		return count;
	}

}
