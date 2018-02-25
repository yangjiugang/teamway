package com.fc.flf.portal.mapper;

import java.util.List;
import java.util.Map;

import com.fc.flf.common.domain.HousePicInfo;

public interface HousePicInfoMapper {
	public HousePicInfo findHousePicInfoById(int picId);
	public List<HousePicInfo> findHousePicInfoByHouseId(int houseId);
	public List<HousePicInfo> getHousePicInfoList(Map<String, Object> map);
	public List<HousePicInfo> getHousePicInfoListOnLimit(Map<String, Object> map);
	public int getHousePicInfoCount(Map<String, Object> map);
}
