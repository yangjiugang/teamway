package com.fc.flf.portal.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.fc.flf.common.domain.HouseDiscuss;

public interface IHouseDiscussMapper {
	public List<HouseDiscuss> queryHouseDiscuss(Map<String, Object> map);
	public List<HouseDiscuss> queryHouseDiscussByType(Map<String, Object> map);
	public int queryCountDiscussByType(Map<String, Object> map);
	public int queryCountDiscuss(int houseId);
	public void saveDiscussByContent(HouseDiscuss houseDiscuss);
	public List<HouseDiscuss> queryHouseDiscussByUser(Map<String, Object> map);
	public int queryCountDiscussByUser(int visitorId);
	public List<HouseDiscuss> selectDiscussByUserId(@Param("userId") int userId,@Param("limit") String limit);
	public int selectCountHouseDisByUserId(int userId);
	public HouseDiscuss selectDiscussById(int discussId);
	public void deleteHouseDisById(int discussId);
}
