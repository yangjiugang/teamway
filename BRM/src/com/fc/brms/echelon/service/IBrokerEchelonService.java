package com.fc.brms.echelon.service;

import java.util.List;
import java.util.Map;

import com.fc.brms.common.domain.EmployeeInfo;

/**
 * 经纪人梯队管理接口
 * 
 * @author 覃启轩
 * @version 1.0 2012-4-5
 * 
 */
public interface IBrokerEchelonService {

	/**
	 * 查询已加入人才梯队的员工信息总记录数
	 * 
	 * @return int
	 */
	int queryEchelonEmployeeCount(Map<String, Object> map);

	/**
	 * 查询已加入人才梯队的员工信息
	 * 
	 * @return List<EmployeeInfo>
	 */
	List<EmployeeInfo> queryEchelonEmployeeList(Map<String, Object> map);
	
	/**
	 * 移除梯队
	 * 
	 * @return int
	 */
	int removeEchelon(Map<String, Object> map);
}
