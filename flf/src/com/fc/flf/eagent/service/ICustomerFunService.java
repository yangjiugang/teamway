package com.fc.flf.eagent.service;

import java.util.List;
import java.util.Map;

import com.fc.flf.common.domain.CustomerEduInfo;
import com.fc.flf.common.domain.CustomerFamilyInfo;
import com.fc.flf.common.domain.CustomerInfoDetail;
import com.fc.flf.common.domain.CustomerInterests;
import com.fc.flf.common.util.Page;

public interface ICustomerFunService {
	/**
	 * 查询客户部分信息 -
	 * @return List
	 */
	public List<CustomerInfoDetail> queryCusInDe();

	/**
	 * 查询所有客户
	 * @return
	 */
	public List<CustomerInfoDetail> queryCusInDeAll();

	/**
	 * 添加新的客户
	 * @param customerInfoDetail
	 */
	public void insertCusInfo(CustomerInfoDetail customerInfoDetail);
	
	

	/**
	 * 添加客户的家庭信息
	 * @param customerInfoDetail
	 */
	public void insertFamInfo(CustomerFamilyInfo customerInfoDetail);

	/**
	 * 添加客户的受教育信息
	 * @param customerInfoDetail
	 */
	public void insertEduInfo(CustomerEduInfo customerEduInfo);

	/**
	 * 添加客户的兴趣爱好
	 * @param customerInfoDetail
	 */
	public void insertCusIntere(CustomerInterests customerInterests);

	/**
	 * 根据客户信息查询Id
	 * @param customerInfoDetail
	 * @return
	 */
	public int queryCusId(CustomerInfoDetail customerInfoDetail);
	
	/**
	 * 查询客户列表
	 * 
	 * @param cusInfoDetail
	 * @return 客户信息
	 */
	List<CustomerInfoDetail> getCusTomerList(Map<String, Object> map,Page page);
	
	/**
	 * 更改客户更换情况
	 * @param isExchange
	 * @param customerId
	 * @param createUser
	 */
	public void updateCusInfoDetailIsExchange(int isExchange,int customerId,int createUser);
}
