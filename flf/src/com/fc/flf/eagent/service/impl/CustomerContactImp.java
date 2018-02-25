package com.fc.flf.eagent.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fc.flf.common.domain.UserCustomerContactRecord;
import com.fc.flf.eagent.mapper.ICustomerContactMapper;
import com.fc.flf.eagent.service.ICustomerContactService;

@Service
public class CustomerContactImp implements ICustomerContactService {

	@Resource
	private ICustomerContactMapper customerContactMapper;

	/**
	 * 约会列表查询
	 * 
	 * @param map
	 * @return List<UserCustomerContactRecord>
	 */
	public List<UserCustomerContactRecord> getQueryList() {
		return customerContactMapper.getQueryList();
	}

	/**
	 * 约会录入列表查询
	 * 
	 * @param map
	 * @return List<UserCustomerContactRecord>
	 */
	public List<UserCustomerContactRecord> getQueryPageList(
			Map<String, Object> map) {
		return customerContactMapper.getQueryPageList(map);
	}

	/**
	 * 查询约会tab页 总记录数
	 * 
	 * @param map
	 * @return List<UserCustomerContactRecord>
	 */
	public int getCountPageQueryCount(Map<String, Object> map) {
		return customerContactMapper.getCountPageQueryCount(map);
	}

	/**
	 * 约会查询列表查询
	 * 
	 * @param map
	 * @return List<UserCustomerContactRecord>
	 */
	public List<UserCustomerContactRecord> getCountPageQueryList(
			Map<String, Object> map) {
		return customerContactMapper.getCountPageQueryList(map);
	}

	/**
	 * 约会条件查询
	 * 
	 * @param map
	 * @return List<UserCustomerContactRecord>
	 */
	public List<UserCustomerContactRecord> getQueryCondition(
			Map<String, Object> map) {
		return customerContactMapper.getQueryCondition(map);
	}

	/**
	 * 新增约会
	 * 
	 * @param map
	 * @return List<UserCustomerContactRecord>
	 */
	public int insertContact(Map<String, Object> map) {
		return customerContactMapper.insertContact(map);
	}

	/**
	 * 删除约会
	 * 
	 * @param map
	 * @return List<UserCustomerContactRecord>
	 */
	public int deleteOrder(Map<String, Object> map) {
		return customerContactMapper.deleteOrder(map);
	}
}
