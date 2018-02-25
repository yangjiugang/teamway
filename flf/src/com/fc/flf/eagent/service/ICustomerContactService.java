package com.fc.flf.eagent.service;

import java.util.List;
import java.util.Map;

import com.fc.flf.common.domain.UserCustomerContactRecord;

/**
 * 记录约会Service
 * 
 * @author qinqx
 * 
 */
public interface ICustomerContactService {

	/**
	 * 约会查询
	 * 
	 * @param map
	 * @return List<UserCustomerContactRecord>
	 */
	List<UserCustomerContactRecord> getQueryList();

	/**
	 * 录入约会tab页 分页查询
	 * 
	 * @param map
	 * @return List<UserCustomerContactRecord>
	 */
	List<UserCustomerContactRecord> getQueryPageList(
			Map<String, Object> map);

	/**
	 * 查询约会tab页 分页查询
	 * 
	 * @param map
	 * @return List<UserCustomerContactRecord>
	 */
	List<UserCustomerContactRecord> getCountPageQueryList(
			Map<String, Object> map);

	/**
	 * 查询约会tab页 总记录数
	 * 
	 * @param map
	 * @return List<UserCustomerContactRecord>
	 */
	int getCountPageQueryCount(Map<String, Object> map);

	/**
	 * 约会条件查询
	 * 
	 * @param map
	 * @return List<UserCustomerContactRecord>
	 */
	List<UserCustomerContactRecord> getQueryCondition(
			Map<String, Object> map);

	/**
	 * 新增约会
	 * 
	 * @param map
	 * @return List<UserCustomerContactRecord>
	 */
	int insertContact(Map<String, Object> map);
	
	/**
	 * 删除约会
	 * 
	 * @param map
	 * @return List<UserCustomerContactRecord>
	 */
	int deleteOrder(Map<String, Object> map);
}
