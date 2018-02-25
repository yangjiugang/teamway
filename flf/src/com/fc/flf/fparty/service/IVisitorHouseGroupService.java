package com.fc.flf.fparty.service;

import java.util.List;
import java.util.Map;

import com.fc.flf.common.domain.CustomerInfo;
import com.fc.flf.common.domain.HouseGroupInfo;
import com.fc.flf.common.domain.UserInfo;
import com.fc.flf.common.util.Page;

public interface IVisitorHouseGroupService {

	/**
	 * 到得我关注的所有房团
	 * 
	 * @param customer
	 *            客户
	 * @return 关注的所有房团
	 */

	public List<HouseGroupInfo> listHouseGroupInfo(Page page,
			CustomerInfo customer);

	public int getHouseGroupCount(CustomerInfo customer);

	/**
	 * 到得我收藏的所有房团
	 * 
	 * @param customer
	 *            客户
	 * @return 收藏的所有房团
	 */
	public List<HouseGroupInfo> listCollectHouseGroupInfo(Page page,
			CustomerInfo customer);

	public int getCollectHouseGroupCount(CustomerInfo customer);

	/**
	 * 到得我参加的所有房团
	 * 
	 * @param page
	 * @param customer
	 * @return
	 */
	public List<HouseGroupInfo> listJoinHouseGroupInfo(Page page,
			CustomerInfo customer);

	public int getJoinHouseGroupCount(CustomerInfo customer);

	/**
	 * 经纪人推荐的旅游房团
	 * 
	 * @param page
	 * @param customer
	 * @return
	 */
	public List<HouseGroupInfo> listRecommendHouseGroupInfo(Page page,
			CustomerInfo customer);

	public int getRecommendHouseGroupCount(CustomerInfo customer);

	/**
	 * 经纪人收藏的旅游房团
	 * 
	 * @param page
	 * @param customer
	 * @return
	 */
	public List<HouseGroupInfo> listUserCollectHouseGroupInfo(Page page,
			UserInfo userInfo);

	public int getUserCollectHouseGroupCount(UserInfo userInfo);

	/**
	 * 新增旅游购房团订单
	 * 
	 * @param map
	 * @return 成功or失败
	 * @author 覃启轩 add 2012-02-09
	 */
	int insertHouseGroupCusTomer(Map<String, Object> map);

	/**
	 * 新增本地看房订单
	 * 
	 * @param map
	 * @return 成功or失败
	 * @author 覃启轩 add 2012-02-09
	 */
	int insertSeeHouseOrder(Map<String, Object> map);
	
	/**
	 * 新增购房订单
	 * 
	 * @param map
	 * @return 成功or失败
	 * @author 覃启轩 add 2012-02-10
	 */
	int insertBuyHouseOrder(Map<String, Object> map);

	/**
	 * 查询客户旅游购房团订单
	 * 
	 * @param cusId
	 * @param page
	 * @return
	 * @author 覃启轩 add 2012-02-07
	 */
	List<HouseGroupInfo> queryJoinHouseGroup(int cusId, Page page,
			String queryObj);

	/**
	 * 查询客户旅游购房团订单总数
	 * 
	 * @param cusId
	 * @return
	 * @author 覃启轩 add 2012-02-07
	 */
	int queryJoinHouseGroupCount(int cusId, String queryObj);
	
	/**
	 * 删除旅游购房订单
	 * 
	 * @param cusId
	 * @return
	 * @author 覃启轩 add 2012-02-10
	 */
	int deleteHouseGroupOrder(int orderId);

}
