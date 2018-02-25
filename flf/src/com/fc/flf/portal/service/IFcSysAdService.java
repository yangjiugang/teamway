package com.fc.flf.portal.service;

import java.util.List;

import com.fc.flf.common.domain.FcSysAd;

public interface IFcSysAdService {
	public List<FcSysAd> findAdvertisementByType(int adType);
	public List<FcSysAd> findFcSysAdByTypeWithHouseInfo(int adType);
}
