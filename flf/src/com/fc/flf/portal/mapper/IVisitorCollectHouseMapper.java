package com.fc.flf.portal.mapper;

import java.util.Map;

import com.fc.flf.common.domain.VisitorCollectHouse;

public interface IVisitorCollectHouseMapper {
	/**
	 * 根据userId 查询用户是否已经收藏该楼盘 
	 * @param userId
	 * @return
	 */
	public int isInCollectHouseById(Map<String, Object> map);
	
	/**
	 * 收藏该楼盘
	 * @param visitorCollectHouse
	 * @return
	 */
	public int userCollectHouse(VisitorCollectHouse visitorCollectHouse);
	
	/**
	 * 更新楼盘收藏数
	 * @param houseId
	 * @return
	 */
	public int updateHouseInfoCnt(int houseId);
}
