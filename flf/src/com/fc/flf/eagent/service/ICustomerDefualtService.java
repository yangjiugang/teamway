package com.fc.flf.eagent.service;

import java.util.List;
import java.util.Map;

import com.fc.flf.common.domain.CustomerEduInfo;
import com.fc.flf.common.domain.CustomerFamilyInfo;
import com.fc.flf.common.domain.CustomerInfoDetail;
import com.fc.flf.common.domain.CustomerInterests;
import com.fc.flf.common.domain.EventBuyHouseOrder;
import com.fc.flf.common.domain.EventInfo;
import com.fc.flf.common.domain.HouseDiscuss;
import com.fc.flf.common.domain.HouseGroupCustomer;
import com.fc.flf.common.domain.HouseInfo;
import com.fc.flf.common.domain.UserInfoDetail;
import com.fc.flf.common.domain.UserMsg;
import com.fc.flf.common.domain.VisitorSkimUser;
import com.fc.flf.common.util.Page;

public interface ICustomerDefualtService {
	/**
	 * 根据userID查询客户的组合信息
	 * 
	 * @param customerRelationship
	 * @return list
	 */
	public List<UserInfoDetail> queryCusInUser(Map<String, Object> map);

	/**
	 * 根据客户ID查询客户组合信息
	 * 
	 * @param customerRelationship
	 * @return list
	 */
	public CustomerInfoDetail queryCusInCus(int cusId);

	/**
	 * 查询客户的详细信息
	 * 
	 * @param cusId
	 * @return list
	 */
	public CustomerInfoDetail queryCusForCus(int cusId);

	/**
	 * 查询客户的教育信息
	 * 
	 * @param customerInfoDetail
	 * @return list
	 */
	public CustomerEduInfo queryEduForCus(int cusId);

	/**
	 * 查询客户的兴趣爱好跟置业信息
	 * 
	 * @param customerInfoDetail
	 * @return list
	 */
	public CustomerInterests queryIntereForCus(int cusId);

	/**
	 * 查询客户家庭信息
	 * 
	 * @param customerInfoDetail
	 * @return list
	 */
	public List<CustomerFamilyInfo> queryFamInfoForCus(int cusId);

	/**
	 * 喊价次数
	 * 
	 * @param cusId
	 * @return int
	 */
	public int queryCountPrice(int cusId);

	/**
	 * 活动次数 看房次数
	 * 
	 * @param cusId
	 * @return int
	 */
	public int queryCountEvent(Map<String, Object> map);

	/**
	 * 参团次数
	 * 
	 * @param cisId
	 * @return
	 */
	public int queryCountGroup(int cisId);

	/**
	 * 评论次数
	 * 
	 * @param cusId
	 * @return int
	 */
	public int queryCountDiscuss(int cusId);

	/**
	 * 收藏楼盘
	 * 
	 * @param cusId
	 * @return int
	 */
	public int queryCountCollect(int cusId);

	/**
	 * 关注楼盘
	 * 
	 * @param cusId
	 * @return int
	 */
	public int queryCountSkim(int cusId);

	/**
	 * 订单数数
	 * 
	 * @param cusId
	 * @return int
	 */
	public int queryCountOrder(int cusId);

	/**
	 * 插入用户交流信息
	 * 
	 * @param msg
	 */
	public void insertUserMsg(UserMsg msg);

	/**
	 * 下过单的客户
	 * 
	 * @param map
	 * @return List
	 */
	public List<CustomerInfoDetail> queryOrderCus(Map<String, Object> map);

	/**
	 * 看过放参加过活动的客户
	 * @param map
	 * @return List
	 */
	public List<CustomerInfoDetail> qerutEventForUser(Map<String, Object> map);
	
	/**
	 * 差价过购房团的客户
	 * @param map
	 * @return List
	 */
	public List<CustomerInfoDetail> queryGroupForUser(Map<String, Object> map);
	
	/**
	 * 评论过的客户
	 * @param map
	 * @return List
	 */
	public List<CustomerInfoDetail> qeruyDiscuss(Map<String, Object> map);
	
	/**
	 * 某客户的评论记录
	 * 
	 * @param map
	 * @return
	 */
	public List<HouseDiscuss> queryDiscussForCus(Map<String, Object> map);

	/**
	 * 某客户的活动记录
	 * 
	 * @param map
	 * @return list
	 */
	public List<EventInfo> queryEventForCus(Map<String, Object> map);

	/**
	 * 某客户参加购房团记录
	 * 
	 * @param cusId
	 * @return
	 */
	public List<HouseGroupCustomer> queryGruopForCus(Map<String, Object> map);
	
	/**
	 * 根据userID查询客户的组合信息
	 * @param customerRelationship
	 * @return
	 */
	public List<CustomerInfoDetail> queryCustomerInUser(CustomerInfoDetail customerInfoDetail);
	
	/**
	 * 某客户的购房订单记录
	 * @param cusId
	 * @return
	 */
	public List<EventBuyHouseOrder> queryOrderForCus(int cusId);
	/**
	 * 易介宝首页（最近成交榜）查询event_buy_house_order
	 * @return
	 */
	public List<EventBuyHouseOrder> findBuyHouseOrder();
	/**
	 * 查询最近到访客户 
	 * @param userId
	 * @param customerId
	 * @return
	 */
	public List<VisitorSkimUser> findVisitorSkimUser() throws Exception;
	/**
	 * 根据UserID查询客户来访，如果是当前蜂蜜的客户查询customer_info_detail，
	 * 否则查询customer_info表
	 * @param userId
	 * @return
	 */
	public List<VisitorSkimUser> findVisitorSkimUserByUserId()throws Exception;
	/**
	 * 查询最近未联系的客户
	 * @return
	 * @throws Exception
	 */
	public List<CustomerInfoDetail> findCustomerByNoContact()throws Exception;
	/**
	 * 蜂蜜推荐的楼盘
	 * @return
	 */
	public List<HouseInfo> findRecommendHouse(Page page) throws Exception;
	/**
	 * 蜂蜜推荐楼盘记录数
	 * @param page
	 * @return
	 */
	public int findRecommendHouseCount() throws Exception;
	
}
