package com.fc.flf.portal.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.flf.common.domain.HouseStructureInfo;
import com.fc.flf.portal.mapper.HouseStructureInfoMapper;
import com.fc.flf.portal.service.IHouseStructureInfoService;

@Service
public class HouseStructureInfoServiceImpl implements
		IHouseStructureInfoService {

	@Resource
	private HouseStructureInfoMapper houseStructureInfoMapper;
	
	@Transactional(readOnly=true)
	public List<HouseStructureInfo> findStructureInfoByHouseId(Map<String, Object> map) {
		List<HouseStructureInfo> structureInfos=houseStructureInfoMapper.findStructureInfoByHouseId(map);
		return structureInfos;
	}

}
