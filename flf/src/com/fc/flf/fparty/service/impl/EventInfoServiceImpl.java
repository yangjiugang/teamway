package com.fc.flf.fparty.service.impl;

import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.flf.common.domain.CustomerInfo;
import com.fc.flf.common.domain.EventInfo;
import com.fc.flf.common.domain.HouseGroupCustomer;
import com.fc.flf.common.util.DateTools;
import com.fc.flf.common.util.Page;
import com.fc.flf.fparty.mapper.IEventInfoMapper;
import com.fc.flf.fparty.service.IEventInfoService;

@Service
public class EventInfoServiceImpl implements IEventInfoService {

	@Autowired
	private IEventInfoMapper eventInfoMapper;

	/**
	 * 我关注的活动
	 * 
	 * @param page
	 * @param customer
	 *            客户
	 * @return 活动的集合
	 */
	public List<EventInfo> attentionActivity(Page page,
			CustomerInfo customer) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customerId", customer.getCustomerId());
		map.put("limit", page.getLimit());
		List<EventInfo> list = eventInfoMapper.attentionActivity(map); // 得到我关注的活动信息
		return list;
	}

	public int getAttenActivityCount(CustomerInfo customer) {
		return eventInfoMapper.getAttentionCount(customer.getCustomerId());
	}

	/**
	 * 我报名的活动
	 * 
	 * @param page
	 * @param customer
	 * @return
	 */
	public List<EventInfo> applyActivity(Page page, CustomerInfo customer) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customerId", customer.getCustomerId());
		map.put("limit", page.getLimit());
		List<EventInfo> list = eventInfoMapper.applyActivity(map);
		return list;
	}

	public int getApplyActivityCount(CustomerInfo customer) {
		return eventInfoMapper.getApplyCount(customer.getCustomerId());
	}
	
	/**
	 * 分页查询没有过期的所有活动
	 * @param page
	 * @return
	 * @author 龚红军 add 2012-2-10
	 */
	public List<EventInfo> fingAllEventInfo(Page page) {
		java.util.Date date=new java.util.Date();
		int eventCount=eventInfoMapper.findEventInfoCount(date);
		page.setRowCount(eventCount);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("limit", page.getLimit());
		map.put("now", date);
		List<EventInfo> listEventInfo=eventInfoMapper.findEventInfoList(map);
		return listEventInfo;		
	}

	/**
	 * 我参加的活动
	 * 
	 * @param page
	 * @param customer
	 * @return
	 */
	public List<EventInfo> joinActivity(Page page, CustomerInfo customer) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customerId", customer.getCustomerId());
		map.put("limit", page.getLimit());
		List<EventInfo> list = eventInfoMapper.joinActivity(map);
		return list;

	}

	public int getJoinActivityCount(CustomerInfo customer) {
		return eventInfoMapper.getJoinCount(customer.getCustomerId());
	}

	/**
	 * 经纪人推荐的活动
	 * 
	 * @param page
	 * @param customer
	 * @return
	 */
	public List<EventInfo> recommendActivity(Page page,
			CustomerInfo customer) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customerId", customer.getCustomerId());
		map.put("limit", page.getLimit());
		List<EventInfo> list = eventInfoMapper.recommendActivity(map);
		return list;
	}

	
	public int getRecommendActivityCount(CustomerInfo customer) {
		return eventInfoMapper.getRecommendCount(customer.getCustomerId());
	}
	
	/**
	 * 最近会所活动公告
	 * @return
	 */
	@Transactional(readOnly = true)
	public List<EventInfo> findFutrueEventInfo() {
		Date currentTime=new Date(System.currentTimeMillis());
		List<EventInfo> eventInfos = eventInfoMapper.selectFutrueEvent(currentTime);
		return eventInfos;
	}
	
	/**
	 * 查询会所活动列表
	 * @return
	 * @author 覃启轩 add 2012-02-02
	 */
	@Transactional(readOnly = true)
	public List<EventInfo> queryEventInfoList(String eventName,Page page) {
		Map<String, Object> map = new HashMap<String, Object>();
		Timestamp currentTime = DateTools.getCurrDateTime();
		int iCount = queryEventInfoCount(eventName);
		page.setPageSize(4);
		page.setRowCount(iCount);
		map.put("currentTime", currentTime);
		map.put("limit", page.getLimit());
		if(null != eventName){
			try {
				map.put("eventName", new String(eventName.getBytes("iso8859-1"),"UTF-8"));
				return eventInfoMapper.queryEventInfoList(map);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		map.put("eventName", new String());
		return eventInfoMapper.queryEventInfoList(map);
	}
	
	/**
	 * 查询会所活动总记录数
	 * @return
	 * @author 覃启轩 add 2012-02-09
	 */
	@Transactional(readOnly = true)
	public int queryEventInfoCount(String eventName) {
		Timestamp currentTime = DateTools.getCurrDateTime();
		if(null != eventName){
			try {
				return eventInfoMapper.queryEventInfoCount(currentTime, new String(eventName.getBytes("iso8859-1"),"UTF-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return eventInfoMapper.queryEventInfoCount(currentTime, eventName);
	}
	
	

	/**
	 * 查询客户看房订单
	 * @return
	 * @author 覃启轩 add 2012-02-02
	 */
	public List<EventInfo> querySeeHouseOrder(int cusId, Page page) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cusId", cusId);
		map.put("limit", page.getLimit());
		return eventInfoMapper.querySeeHouseOrder(map);
	}
	
	
	/**
	 * 查询客户看房订单总数
	 * @return
	 * @author 覃启轩 add 2012-02-02
	 */
	public int querySeeHouseOrderCount(int cusId) {
		return eventInfoMapper.querySeeHouseOrderCount(cusId);
	}
	
	/**
	 * 查询活动看房订单
	 * @return
	 * @author 覃启轩 add 2012-02-07
	 */
	public List<EventInfo> queryActivityOrder(int cusId, Page page) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cusId", cusId);
		map.put("limit", page.getLimit());
		return eventInfoMapper.queryActivityOrder(map);
	}
	
	
	/**
	 * 查询客户活动订单总数
	 * @return
	 * @author 覃启轩 add 2012-02-07
	 */
	public int queryActivityOrderCount(int cusId) {
		return eventInfoMapper.queryActivityOrderCount(cusId);
	}
	
	/**
	 * 新增客户活动订单
	 * @return
	 * @author 覃启轩 add 2012-02-08
	 */
	public int insertActivityOrder(HouseGroupCustomer houseGroup) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("eventId", houseGroup.getEventId());
		map.put("cusId", houseGroup.getCusId());
		map.put("customerId", houseGroup.getCustomerId());
		map.put("customerName", houseGroup.getCustomerName());
		map.put("visitorType", houseGroup.getCustomerType());
		map.put("createAt", houseGroup.getJoinTime());
		// 默认值
		map.put("isCheckin", 0);
		map.put("isRegister", 1);
		map.put("valuation", "");
		map.put("valuation1", "");
		map.put("valuation2", "");
		map.put("valuation3", "");
		map.put("valuation4", "");
		return eventInfoMapper.insertActivityOrder(map);
	}
	
	/**
	 * 查询全部订单
	 * @return
	 * @author 覃启轩 add 2012-02-10
	 */
	public List<EventInfo> queryAllOrderList(Map<String, Object> map) {
		return eventInfoMapper.queryAllOrderList(map);
	}
	
	/**
	 * 查询全部订单总记录数
	 * @return
	 * @author 覃启轩 add 2012-02-10
	 */
	public int queryAllOrderCount(int userId) {
		return eventInfoMapper.queryAllOrderCount(userId);
	}
	
	/**
	 * 删除看房活动订单
	 * @return
	 * @author 覃启轩 add 2012-02-10
	 */
	public int deleteSeeHouseOrder(int orderId) {
		return eventInfoMapper.deleteSeeHouseOrder(orderId);
	}
}
