package com.fc.flf.fparty.mapper;

import java.util.List;
import java.util.Map;

import com.fc.flf.common.domain.HouseInfo;
public interface IVisitorHouseMapper {
    
	/**
	 * 我关注的楼盘 
	 * @param map
	 * @return
	 */
	public List<HouseInfo> skimHouseList(Map<String,Object> map);
	
	/**
	 * 我关注的楼盘 数量
	 * @param cusid
	 * @return
	 */
	public int getSkimCount(int customerId);
	
	/**
	 * 我收藏的楼盘 
	 * @param map
	 * @return
	 */
	public List<HouseInfo> collectHouse(Map<String,Object> map);
	
	/**
	 * 我收藏的楼盘 数量
	 * @param cusid
	 * @return
	 */
	public int getCollectCount(int customerId);
	
	/**
	 * 经纪人推荐的楼盘 
	 * @param map
	 * @return
	 */
	public List<HouseInfo> recommendHouse(Map<String,Object> map);
	
	/**
	 * 经纪人推荐的楼盘 数量
	 * @param cusid
	 * @return
	 */
	public int getRecommendCount(int customerId);
	
	/**
	 * 客户喊过价的楼盘
	 * @param map
	 * @return
	 */
	public List<HouseInfo> priceHouse(Map<String,Object> map);
	
	/**
	 * 客户喊过价的楼盘 数量
	 * @param cusid
	 * @return
	 */
	public int getPriceCount(int customerId);
	
	/**
	 * 客户实地看过的楼盘
	 * @param map
	 * @return
	 */
	public List<HouseInfo> lookHouse(Map<String,Object> map);
	
	/**
	 * 客户实地看过的楼盘数量
	 * @param cusid
	 * @return
	 */
	public int getLookCount(int customerId);
	
}
