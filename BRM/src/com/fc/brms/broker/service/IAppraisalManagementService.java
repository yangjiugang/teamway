package com.fc.brms.broker.service;

import java.util.List;
import java.util.Map;

import com.fc.brms.common.domain.DateProperty;
import com.fc.brms.common.domain.EmployeeAppraisal;
import com.fc.brms.common.domain.EmployeeInfo;
import com.fc.brms.common.util.Page;

public interface IAppraisalManagementService {
	/**
	 * 获取绩效记录(条件搜索)
	 * @param employeeAppraisal
	 * @return
	 */
	public List<EmployeeAppraisal> searchEmployeeAppraisal(EmployeeInfo employeeInfo,Page page,DateProperty dateProperty);
	
	/**
	 * 根据Id查找EmployeeAppraisal
	 * @param employeeId
	 * @return
	 */
	public List<EmployeeAppraisal> getEmployeeAppraisalById(int employeeId,Page page);
	
	/**
	 * 检查新增的绩效是否在本月重复
	 * @return
	 */
	public int countEmployeeAppraisalByIdStartTimeEndTime(EmployeeAppraisal employeeAppraisal,String monthType);
	
	/**
	 * 新增绩效
	 * @param employeeAppraisal
	 */
	public int insertEmployeeAppraisal(EmployeeAppraisal employeeAppraisal,String monthType);
	
	/**
	 * 根据id 和 时间查看绩效信息
	 * @param employeeAppraisal
	 * @return
	 */
	public EmployeeAppraisal getEmployeeAppraisalByIdAndStartTime(EmployeeAppraisal employeeAppraisal);
	
	/**
	 * 更新 EmployeeAppraisal 
	 * @param employeeAppraisal
	 */
	public int updateEmployeeAppraisal(EmployeeAppraisal employeeAppraisal);
	
	/**
	 * 历史绩效结构分析
	 * @param employeeInfo
	 * @return
	 */
	public List<EmployeeAppraisal> searchHistoryAnalyse(EmployeeInfo employeeInfo,Page page);
	
	/**
	 * 得到所有部门的下拉列表的
	 * @return
	 */
	public List<EmployeeAppraisal> allOrganization();
	
	/**
	 * 根据id查询所有绩效 多条件 分页
	 * @param map
	 * @return
	 */
	public List<EmployeeAppraisal> getUserAppraisalListById(Map<String, Object> map,Page page);
	
}
