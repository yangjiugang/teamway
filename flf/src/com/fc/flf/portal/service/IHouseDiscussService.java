package com.fc.flf.portal.service;

import java.util.List;
import java.util.Map;

import com.fc.flf.common.domain.HouseDiscuss;
import com.fc.flf.common.util.Page;

public interface IHouseDiscussService {
	public List<HouseDiscuss> queryHouseDiscuss(Page page,int houseId);
	public List<HouseDiscuss> queryHouseDiscussByType(Page page,Map<String, Object> map);
	public int queryCountDiscussByType(Map<String, Object> map);
	public int queryCountDiscuss(int houseId);
	public void saveDiscussByContent(HouseDiscuss houseDiscuss);
	public List<HouseDiscuss> queryHouseDiscussByUser(Page page,int visitorId);
	public int queryCountDiscussByUser(int visitorId);
	public List<HouseDiscuss> findDiscussByUserId(int userId,String limit);
	public int findCountHouseDisByUserId(int userId);
	public HouseDiscuss findDiscussById(int discussId);
	public void delHouseDisByDisId(int discussId);
}
