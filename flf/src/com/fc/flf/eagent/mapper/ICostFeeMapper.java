package com.fc.flf.eagent.mapper;

import java.util.List;
import java.util.Map;

import com.fc.flf.common.domain.UserCostFee;

/**
 * 记录开销Mapper
 * 
 * @author Administrator
 * 
 */
public interface ICostFeeMapper {

	/**
	 * 开销列表查询
	 * 
	 * @param map
	 * @return List<UserCostFee>
	 */
	List<UserCostFee> getQueryList(Map<String, Object> map);
	
	/**
	 * 开销总数查询
	 * 
	 * @param map
	 * @return List<UserCostFee>
	 */
	int getQueryListCount(Map<String, Object> map);

	/**
	 * 开销条件查询
	 * 
	 * @param map
	 * @return List<UserCostFee>
	 */
	List<UserCostFee> getQueryCondition(Map<String, Object> map);

	/**
	 * 添加开销
	 * 
	 * @param map
	 * @return List<UserCostFee>
	 */
	int addCostFee(Map<String, Object> map);
	
	/**
	 * 查询历史开销记录总记录数
	 * 
	 * @param map
	 * @return List<UserCostFee>
	 */
	int getGroupHistoryCount(Map<String, Object> map);

	/**
	 * 查询历史开销记录
	 * 
	 * @param map
	 * @return List<UserCostFee>
	 */
	List<UserCostFee> getGroupHistory(Map<String, Object> map);

	/**
	 * 查询历史开销详细记录
	 * 
	 * @param map
	 * @return List<UserCostFee>
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
