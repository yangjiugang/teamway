package com.fc.flf.fparty.mapper;

import com.fc.flf.common.domain.CustomerInfo;
import com.fc.flf.common.domain.CustomerInfoDetail;
import com.fc.flf.common.domain.FcSysVisitor;
import com.fc.flf.common.domain.UserInfo;

public interface ICustomerInfoMapper {
	public CustomerInfo selectCustomerInfo(int customerId);
	public CustomerInfoDetail customerInfoDetail(int customerId);
	public void updateCustomerInfoPartOne(CustomerInfo customerInfo);
	public void updateCustomerInfoPartTwo(CustomerInfo customerInfo);
	public void updateFcSysVisitorInfo(FcSysVisitor fcSysVisitor);
	/**
	 * 根据客户的id号查找蜂蜜的信息
	 * @param customerId
	 * @return
	 */
	public UserInfo findUserInfo(int customerId);
}
