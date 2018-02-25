package com.fc.brms.broker.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.brms.broker.mapper.IEmployeeInfoMapper;
import com.fc.brms.broker.service.IEmployeeInfoService;
import com.fc.brms.common.domain.EmployeeInfo;
import com.fc.brms.common.util.Page;

/**
 * 员工信息管理Service
 * 
 * @author 覃启轩
 * @version 1.0 2012-3-27
 */
@Service
public class EmployeeInfoServiceImpl implements IEmployeeInfoService {

	@Resource
	private IEmployeeInfoMapper employeeInfoMapper;

	/**
	 * 查询约谈记录总记录数
	 * 
	 * @return 总记录数
	 */
	public int getEmployeeCommInfoCount(Map<String, Object> map) {
		return employeeInfoMapper.getEmployeeCommInfoCount(map);
	}

	/**
	 * 查询约谈记录列表
	 * 
	 * @return 信息集合
	 */
	public List<EmployeeInfo> getEmployeeCommInfoList(Map<String, Object> map) {
		return employeeInfoMapper.getEmployeeCommInfoList(map);
	}
	
	
	@Transactional(readOnly=true)
	public EmployeeInfo getUserInfoById(int userId) {
		
		return employeeInfoMapper.getUserInfoById(userId);
	}
	
	@Transactional(readOnly=true)
	public List<EmployeeInfo> getEmployeeInfoByKeyword(Page page, String keyword) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("keyword", keyword);
		//param.put("limit", page.getLimit());
		page.setRecords(employeeInfoMapper.getEmployeeInfoCountByKeyword(param));
		return employeeInfoMapper.getEmployeeInfoByKeyword(param);
	}
	
	@Transactional(readOnly=true)
	public EmployeeInfo getEmployeeInfoById(int employeeId) {
		return employeeInfoMapper.getEmployeeInfoById(employeeId);
	}
	
	@Transactional(readOnly=true)
	public List<EmployeeInfo> getEmployeeInfoByPostId(int postId) {
		return employeeInfoMapper.getEmployeeInfoByPostId(postId);
	}
	
	@Transactional(readOnly=true)
	public List<EmployeeInfo> getEmployeeInfoByOrgId(int organizationId) {
		return employeeInfoMapper.getEmployeeInfoByOrgId(organizationId);
	}
	
	@Transactional(readOnly=true)
	public List<EmployeeInfo> getEmployeeInfoByCompanyId(int companyId) {
		return employeeInfoMapper.getEmployeeInfoByCompanyId(companyId);
	}

	@Transactional(readOnly=true)
	public List<EmployeeInfo> getUserInfoByIdAndNotTurnover(Map<String, Object> map,Page page) {
		int count = employeeInfoMapper.getUserInfoCountByIdAndNotTurnover(map);
		page.setRecords(count);
		map.put("limit", page.getLimit());
		List<EmployeeInfo> infos = employeeInfoMapper.getUserInfoByIdAndNotTurnover(map);
		return infos;
	}
	
}
