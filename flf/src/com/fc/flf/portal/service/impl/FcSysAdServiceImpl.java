package com.fc.flf.portal.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fc.flf.common.domain.FcSysAd;
import com.fc.flf.portal.mapper.IFcSysAdMapper;
import com.fc.flf.portal.service.IFcSysAdService;

@Service
public class FcSysAdServiceImpl implements IFcSysAdService{
	
	@Resource
	private IFcSysAdMapper fcSysAdMapper;
	
	@Override
	public List<FcSysAd> findAdvertisementByType(int adType) {
		List<FcSysAd> fsas = fcSysAdMapper.selectFcSysAdByType(adType);
		return fsas;
	}

	@Override
	public List<FcSysAd> findFcSysAdByTypeWithHouseInfo(int adType) {
		List<FcSysAd> fsas = fcSysAdMapper.selectFcSysAdByTypeWithHouseInfo(adType);
		return fsas;
	}

}
