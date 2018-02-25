package com.fc.flf.portal.service;

import java.util.List;

import com.fc.flf.common.domain.HouseInfo;
import com.fc.flf.common.util.Page;

public interface IAbroadPurchaseService {

	/**
	 * 查找出所有海外购房的信息
	 * @return
	 */
	public List<HouseInfo> getAllAbroad(Page page);
	
	/**
	 * 统计外海房子的数目
	 * @return
	 */
	public int getCountAbraod();
	
	/**
	 * 热点楼盘推荐
	 * @return
	 */
	public List<HouseInfo> getHotHousesName();
}
