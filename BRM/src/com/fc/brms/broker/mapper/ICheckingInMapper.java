package com.fc.brms.broker.mapper;

import java.util.List;

import com.fc.brms.common.domain.EmployeeCheckingIn;
import com.fc.brms.common.domain.EmployeeInfo;

public interface ICheckingInMapper {
	
	/**
	 * 获得所有考勤记录(条件搜索)
	 * @param page
	 * @return
	 */
	public List<EmployeeCheckingIn> searchEmployeeCheckingIn(EmployeeCheckingIn employeeCheckingIn);
	
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
	public List<EmployeeCheckingIn> getEmployeeCheckingInById(EmployeeCheckingIn employeeCheckingIn);
	
	/**
	 * 根据id统计employeeCheckingIn
	 * @param employeeId
	 * @return
	 */
	public int countEmployeeCheckingInById(int employeeId);
	
}
