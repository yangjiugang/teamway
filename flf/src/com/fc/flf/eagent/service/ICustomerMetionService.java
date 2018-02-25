package com.fc.flf.eagent.service;

import java.util.List;

import com.fc.flf.common.domain.CustomerMention;

public interface ICustomerMetionService {
	/**
	 * 根据userID查询客户点名信息
	 * 
	 * @param userId
	 * @param limit
	 * @return list
	 */
	public List<CustomerMention> findCustomerMentionByUserId(int userId,String limit);
	
	/**
	 * 根据userID查询客户点名信息数
	 * 
	 * @param userId
	 * @return int
	 */
	public int findCustomerMentionCountByUserId(int userId);

	/**
	 * 根据mentionID删除客户点名信息
	 * 
	 * @param mentionId
	 * @return 
	 */
	public void delCusMetionByMetionId(int mentionId);

	/**
	 * 根据mentionId查询客户点名信息
	 * 
	 * @param userId
	 * @return int
	 */
	public CustomerMention findCustomerMetionById(int mentionId);
}
