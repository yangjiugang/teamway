package com.fc.flf.fparty.service;

import java.util.List;
import java.util.Map;

import com.fc.flf.common.domain.CustomerInfo;
import com.fc.flf.common.domain.EventInfo;
import com.fc.flf.common.domain.HouseGroupCustomer;
import com.fc.flf.common.util.Page;

public interface IEventInfoService {

	/**
	 * 我关注的活动
	 * 
	 * @param page
	 *            分页的参数
	 * @param customer
	 *            客户
	 * @return 活动的集合
	 */
	public List<EventInfo> attentionActivity(Page page,
			CustomerInfo customer);

	public int getAttenActivityCount(CustomerInfo customer);
	
	/**
	 * 分页查询没有过期的所有活动
	 * @param page
	 * @return
	 * @author 龚红军 add 2012-2-10
	 */
	public List<EventInfo> fingAllEventInfo(Page page);

	/**
	 * 我报名的活动
	 * 
	 * @param page
	 * @param customer
	 * @return
	 */
	public List<EventInfo> applyActivity(Page page, CustomerInfo customer);

	public int getApplyActivityCount(CustomerInfo customer);

	/**
	 * 我参加的活动
	 * 
	 * @param page
	 * @param customer
	 * @return
	 */
	public List<EventInfo> joinActivity(Page page, CustomerInfo customer);

	public int getJoinActivityCount(CustomerInfo customer);

	/**
	 * 经纪人推荐的活动
	 * 
	 * @param page
	 * @param customer
	 * @return
	 */
	public List<EventInfo> recommendActivity(Page page,
			CustomerInfo customer);

	public int getRecommendActivityCount(CustomerInfo customer);
	/**
	 * 最近会所活动公告
	 * @return
	 */
	public List<EventInfo> findFutrueEventInfo();
	
	/**
	 * 查询会所活动列表
	 * @return
	 * @author 覃启轩 add 2012-02-02
	 */
	public List<EventInfo> queryEventInfoList(String eventName, Page page);
	
	/**
	 * 查询客户看房订单
	 * @return
	 * @author 覃启轩 add 2012-02-06
	 */
	List<EventInfo> querySeeHouseOrder(int cusId, Page page);
	
	/**
	 * 查询客户看房订单总数
	 * @return
	 * @author 覃启轩 add 2012-02-06
	 */
	int querySeeHouseOrderCount(int cusId);
	
	/**
	 * 查询客户活动订单
	 * @return
	 * @author 覃启轩 add 2012-02-07
	 */
	List<EventInfo> queryActivityOrder(int cusId, Page page);
	
	/**
	 * 查询客户活动订单总数
	 * @return
	 * @author 覃启轩 add 2012-02-07
	 */
	int queryActivityOrderCount(int cusId);
	
	/**
	 * 新增客户活动订单
	 * @return
	 * @author 覃启轩 add 2012-02-08
	 */
	int insertActivityOrder(HouseGroupCustomer houseGroup);
	

	/**
	 * 查询全部订单
	 * @return
	 * @author 覃启轩 add 2012-02-10
	 */
	List<EventInfo> queryAllOrderList(Map<String, Object> map);
	
	/**
	 * 查询全部订单总记录数
	 * @return
	 * @author 覃启轩 add 2012-02-10
	 */
	int queryAllOrderCount(int userId);
	
	/**
	 * 删除看房活动订单
	 * @return
	 * @author 覃启轩 add 2012-02-10
	 */
	int deleteSeeHouseOrder(int orderId);
	
}
