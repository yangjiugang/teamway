package com.fc.flf.portal.service;

import java.util.List;
import java.util.Map;

import com.fc.flf.common.domain.HouseStructureInfo;

public interface IHouseStructureInfoService {
	public List<HouseStructureInfo> findStructureInfoByHouseId(Map<String, Object> map);
}
