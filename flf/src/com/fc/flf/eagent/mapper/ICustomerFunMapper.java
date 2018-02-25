package com.fc.flf.eagent.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.fc.flf.common.domain.CustomerEduInfo;
import com.fc.flf.common.domain.CustomerFamilyInfo;
import com.fc.flf.common.domain.CustomerInfoDetail;
import com.fc.flf.common.domain.CustomerInterests;

public interface ICustomerFunMapper {
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
	 * 添加新的客户
	 * @param customerInfoDetail
	 */
	public void newCustomerInfoDetail(CustomerInfoDetail customerInfoDetail);

	
	/**
	 * 添加客户的家庭信息
	 * @param customerInfoDetail
	 */
	public void insertFamInfo(CustomerFamilyInfo customerFamilyInfo);

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
	public List<CustomerInfoDetail> getCusTomerList(Map<String, Object> map);
	
	public int getCusTomerListCount(Map<String, Object> map);
	
	/**
	 * 更改用户is_exchange
	 * @param isExchange
	 * @param customerId
	 * @return createdUser
	 */
	public void updateCusInfoDetailIsExchange(@Param("isExchange") int isExchange,@Param("customerId") int customerId,@Param("createdUser") int createdUser);
	
}
