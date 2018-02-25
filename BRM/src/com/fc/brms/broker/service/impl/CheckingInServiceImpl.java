package com.fc.brms.broker.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fc.brms.broker.mapper.ICheckingInMapper;
import com.fc.brms.broker.service.ICheckingInService;
import com.fc.brms.common.domain.EmployeeCheckingIn;
import com.fc.brms.common.domain.EmployeeInfo;
import com.fc.brms.common.util.Page;

@Service
public class CheckingInServiceImpl implements ICheckingInService {

	@Resource
	private ICheckingInMapper cim;
	
	/**
	 * 考勤记录(条件)
	 */
	public List<EmployeeCheckingIn> searchEmployeeCheckingIn(
			EmployeeCheckingIn employeeCheckingIn,Page page) {
		page.setRecords(cim.countEmployeeCheckingIn(employeeCheckingIn));
		employeeCheckingIn.setLimit(page.getLimit());
		return cim.searchEmployeeCheckingIn(employeeCheckingIn);
	}
	
	/**
	 * 统计考勤记录
	 * @param employeeCheckingIn
	 * @return
	 */
	public int countEmployeeCheckingIn(EmployeeCheckingIn employeeCheckingIn){
		return cim.countEmployeeCheckingIn(employeeCheckingIn);
	}
	
	/**
	 * 根据id查找 EmployeeInfo
	 * @return
	 */
	public EmployeeInfo getEmployeeInfoById(int id){
		return cim.getEmployeeInfoById(id);
	}
	
	/**
	 * 根据Id查看employeeCheckingIn 所有信息
	 * @param employeeCheckingIn
	 * @return
	 */
	public List<EmployeeCheckingIn> getEmployeeCheckingInById(EmployeeCheckingIn employeeCheckingIn,Page page){
		page.setRecords(cim.countEmployeeCheckingInById(employeeCheckingIn.getEmployeeId()));
		employeeCheckingIn.setLimit(page.getLimit());
		return cim.getEmployeeCheckingInById(employeeCheckingIn);
	}

}
