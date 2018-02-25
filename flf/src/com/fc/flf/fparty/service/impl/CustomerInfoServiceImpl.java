package com.fc.flf.fparty.service.impl;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.fc.flf.common.domain.CustomerInfo;
import com.fc.flf.common.domain.CustomerInfoDetail;
import com.fc.flf.common.domain.FcSysVisitor;
import com.fc.flf.common.domain.UserInfo;
import com.fc.flf.fparty.mapper.ICustomerInfoMapper;
import com.fc.flf.fparty.service.ICustomerInfoService;

@Service
public class CustomerInfoServiceImpl implements ICustomerInfoService {
	@Resource
	private ICustomerInfoMapper customerInfoMapper;
	
	public CustomerInfo findCustomerInfo(int customerId) {
		return customerInfoMapper.selectCustomerInfo(customerId);
	}
	
	/**
	 * 通过id查找CustomerInfoDetail信息
	 * @param customerId
	 * @return
	 */
	public CustomerInfoDetail findCustomerInfoDetail(int customerId){
		return customerInfoMapper.customerInfoDetail(customerId);
	}
 
	public void updateCustomerInfoPartOne(CustomerInfo customerInfo) {
		customerInfoMapper.updateCustomerInfoPartOne(customerInfo);
	}

	public void updateCustomerInfoPartTwo(CustomerInfo customerInfo) {
		customerInfoMapper.updateCustomerInfoPartTwo(customerInfo);
	}
	
	public void updateFcSysVisitorInfo(FcSysVisitor fcSysVisitor) {
		customerInfoMapper.updateFcSysVisitorInfo(fcSysVisitor);
	}
	
	/**
	 * 根据客户查找蜂蜜的信息
	 * @param customerId
	 * @return
	 */
	public UserInfo findUserInfo(CustomerInfo customer){
		return customerInfoMapper.findUserInfo(customer.getCustomerId());
	}

}
