package com.fc.flf.fparty.service;

import com.fc.flf.common.domain.CustomerInfo;
import com.fc.flf.common.domain.CustomerInfoDetail;
import com.fc.flf.common.domain.FcSysVisitor;
import com.fc.flf.common.domain.UserInfo;

public interface ICustomerInfoService {
	/**
	 * 通过id查找CustomerInfo信息
	 * @return 
	 */
	public CustomerInfo findCustomerInfo(int customerId);
	
	/**
	 * 通过id查找CustomerInfoDetail信息
	 * @param customerId
	 * @return
	 */
	public CustomerInfoDetail findCustomerInfoDetail(int customerId);
	

	/**
	 * 更新CustomerInfo表信息
	 * @return 
	 */
	public void updateCustomerInfoPartOne(CustomerInfo customerInfo);
	
	/**
	 * 更新CustomerInfo表信息
	 * @return 
	 */
	public void updateCustomerInfoPartTwo(CustomerInfo customerInfo);
	
	/**
	 * 更新FcSysVisitor表信息
	 * @return 
	 */
	public void updateFcSysVisitorInfo(FcSysVisitor fcSysVisitor);
	
	/**
	 * 根据客户查找蜂蜜的信息
	 * @param customerId
	 * @return
	 */
	public UserInfo findUserInfo(CustomerInfo customer);
}
