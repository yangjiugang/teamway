package com.fc.flf.portal.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.flf.common.domain.HouseNews;
import com.fc.flf.common.util.Page;
import com.fc.flf.portal.mapper.HouseNewsMapper;
import com.fc.flf.portal.service.IHouseNewsService;

@Service
public class HouseNewsServiceImpl implements IHouseNewsService {

	@Resource
	private HouseNewsMapper houseNewsMapper;

	@Transactional(readOnly=true)
	public List<HouseNews> getHouseNews(Page page,int houseId) {
		int count = houseNewsMapper.getHouseNewsCount(houseId);
		Map<String, Object> map=new HashMap<String, Object>();
		page.setRowCount(count);
		map.put("houseId", houseId);
		map.put("limit", page.getLimit());
		List<HouseNews> houseNews= houseNewsMapper.getHouseNews(map);
		return houseNews;
	}

	@Transactional(readOnly=true)
	public int getHouseNewsCount(int houseId) {
		int count=houseNewsMapper.getHouseNewsCount(houseId);
		return count;
	}

	@Transactional(readOnly=true)
	public List<HouseNews> getHouseNewsAboutType(Map<String, Object> map) {
		List<HouseNews> houseNews = houseNewsMapper.getHouseNewsAboutType(map);
		return houseNews;
	}

	@Transactional(readOnly=true)
	public HouseNews getNewsById(int houseId) {
		HouseNews houseNews = houseNewsMapper.getNewsById(houseId);
		return houseNews;
	} 
	
	@Transactional(readOnly=true)
	public List<HouseNews> getNewHouseNews() {
		return houseNewsMapper.getNewHouseNews();
	}
}
