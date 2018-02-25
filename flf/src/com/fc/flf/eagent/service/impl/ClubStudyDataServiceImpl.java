package com.fc.flf.eagent.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.flf.common.domain.ClubStudyData;
import com.fc.flf.common.domain.ClubStudyDataInfo;
import com.fc.flf.eagent.mapper.IClubStudyDataMapper;
import com.fc.flf.eagent.service.IClubStudyDataService;

@Service
public class ClubStudyDataServiceImpl implements IClubStudyDataService{

	@Resource
	private IClubStudyDataMapper clubStudyDataMapper;
	
	@Transactional(readOnly=true)
	public List<ClubStudyData> selectClubStudyDataByTypeToPage(
			Map<String, Object> map) {
		List<ClubStudyData> clubStudyDataList = clubStudyDataMapper.selectClubStudyDataByTypeToPage(map);
		return clubStudyDataList;
	}

	@Transactional(readOnly=true)
	public int selectClubStudyDataCountByType(Map<String, Object> map) {
		int count = clubStudyDataMapper.selectClubStudyDataCountByType(map);
		return count;
	}

	@Transactional(readOnly=true)
	public ClubStudyDataInfo selectClubStudyDataInfoById(int dataId) {
		ClubStudyDataInfo clubStudyDataInfo = clubStudyDataMapper.selectClubStudyDataInfoById(dataId);
		return clubStudyDataInfo;
	}

}
