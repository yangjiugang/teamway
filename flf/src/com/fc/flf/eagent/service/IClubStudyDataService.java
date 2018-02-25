package com.fc.flf.eagent.service;

import java.util.List;
import java.util.Map;

import com.fc.flf.common.domain.ClubStudyData;
import com.fc.flf.common.domain.ClubStudyDataInfo;

public interface IClubStudyDataService {
	public List<ClubStudyData> selectClubStudyDataByTypeToPage(Map<String, Object> map);
	public int selectClubStudyDataCountByType(Map<String, Object> map);
	public ClubStudyDataInfo selectClubStudyDataInfoById(int dataId);
}
