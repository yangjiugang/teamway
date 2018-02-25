package com.fc.flf.eagent.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.fc.flf.common.domain.EventBuyHouseOrder;
import com.fc.flf.common.domain.EventInfo;
import com.fc.flf.common.domain.HouseGroupInfo;

public interface ICustomerOrderMapper {

	/**
	 * 我的购房订单
	 * @param userId
	 * @param limitValue
	 * @return
	 */
	public List<EventBuyHouseOrder> findOrderByUserId(@Param("userId")int userId,
													@Param("limitValue")String limitValue);
	/**
	 * 我的购房订单总记录
	 * @param userId
	 * @return
	 */
	public int getMyBuyHouseCount(int userId);
	/**
	 * 我的看房订单
	 * @param userId
	 * @param limitValue
	 * @return
	 */
	public List<EventInfo> findViewHouseOrder(@Param("userId")int userId,
											@Param("limitValue")String limitValue,
											@Param("type") int type);
	/**
	 * 我的看房订单记录
	 * @param userId
	 * @return
	 */
	public int findViewHouseOrderCount(@Param("userId")int userId,@Param("type")int type);
	/**
	 * 我的参团订单
	 * @param userId
	 * @param limitValue
	 * @return
	 */
	public List<HouseGroupInfo> findHouseGroupByUserId(@Param("userId")int userId,
			   										  @Param("limitValue")String limitValue);
	
	public int findHouseGroupCount(int userId);

}
