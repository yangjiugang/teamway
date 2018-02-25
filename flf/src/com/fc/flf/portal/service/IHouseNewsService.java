package com.fc.flf.portal.service;

import java.util.List;
import java.util.Map;

import com.fc.flf.common.domain.HouseNews;
import com.fc.flf.common.util.Page;

public interface IHouseNewsService {
	public List<HouseNews> getHouseNews(Page page,int houseId);
	public List<HouseNews> getHouseNewsAboutType(Map<String, Object> map);
	public int getHouseNewsCount(int houseId);
	public HouseNews getNewsById(int newsId);
	public List<HouseNews> getNewHouseNews();
}
