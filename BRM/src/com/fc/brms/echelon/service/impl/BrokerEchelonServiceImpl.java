package com.fc.brms.echelon.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fc.brms.common.domain.EmployeeInfo;
import com.fc.brms.echelon.mapper.IBrokerEchelonMapper;
import com.fc.brms.echelon.service.IBrokerEchelonService;

/**
 * 经纪人梯队管理实现类
 * 
 * @author 覃启轩
 * @version 1.0 2012-4-5
 * 
 */
@Service
public class BrokerEchelonServiceImpl implements IBrokerEchelonService {

	@Resource
	private IBrokerEchelonMapper brokerEchelonMapper;

	/**
	 * 查询已加入人才梯队的员工信息总记录数
	 * 
	 * @return int
	 */
	public int queryEchelonEmployeeCount(Map<String, Object> map) {
		return brokerEchelonMapper.queryEchelonEmployeeCount(map);
	}

	/**
	 * 查询已加入人才梯队的员工信息
	 * 
	 * @return List<EmployeeInfo>
	 */
	public List<EmployeeInfo> queryEchelonEmployeeList(Map<String, Object> map) {
		return brokerEchelonMapper.queryEchelonEmployeeList(map);
	}
	
	/**
	 * 移除梯队
	 * 
	 * @return int
	 */
	public int removeEchelon(Map<String, Object> map) {
		return brokerEchelonMapper.removeEchelon(map);
	}
}
