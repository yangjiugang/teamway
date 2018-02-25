package com.fc.brms.broker.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.fc.brms.common.domain.CfgOrganization;
import com.fc.brms.common.domain.EmployeeAppraisal;
import com.fc.brms.common.domain.EmployeeInfo;

public interface IAppraisalManagementMapper {	
	
	/**
	 * 获取绩效记录(条件搜索)
	 * @param employeeAppraisal
	 * @return
	 */
	public List<EmployeeAppraisal> searchEmployeeAppraisal(EmployeeInfo employeeInfo);
	
	/**
	 * 统计查询记录数
	 * @param employeeInfo
	 * @return
	 */
	public int countSearchEmployeeAppraisal(EmployeeInfo employeeInfo);
	
	/**
	 * 根据Id查找EmployeeAppraisal
	 * @param employeeId
	 * @return
	 */
	public List<EmployeeAppraisal> getEmployeeAppraisalById(@Param("employeeId")int employeeId,@Param("Limit")String Limit);
	
	/**
	 * 统计 根据Id查找EmployeeAppraisal
	 * @param employeeId
	 * @return
	 */
	public int countEmployeeAppraisalById(int employeeId);
	
	/**
	 * 检查新增的绩效是否在本月重复
	 * @return
	 */
	public int countEmployeeAppraisalByIdStartTimeEndTime(EmployeeAppraisal employeeAppraisal);
	
	/**
	 * 新增绩效
	 * @param employeeAppraisal
	 */
	public void insertEmployeeAppraisal(EmployeeAppraisal employeeAppraisal);
	
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
	public void updateEmployeeAppraisal(EmployeeAppraisal employeeAppraisal);
	
	
	/**
	 * 历史绩效结构分析
	 * @param employeeInfo
	 * @return
	 */
	public List<EmployeeAppraisal> searchHistoryAnalyse(EmployeeInfo employeeInfo);
	
	/**
	 * 统计历史绩效结构分析记录
	 * @param employeeInfo
	 * @return
	 */
	public int countSearchHistoryAnalyse(EmployeeInfo employeeInfo);
	
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
	public List<EmployeeAppraisal> getUserAppraisalListById(Map<String, Object> map);
	
	
	/**
	 * 根据id查询所有绩效 总记录
	 * @param map
	 * @return
	 */
	public int getUserAppraisalListCountById(Map<String, Object> map);
	
}
