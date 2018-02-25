package com.fc.flf.portal.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.fc.flf.common.domain.HouseGroupInfo;
import com.fc.flf.common.domain.VisitorSkimHouseGroup;

public interface LineSetMealMapper {
	/**
	 * 获取旅游购房的总记录数
	 * @return
	 */
	public int getTotalCount();
	
	/**
	 * 获取所有旅游购房的信息(分页)
	 * @param limitStr
	 * @return
	 */
	public List<HouseGroupInfo> getAllHouseGroupInfo(@Param("limitStr") String limitStr);
	
	/**
	 * 旅游购房热线推荐
	 * @return
	 */
	public List<HouseGroupInfo> getHotLineRecommend();
	
	/**
	 * 进去旅游购房详细信息
	 * @param houseGroupId
	 * @return
	 */
	public List<HouseGroupInfo> getTravelPage(int houseGroupId);
	
	/**
	 * 按照旅游购房的ID查找详细信息
	 * @param id
	 * @return
	 */
	public HouseGroupInfo getHouseGroupInfoById(int id);
	
	/**
	 * 用户收藏的旅游购房团
	 * @param visitorId
	 * @return
	 */
	public List<HouseGroupInfo> getCollectTouristGroup(VisitorSkimHouseGroup visitorSkimHouseGroup);
	
	/**
	 * 查询登陆用户的浏览信息
	 * @return
	 */
	public List<HouseGroupInfo> getVisitorBrowse(int visitor);
	
	/**
	 * 查询登陆用户经纪人浏览过的购房团
	 * @param visitor
	 * @return
	 */
	public List<HouseGroupInfo> getEconomicManHouseGroup(VisitorSkimHouseGroup visitorSkimHouseGroup);
	
	public VisitorSkimHouseGroup getVisitorSkimHouseGroup(@Param("visitorId") int visitorId,@Param("houseGroupId") int houseGroupId);
	public void updateVisitorSkimHouseGroupInTime(@Param("visitorSkimHouseMap") java.util.Date currentTime,
			 @Param("visitorId") int visitorId,@Param("houseGroupId") int houseGroupId);
	public void saveVisitorSkimHouseGroup(VisitorSkimHouseGroup visitorSkimHouseGroup);
	
	public List<HouseGroupInfo> getSearchHouseGroupInfo(HouseGroupInfo houseGroupInfo);
	public int getSearchHouseGroupInfoCount(HouseGroupInfo houseGroupInfo);
	public List<HouseGroupInfo> getRecentOpenHouseGroupInfo(@Param("currentTime") Date currentTime);
	public List<HouseGroupInfo> getCurrentWeekdayOpenHouseGroupInfo(@Param("currentWeekday") Date currentWeekday,@Param("mondayOFWeek")Date mondayOFWeek);
	public String getGroupNameByHouseId(int houseId);
	
	
	/**
	 * 获取所有旅游购房的信息(分页)(客户报名使用)
	 * @param limitStr
	 * @return
	 */
	List<HouseGroupInfo> getAllHouseGroupInfoCus(Map<String, Object> map);
}
