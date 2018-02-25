package com.fc.brms.broker.service;

import java.util.List;

import com.fc.brms.common.domain.EmployeeCheckingIn;
import com.fc.brms.common.domain.EmployeeInfo;
import com.fc.brms.common.util.Page;

public interface ICheckingInService {
	
	/**
	 * 获得所有考勤记录
	 * @param page
	 * @return
	 */
	public List<EmployeeCheckingIn> searchEmployeeCheckingIn(EmployeeCheckingIn employeeCheckingIn,Page page);
	
	/**
	 * 统计考勤记录
	 * @param employeeCheckingIn
	 * @return
	 */
	public int countEmployeeCheckingIn(EmployeeCheckingIn employeeCheckingIn);
	
	/**
	 * 根据id查找 EmployeeInfo
	 * @return
	 */
	public EmployeeInfo getEmployeeInfoById(int id);
	
	/**
	 * 根据Id查看employeeCheckingIn 所有信息
	 * @param employeeCheckingIn
	 * @return
	 */
	public List<EmployeeCheckingIn> getEmployeeCheckingInById(EmployeeCheckingIn employeeCheckingIn,Page page);
}
