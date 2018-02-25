package com.fc.flf.portal.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.flf.common.domain.HousePicInfo;
import com.fc.flf.common.util.Page;
import com.fc.flf.portal.mapper.HousePicInfoMapper;
import com.fc.flf.portal.service.IHousePicInfoService;

@Service
public class HousePicInfoServiceImpl implements IHousePicInfoService {

	@Resource
	private HousePicInfoMapper housePicInfoMapper;
	
	@Transactional(readOnly=true)
	public HousePicInfo findHousePicInfoById(int picId) {
		HousePicInfo housePicInfo= housePicInfoMapper.findHousePicInfoById(picId);
		return housePicInfo;
	}

	@Transactional(readOnly=true)
	public List<HousePicInfo> getHousePicInfoList(Map<String, Object> map) {
		List<HousePicInfo> picInfoList=housePicInfoMapper.getHousePicInfoList(map);
		return picInfoList;
	}

	@Transactional(readOnly=true)
	public List<HousePicInfo> getHousePicInfoListOnLimit(Page page,Map<String, Object> map) {
		int count=housePicInfoMapper.getHousePicInfoCount(map);
		page.setRowCount(count);
		map.put("limit", page.getLimit());
		List<HousePicInfo> picInfoList=housePicInfoMapper.getHousePicInfoListOnLimit(map);
		return picInfoList;
	}

	@Transactional(readOnly=true)
	public List<HousePicInfo> findHousePicInfoByHouseId(int houseId) {
		// TODO Auto-generated method stub
		return housePicInfoMapper.findHousePicInfoByHouseId(houseId);
	}

}
