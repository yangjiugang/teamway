package com.fc.flf.portal.service;

import java.util.List;
import java.util.Map;

import com.fc.flf.common.domain.HousePicInfo;
import com.fc.flf.common.util.Page;

public interface IHousePicInfoService {
	public HousePicInfo findHousePicInfoById(int picId);
	public List<HousePicInfo> findHousePicInfoByHouseId(int houseId);
	public List<HousePicInfo> getHousePicInfoList(Map<String, Object> map);
	public List<HousePicInfo> getHousePicInfoListOnLimit(Page page,Map<String, Object> map);
}
