package com.fc.flf.fparty.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.fc.flf.common.domain.HouseGroupInfo;

public interface IVisitorCollectHouseGroupMapper {
	public List<HouseGroupInfo> listCollectHouseGroup(Map<String, Object> map);

	public int getCount(int customerId);

	public List<HouseGroupInfo> listJoinHouseGroup(Map<String, Object> map);

	public int getJoinCount(int customerId);

	public List<HouseGroupInfo> listAgentRecommendHouseGroup(
			Map<String, Object> map);

	public int getRecommendCount(int customerId);

	public List<HouseGroupInfo> userCollectGroupHouse(Map<String, Object> map);

	public int getUserCollectGroupHouse(int userId);

	/**
	 * 新增旅游购房团订单
	 * 
	 * @param map
	 * @return
	 * @author 覃启轩 add 2012-02-02
	 */
	int insertHouseGroupCusTomer(Map<String, Object> map);

	/**
	 * 新增本地看房订单
	 * 
	 * @param map
	 * @return
	 * @author 覃启轩 add 2012-02-02
	 */
	int insertSeeHouseOrder(Map<String, Object> map);
	
	/**
	 * 新增本地看房订单
	 * 
	 * @param map
	 * @return
	 * @author 覃启轩 add 2012-02-10
	 */
	int insertBuyHouseOrder(Map<String, Object> map);

	/**
	 * 查询客户旅游购房团订单
	 * 
	 * @param map
	 * @return
	 * @author 覃启轩 add 2012-02-07
	 */
	List<HouseGroupInfo> queryJoinHouseGroup(Map<String, Object> map);

	/**
	 * 查询客户旅游购房团订单总数
	 * 
	 * @param cusId
	 * @return
	 * @author 覃启轩 add 2012-02-07
	 */
	int queryJoinHouseGroupCount(@Param("cusId") int cusId,
			@Param("queryObj") String queryObj);
	
	/**
	 * 删除旅游购房订单
	 * 
	 * @param cusId
	 * @return
	 * @author 覃启轩 add 2012-02-07
	 */
	int deleteHouseGroupOrder(@Param("orderId") int orderId);

}
