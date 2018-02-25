/**
 * Create on 2012.01.07
 * @author zhenglh
 * Account For : house_info Mapper
 */
package com.fc.flf.portal.mapper;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.fc.flf.common.domain.EventInfo;
import com.fc.flf.common.domain.HomeShow;
import com.fc.flf.common.domain.HouseInfo;
import com.fc.flf.common.domain.VisitorSkimHouse;

public interface HouseInfoMapper {
	
	public HouseInfo findHouseInfoById(int houseId);
	
	public List<HomeShow> findHomeInfoNewHouseList();
	
	public List<HouseInfo> findHouseInfoWithDetail(@Param("currentTime") Date currentTime);

	public void saveVisitorSkimHouse(VisitorSkimHouse visitorSkimHouse);
	
	public void updateHouseAttenttion(int houseId);
	
	public List<HouseInfo> findCollectHouse(int visitorId);
	/**
	 * 查询新楼专卖（最新楼盘首页）
	 * @param limitValue
	 * @return
	 */
	public List<HouseInfo> findNewHouseList(@Param("limitValue") String limitValue);
	
	public int getTotalCount();
	/**
	 * 精确查询
	 * @param houseInfo
	 * @return
	 */
	public List<HouseInfo> findHouseInfoAccurate(HouseInfo houseInfo);
	/**
	 * 精确查询记录数
	 * @param houseInfo
	 * @return
	 */
	public int getHouseInfoAccurateCount(HouseInfo houseInfo);
	
	public List<HouseInfo> findRecentSignHouseInfo(@Param("currentTime") Date currentTime);
	/**
	 * 查询登录用户访问者 浏览HouseInfo记录
	 * @param visitorId
	 * @return
	 */
	public List<HouseInfo> findBrowserRecord(int visitorId);
	/**
	 * 根据访问者ID、HouseId 查询访问者记录
	 * @param visitorId
	 * @param houseId
	 * @return
	 */
	public VisitorSkimHouse findVisitorSkimHouse(@Param("visitorId") int visitorId,@Param("houseId") int houseId);
	/**
	 * 如果同一个访问者访问两次同一个House, 则更新浏览记录的checkin_time
	 * @param currentTime
	 */
	public void updateVisitorSkimHouseInTime(@Param("visitorSkimHouseMap") java.util.Date currentTime,
											 @Param("visitorId") int visitorId,@Param("houseId") int houseId);
	/**
	 * 更新访问者关闭时间
	 * @param currentTime
	 */
	public void updateVisitorSkimHouseOutTime(Date currentTime,int visitorId,int houseId);
	/**
	 * 房秘书推荐榜
	 * @return
	 */
	public List<HouseInfo> attentionHouseInfos();
	/**
	 * 大家关注
	 * @return
	 */
	public List<HouseInfo> everyoneAttention();
	/**
	 * 会所本周活动
	 * @return
	 */
	public List<EventInfo> weekActivity(@Param("date")String date);
	/**
	 * 房秘书关注榜
	 */
	public List<HouseInfo> fangMishuAttention();
	
	/**
	 * 查询看房团
	 * @param houseInfo
	 * @return
	 * @author 覃启轩 add 2012-2-9
	 */
	List<HouseInfo> getSeeHouseAccurate(HouseInfo houseInfo);
	
	/**
	 * 查询看房团记录数
	 * @param houseInfo
	 * @return
	 * @author 覃启轩 add 2012-2-9
	 */
	int getSeeHouseAccurateCount(HouseInfo houseInfo);
}
