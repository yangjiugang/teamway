package com.fc.flf.eagent.service;

import java.util.List;
import java.util.Map;

import com.fc.flf.common.domain.UserCostFee;

/**
 * 记录开销Service
 * 
 * @author qinqx
 * 
 */
public interface ICostFeeService {

	/**
	 * 开销列表查询
	 * 
	 * @param map
	 * @return List<UserCustomerContactRecord>
	 */
	List<UserCostFee> getQueryList(Map<String, Object> map);
	
	/**
	 * 开销总数查询
	 * 
	 * @param map
	 * @return List<UserCustomerContactRecord>
	 */
	int getQueryListCount(Map<String, Object> map);

	/**
	 * 开销条件查询
	 * 
	 * @param map
	 * @return List<UserCustomerContactRecord>
	 */
	List<UserCostFee> getQueryCondition(Map<String, Object> map);

	/**
	 * 添加开销
	 * 
	 * @param map
	 * @return List<UserCustomerContactRecord>
	 */
	int addCostFee(Map<String, Object> map);
	
	/**
	 * 查询历史开销记录总记录数
	 * 
	 * @param map
	 * @return List<UserCustomerContactRecord>
	 */
	int getGroupHistoryCount(Map<String, Object> map);

	/**
	 * 查询历史开销记录
	 * 
	 * @param map
	 * @return List<UserCustomerContactRecord>
	 */
	List<UserCostFee> getGroupHistory(Map<String, Object> map);

	/**
	 * 查询历史开销详细记录
	 * 
	 * @param map
	 * @return List<UserCustomerContactRecord>
	 */
	List<UserCostFee> getDetailHistory(Map<String, Object> map);
	
	/**
	 * 更新开销记录
	 * 
	 * @param map
	 * @return int
	 */
	int updateCost(Map<String, Object> map);
}
