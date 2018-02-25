package com.fc.flf.portal.mapper;

import java.util.List;
import java.util.Map;

import com.fc.flf.common.domain.HouseStructureInfo;

public interface HouseStructureInfoMapper {
	public List<HouseStructureInfo> findStructureInfoByHouseId(Map<String, Object> map);
}
