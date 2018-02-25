package com.fc.flf.fparty.mapper;

import java.util.Date;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.fc.flf.common.domain.EventInfo;


public interface IEventInfoMapper {
	/**
	 * 我关注的活动
	 * @param map 参数
	 * @return
	 */
	public List<EventInfo> attentionActivity(Map<String,Object> map);
	/**
	 * 关注活动的总条数
	 * @param cusid
	 * @return
	 */
	public int getAttentionCount(int customerId);
	
	/**
	 * 我报名的活动
	 * @param map
	 * @return
	 */
	public List<EventInfo> applyActivity(Map<String,Object> map);
    
	/**	
	 * 关注活动的总条数
	 * @param cusid
	 * @return
	 */
	public int getApplyCount(int customerId);
	
	/**
	 * 我参加的活动
	 * @param map
	 * @return
	 */
	public List<EventInfo> joinActivity(Map<String,Object> map);
    
	/**	
	 * 参加活动的总条数
	 * @param cusid
	 * @return
	 */
	public int getJoinCount(int customerId);
	
	/**
	 * 经济人推荐的活动
	 * @param map
	 * @return
	 */
	public List<EventInfo> recommendActivity(Map<String,Object> map);
    
	/**	
	 * 经济人推荐活动的总条数
	 * @param cusid
	 * @return
	 */
	public int getRecommendCount(int customerId);
	
	/**
	 * 分页查询没有过期的活动
	 * @param map
	 * @return
	 * @author 龚红军 add 2012-2-10 
	 */
	public List<EventInfo> findEventInfoList(Map<String,Object> map);
	
	/**
	 * 分页查询没有过期的活动 总条数
	 * @param int
	 * @return
	 * @author 龚红军 add 2012-2-10 
	 */
	public int findEventInfoCount(Date now);
	
	
	public List<EventInfo> selectFutrueEvent(@Param("currentTime") Date currentTime);
	
	/**
	 * 根据ID获得活动
	 */
	public EventInfo getEventInfoById(int eventId);
	
	/**
	 * 查询会所活动列表
	 * @return
	 * @author 覃启轩 add 2012-02-02
	 */
	List<EventInfo> queryEventInfoList(Map<String, Object> map);
	
	/**
	 * 查询会所活动总记录数
	 * @return
	 * @author 覃启轩 add 2012-02-09
	 */
	int queryEventInfoCount(@Param("currentTime") Timestamp currentTime, @Param("eventName") String eventName);
	
	
	/**
	 * 查询客户看房订单
	 * @return
	 * @author 覃启轩 add 2012-02-06
	 */
	List<EventInfo> querySeeHouseOrder(Map<String, Object> map);
	
	/**
	 * 查询客户看房订单总数
	 * @return
	 * @author 覃启轩 add 2012-02-06
	 */
	int querySeeHouseOrderCount(@Param("cusId") int cusId);
	
	
	/**
	 * 查询活动看房订单
	 * @return
	 * @author 覃启轩 add 2012-02-07
	 */
	List<EventInfo> queryActivityOrder(Map<String, Object> map);
	
	/**
	 * 查询客户活动订单总数
	 * @return
	 * @author 覃启轩 add 2012-02-07
	 */
	int queryActivityOrderCount(@Param("cusId") int cusId);
	
	/**
	 * 新增客户活动订单
	 * @return
	 * @author 覃启轩 add 2012-02-08
	 */
	int insertActivityOrder(Map<String, Object> map);
	

	/**
	 * 查询全部订单
	 * @return
	 * @author 覃启轩 add 2012-02-10
	 */
	List<EventInfo> queryAllOrderList(Map<String, Object> map);
	
	/**
	 * 查询全部订单
	 * @return
	 * @author 覃启轩 add 2012-02-10
	 */
	int queryAllOrderCount(@Param("userId") int userId);
	
	/**
	 * 删除看房活动订单
	 * @return
	 * @author 覃启轩 add 2012-02-10
	 */
	int deleteSeeHouseOrder(@Param("orderId") int orderId);

}
