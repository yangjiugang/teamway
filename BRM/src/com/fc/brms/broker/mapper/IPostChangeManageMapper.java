package com.fc.brms.broker.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.fc.brms.common.domain.CfgSalaryLevel;
import com.fc.brms.common.domain.EmployeeTransactionInfo;

/**
 * 异动管理 mapper
 * 
 * @author 覃启轩
 * @version 1.0  2012-3-21
 */
public interface IPostChangeManageMapper {
	
	/**
	 * 查询员工异动总记录数
	 * 
	 * @return 总记录数
	 */
	int queryEmployeePostChangeCount(Map<String, Object> map);

	/**
	 * 查询员工异动列表
	 * 
	 * @return 异动信息集合
	 */
	List<EmployeeTransactionInfo> queryEmployeePostChangeList(Map<String, Object> map);
	
	/**
	 * 根据ID查找人员异动信息
	 * 
	 * @return 异动信息集合
	 */
	EmployeeTransactionInfo getEmployeePostChangeById(@Param("infoId") int infoId);
	
	/**
	 * 查询员工异动前的所有信息
	 * 
	 * @return 员工异动前的信息
	 */
	EmployeeTransactionInfo queryEmployeeAllInfo(@Param("employeeId") int employeeId);
	
	/**
	 * 添加员工异动信息
	 * 
	 * @return 
	 */
	int addPostChangeInfo(Map<String, Object> map);
	
	/**
	 * 根据infoId查询需要删除的异动信息
	 * 
	 * @return List<EmployeeTransactionInfo>
	 */
	List<EmployeeTransactionInfo> getPostChangeByInfoId(Map<String, Object> map);
	
	/**
	 * 删除异动信息
	 * 
	 * @return 
	 */
	int deletePostChange(Map<String, Object> map);
	
	/**
	 * 社保表示信息      (下拉框)
	 * 
	 * @return List<EmployeeTransactionInfo>
	 */
	List<EmployeeTransactionInfo> getSalarySocialSecuritySubmit(@Param("companyId") int companyId);
	
	/**
	 * 社保类型查询   (下拉框)
	 * 
	 * @return List<EmployeeTransactionInfo>
	 */
	List<EmployeeTransactionInfo> getSalarySocialSecurity(@Param("companyId") int companyId);
	
	/**
	 * 薪酬等级   (下拉框)
	 * 
	 * @return List<CfgSalaryLevel>
	 */
	List<CfgSalaryLevel> getSalaryLevel();
}
