package com.fc.flf.fparty.service.impl;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fc.flf.common.domain.CustomerInfo;
import com.fc.flf.common.domain.HouseGroupInfo;
import com.fc.flf.common.domain.UserInfo;
import com.fc.flf.common.util.Page;
import com.fc.flf.fparty.mapper.IVisitorCollectHouseGroupMapper;
import com.fc.flf.fparty.mapper.IVisitorSkimHouseGroupMapper;
import com.fc.flf.fparty.service.IVisitorHouseGroupService;

@Service
public class VisitorHouseGroupServiceIpml implements IVisitorHouseGroupService {
	@Resource
	private IVisitorSkimHouseGroupMapper skimHouseGroupMapper;
	@Resource
	private IVisitorCollectHouseGroupMapper collectHouseGroupMapper;

	/**
	 * 我关注的房团 Param curPage 页数 param customer 客户的对象 return list 我关注的房团信息
	 * 
	 */
	public List<HouseGroupInfo> listHouseGroupInfo(Page page,
			CustomerInfo customer) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customerId", customer.getCustomerId());
		map.put("limit", page.getLimit());
		List<HouseGroupInfo> list = skimHouseGroupMapper.listHouseGroups(map);
		return list;
	}

	public int getHouseGroupCount(CustomerInfo customer) {
		return skimHouseGroupMapper.getCount(customer.getCustomerId());
	}

	/**
	 * 到得我收藏的所有房团
	 * 
	 * @param customer
	 *            客户
	 * @return 收藏的所有房团
	 */
	public List<HouseGroupInfo> listCollectHouseGroupInfo(Page page,
			CustomerInfo customer) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customerId", customer.getCustomerId());
		map.put("limit", page.getLimit());
		List<HouseGroupInfo> list = collectHouseGroupMapper
				.listCollectHouseGroup(map);
		return list;
	}

	public int getCollectHouseGroupCount(CustomerInfo customer) {
		return collectHouseGroupMapper.getCount(customer.getCustomerId());
	}

	/**
	 * 到得我参加的所有房团
	 * 
	 * @param page
	 * @param customer
	 * @return
	 */
	public List<HouseGroupInfo> listJoinHouseGroupInfo(Page page,
			CustomerInfo customer) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customerId", customer.getCustomerId());
		map.put("limit", page.getLimit());
		return collectHouseGroupMapper.listJoinHouseGroup(map);
	}

	public int getJoinHouseGroupCount(CustomerInfo customer) {
		return collectHouseGroupMapper.getJoinCount(customer.getCustomerId());
	}

	/**
	 * 经纪人推荐的旅游房团
	 * 
	 * @param page
	 * @param customer
	 * @return
	 */
	public List<HouseGroupInfo> listRecommendHouseGroupInfo(Page page,
			CustomerInfo customer) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customerId", customer.getCustomerId());
		map.put("limit", page.getLimit());
		return collectHouseGroupMapper.listAgentRecommendHouseGroup(map);
	}

	public int getRecommendHouseGroupCount(CustomerInfo customer) {
		return collectHouseGroupMapper.getRecommendCount(customer
				.getCustomerId());
	}

	/**
	 * 新增旅游购房团订单
	 * 
	 * @param map
	 * @return 成功or失败
	 * @author 覃启轩 add 2012-02-09
	 */
	public int insertHouseGroupCusTomer(Map<String, Object> map) {
		return collectHouseGroupMapper.insertHouseGroupCusTomer(map);
	}

	/**
	 * 新增本地看房订单
	 * 
	 * @param map
	 * @return 成功or失败
	 * @author 覃启轩 add 2012-02-09
	 */
	public int insertSeeHouseOrder(Map<String, Object> map) {
		return collectHouseGroupMapper.insertSeeHouseOrder(map);
	}
	
	/**
	 * 新增购房订单
	 * 
	 * @param map
	 * @return 成功or失败
	 * @author 覃启轩 add 2012-02-10
	 */
	public int insertBuyHouseOrder(Map<String, Object> map) {
		return collectHouseGroupMapper.insertBuyHouseOrder(map);
	}

	/**
	 * 经纪人收藏的旅游房团
	 * 
	 * @param page
	 * @param customer
	 * @return
	 */
	public List<HouseGroupInfo> listUserCollectHouseGroupInfo(Page page,
			UserInfo userInfo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userInfo.getUserId());
		map.put("limit", page.getLimit());
		return collectHouseGroupMapper.userCollectGroupHouse(map);
	}

	public int getUserCollectHouseGroupCount(UserInfo userInfo) {
		return collectHouseGroupMapper.getUserCollectGroupHouse(userInfo
				.getUserId());
	}

	/**
	 * 查询客户旅游购房团订单
	 * 
	 * @param cusId
	 * @param page
	 * @return
	 * @author 覃启轩 add 2012-02-07
	 */
	public List<HouseGroupInfo> queryJoinHouseGroup(int cusId, Page page,
			String queryObj) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cusId", cusId);
		map.put("limit", page.getLimit());
		try {
			if (null != queryObj) {
				String strQueryObj = new String(queryObj.getBytes("iso8859-1"),
						"utf-8");
				if ("请输入地区、线路等".equals(strQueryObj)) {

				} else {
					map.put("queryObj", strQueryObj);
				}
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return collectHouseGroupMapper.queryJoinHouseGroup(map);
	}

	/**
	 * 查询客户旅游购房团订单总数
	 * 
	 * @param cusId
	 * @return
	 * @author 覃启轩 add 2012-02-07
	 */
	public int queryJoinHouseGroupCount(int cusId, String queryObj) {
		String strQueryObj = null;
		try {
			if (null != queryObj) {
				if ("请输入地区、线路等".equals(queryObj)) {

				} else {
					strQueryObj = new String(queryObj.getBytes("iso8859-1"),
							"utf-8");
				}
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return collectHouseGroupMapper.queryJoinHouseGroupCount(cusId,
				strQueryObj);
	}
	
	/**
	 * 删除旅游购房订单
	 * 
	 * @param cusId
	 * @return
	 * @author 覃启轩 add 2012-02-07
	 */
	public int deleteHouseGroupOrder(int orderId) {
		return collectHouseGroupMapper.deleteHouseGroupOrder(orderId);
	}

}
