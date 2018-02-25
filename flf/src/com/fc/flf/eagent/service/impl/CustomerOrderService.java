package com.fc.flf.eagent.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fc.flf.common.domain.EventBuyHouseOrder;
import com.fc.flf.common.domain.EventInfo;
import com.fc.flf.common.domain.HouseGroupInfo;
import com.fc.flf.common.util.CommonUtil;
import com.fc.flf.common.util.Page;
import com.fc.flf.common.util.SessionInfo;
import com.fc.flf.eagent.mapper.ICustomerOrderMapper;
import com.fc.flf.eagent.service.ICustomerOrderService;

@Service
public class CustomerOrderService implements ICustomerOrderService {

	@Autowired
	private ICustomerOrderMapper customerOrderMapper;
	
	public List<EventBuyHouseOrder> findOrderByUserId(Page page) throws Exception {
		int userId = SessionInfo.getVisitorId(CommonUtil.getRequest());
		page.setRowCount(getMyBuyHouseCount());
		return customerOrderMapper.findOrderByUserId(userId, page.getLimit());
	}
	
	@Override
	public int getMyBuyHouseCount() throws Exception {
		int userId = SessionInfo.getVisitorId(CommonUtil.getRequest());
		return customerOrderMapper.getMyBuyHouseCount(userId);
	}
	
	@Override
	public List<EventInfo> findViewHouseOrder(Page page,int type) throws Exception {
		int userId = SessionInfo.getVisitorId(CommonUtil.getRequest());
		page.setRowCount(findViewHouseOrderCount(type));
		return customerOrderMapper.findViewHouseOrder(userId, page.getLimit(),type);
	}
	
	@Override
	public int findViewHouseOrderCount(int type) throws Exception {
		int userId = SessionInfo.getVisitorId(CommonUtil.getRequest());
		return customerOrderMapper.findViewHouseOrderCount(userId,type);
	}
	
	@Override
	public List<HouseGroupInfo> findHouseGroupByUserId(Page page) throws Exception {
		int userId = SessionInfo.getVisitorId(CommonUtil.getRequest());
		page.setRowCount(findHouseGroupCount());
		return customerOrderMapper.findHouseGroupByUserId(userId, page.getLimit());
	}
	
	@Override
	public int findHouseGroupCount() throws Exception {
		int userId = SessionInfo.getVisitorId(CommonUtil.getRequest());
		return customerOrderMapper.findHouseGroupCount(userId);
	}
}
