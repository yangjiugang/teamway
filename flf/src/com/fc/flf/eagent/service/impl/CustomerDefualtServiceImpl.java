package com.fc.flf.eagent.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
import com.fc.flf.common.util.CommonUtil;
import com.fc.flf.common.util.Page;
import com.fc.flf.common.util.SessionInfo;
import com.fc.flf.eagent.mapper.ICustomerDefualtMapper;
import com.fc.flf.eagent.service.ICustomerDefualtService;

@Service
public class CustomerDefualtServiceImpl implements ICustomerDefualtService {

	@Autowired
	private ICustomerDefualtMapper mapper;

	public List<UserInfoDetail> queryCusInUser(Map<String, Object> map) {
		List<UserInfoDetail> list = mapper.queryCusInUser(map);
		return list;
	}

	@Override
	public CustomerInfoDetail queryCusForCus(int cusId) {
		CustomerInfoDetail customerInfoDetail = mapper.queryCusForCus(cusId);
		return customerInfoDetail;
	}

	@Override
	public CustomerEduInfo queryEduForCus(int cusId) {
		CustomerEduInfo customerEduInfo = mapper.queryEduForCus(cusId);
		return customerEduInfo;
	}

	@Override
	public CustomerInterests queryIntereForCus(int cusId) {
		CustomerInterests customerInterests = mapper.queryIntereForCus(cusId);
		return customerInterests;
	}

	@Override
	public List<CustomerFamilyInfo> queryFamInfoForCus(int cusId) {
		List<CustomerFamilyInfo> list = mapper.queryFamInfoForCus(cusId);
		return list;
	}

	@Override
	public CustomerInfoDetail queryCusInCus(int cusId) {
		CustomerInfoDetail customerInfoDetail = mapper.queryCusInCus(cusId);
		return customerInfoDetail;
	}

	@Override
	public int queryCountPrice(int cusId) {
		return mapper.queryCountPrice(cusId);
	}

	@Override
	public int queryCountEvent(Map<String, Object> map) {
		return mapper.queryCountEvent(map);
	}

	public int queryCountGroup(int cisId) {
		return mapper.queryCountGroup(cisId);
	}

	@Override
	public int queryCountDiscuss(int cusId) {
		return mapper.queryCountDiscuss(cusId);
	}

	@Override
	public int queryCountCollect(int cusId) {
		return mapper.queryCountCollect(cusId);
	}

	@Override
	public int queryCountSkim(int cusId) {
		return mapper.queryCountSkim(cusId);
	}

	@Override
	public int queryCountOrder(int cusId) {
		return mapper.queryCountOrder(cusId);
	}

	@Override
	public void insertUserMsg(UserMsg msg) {
		mapper.insertUserMsg(msg);
	}

	@Override
	public List<CustomerInfoDetail> queryOrderCus(Map<String, Object> map) {
		return mapper.queryOrderCus(map);
	}

	@Override
	public List<HouseDiscuss> queryDiscussForCus(Map<String, Object> map) {
		return mapper.queryDiscussForCus(map);
	}
	
	@Override
	public List<EventInfo> queryEventForCus(Map<String, Object> map) {
		return mapper.queryEventForCus(map);
	}
	
	public List<HouseGroupCustomer> queryGruopForCus(Map<String, Object> map) {
		return mapper.queryGruopForCus(map);
	}

	@Override
	public List<CustomerInfoDetail> qerutEventForUser(
			Map<String, Object> map) {
		return mapper.qerutEventForUser(map);
	}

	@Override
	public List<CustomerInfoDetail> queryGroupForUser(
			Map<String, Object> map) {
		return mapper.queryGroupForUser(map);
	}

	@Override
	public List<CustomerInfoDetail> qeruyDiscuss(Map<String, Object> map) {
		return mapper.qeruyDiscuss(map);
	}

	@Override
	public List<CustomerInfoDetail> queryCustomerInUser(
			CustomerInfoDetail customerInfoDetail) {
		return mapper.queryCustomerInUser(customerInfoDetail);
	}

	@Override
	public List<EventBuyHouseOrder> queryOrderForCus(int cusId) {
		return mapper.queryOrderForCus(cusId);
	}
	@Override
	public List<EventBuyHouseOrder> findBuyHouseOrder() {
		return mapper.findBuyHouseOrder();
	}
	@Override
	public List<VisitorSkimUser> findVisitorSkimUser() throws Exception {
		int userId = SessionInfo.getVisitorId(CommonUtil.getRequest());
		List<VisitorSkimUser> list = findVisitorSkimUserByUserId();
		List<VisitorSkimUser> list_new = new ArrayList<VisitorSkimUser>();
		for(VisitorSkimUser visitorSkimUser : list){
			Object obj = mapper.findCustomerInfoDetail(userId, visitorSkimUser.getVisitorId());
			if(obj != null){// 如果是当前蜂蜜的客户
				visitorSkimUser.setObject(obj);
				visitorSkimUser.setCurrent(1); // 1 表示是,0 表示否
			}else{			// 不是当前蜂蜜的客户
				visitorSkimUser.setCurrent(0);
				visitorSkimUser.setObject(mapper.findCustomerInfoCId(userId, visitorSkimUser.getVisitorId()));
			}
			list_new.add(visitorSkimUser);
		}
		return list_new;
	}
	@Override
	public List<VisitorSkimUser> findVisitorSkimUserByUserId() throws Exception {
		int userId = SessionInfo.getVisitorId(CommonUtil.getRequest());
		return mapper.findVisitorSkimUserByUserId(userId);
	}
	
	@Override
	public List<CustomerInfoDetail> findCustomerByNoContact() throws Exception {
		int userId = SessionInfo.getVisitorId(CommonUtil.getRequest());
		return mapper.findCustomerByNoContact(userId);
	}
	
	@Override
	public List<HouseInfo> findRecommendHouse(Page page) throws Exception {
		int userId = SessionInfo.getVisitorId(CommonUtil.getRequest());
		page.setRowCount(findRecommendHouseCount());
		return mapper.findRecommendHouse(userId, page.getLimit());
	}
	@Override
	public int findRecommendHouseCount() throws Exception {
		int userId = SessionInfo.getVisitorId(CommonUtil.getRequest());
		return mapper.findRecommendHouseCount(userId);
	}

}
