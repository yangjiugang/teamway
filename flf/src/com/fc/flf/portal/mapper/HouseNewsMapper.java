package com.fc.flf.portal.mapper;

import java.util.List;
import java.util.Map;

import com.fc.flf.common.domain.HouseNews;

public interface HouseNewsMapper {

	public List<HouseNews> getHouseNews(Map<String, Object> map);
	public List<HouseNews> getHouseNewsAboutType(Map<String, Object> map);
	public int getHouseNewsCount(int houseId);
	public HouseNews getNewsById(int newsId);
	public List<HouseNews> getNewHouseNews();
}
