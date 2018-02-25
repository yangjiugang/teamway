package com.fc.flf.eagent.service;

import java.util.List;

import com.fc.flf.common.domain.EventBuyHouseOrder;
import com.fc.flf.common.domain.EventInfo;
import com.fc.flf.common.domain.HouseGroupInfo;
import com.fc.flf.common.util.Page;

public interface ICustomerOrderService {

	/**
	 * 我的购房订单
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<EventBuyHouseOrder> findOrderByUserId(Page page) throws Exception;
	/**
	 * 我的购房订单记录
	 * @return
	 * @throws Exception
	 */
	public int getMyBuyHouseCount() throws Exception;
	/**
	 * 我的看房订单
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<EventInfo> findViewHouseOrder(Page page,int type) throws Exception;
	/**
	 * 我的看房订单记录
	 * @return
	 * @throws Exception
	 */
	public int findViewHouseOrderCount(int type) throws Exception;
	/**
	 * 我的参团订单
	 * @param page
	 * @return
	 */
	public List<HouseGroupInfo> findHouseGroupByUserId(Page page)throws Exception;
	/**
	 * 我的参团订单记录
	 * @param userId
	 * @return
	 */
	public int findHouseGroupCount()throws Exception;
}
