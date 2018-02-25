package com.fc.flf.portal.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.fc.flf.common.domain.HouseGroupInfo;
import com.fc.flf.common.domain.VisitorSkimHouseGroup;
import com.fc.flf.common.util.Page;

public interface ILineSetMealService {
	/**
	 * 得到旅游线路总记录数
	 * @return
	 */
	public int getTotalCount();
	
	/**
	 * 得到所有旅游线路即记录数(分页)
	 * @param page
	 * @return
	 */
	public List<HouseGroupInfo> getAllHouseGroupInfo(Page page);
	
	/**
	 * 得到所有旅游线路即记录数(分页)(客户报名使用)
	 * @param page
	 * @return
	 */
	public List<HouseGroupInfo> getAllHouseGroupInfoCus(Map<String, Object> map);
	
	/**
	 * 热点线路推荐
	 * @return
	 */
	public List<HouseGroupInfo> getHotLineRecommend();
	
	/**
	 * 点击旅游线路进入详细旅游线路页面
	 * @param houseGroupId
	 * @return
	 */
	public List<HouseGroupInfo> getTravelPage(int houseGroupId);
	
	/**
	 * 根据id查找旅游购房信息
	 * @param id
	 * @return
	 */
	public HouseGroupInfo getHouseGroupInfoById(int id);
	
	/**
	 * 查找最近开团信息
	 * @param 
	 * @return
	 */
	public List<HouseGroupInfo> getRecentOpenHouseGroupInfo();
	
	/**
	 * 您最近浏览过的购房旅游团
	 * @return
	 */
	public List<HouseGroupInfo> RecentBrowsersTouristGroup();
	
	/**
	 * 您收藏过的购房旅游团
	 * @param visitorId
	 * @return
	 */
	public List<HouseGroupInfo> getCollectTouristGroup();
	
	
	/**
	 * 按照条件搜索购房团信息
	 * @param houseGroupInfo
	 * @return
	 */
	public List<HouseGroupInfo> getSearchHouseGroupInfo(HouseGroupInfo houseGroupInfo,Page page);
	
	/**
	 * 按条件搜索购房信息总条数
	 * @param houseGroupInfo
	 * @return
	 */
	public int getSearchHouseGroupInfoCount(HouseGroupInfo houseGroupInfo);
	
	/**
	 * 查找本周开团信息
	 * @param 
	 * @return
	 */
	public List<HouseGroupInfo> getCurrentWeekdayOpenHouseGroupInfo();
	
	
	/**
	 * 根据houseId查询旅游购房团
	 * @param houseId
	 * @return String
	 */
	public String getGroupNameByHouseId(int houseId);
	
	/**
	 * 根据登陆用户查找浏览过的信息
	 * @param Visitor
	 * @return
	 */
	public List<HouseGroupInfo> getVisitorBrowse(int visitor);
	
	/**
	 * 查询登陆用户经纪人浏览过的购房团
	 * @param visitor
	 * @return
	 */
	public List<HouseGroupInfo> getEconomicManHouseGroup();
	
	
	public VisitorSkimHouseGroup getVisitorSkimHouseGroup(@Param("visitorId") int visitorId,@Param("houseGroupId") int houseGroupId);
	public void updateVisitorSkimHouseGroupInTime(@Param("visitorSkimHouseMap") java.util.Date currentTime,
			 @Param("visitorId") int visitorId,@Param("houseGroupId") int houseGroupId);
	public void saveVisitorSkimHouseGroup(int houseGroupId);
}
