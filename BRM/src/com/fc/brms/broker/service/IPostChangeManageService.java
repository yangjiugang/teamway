package com.fc.brms.broker.service;

import java.util.List;
import java.util.Map;

import com.fc.brms.common.domain.CfgJobGrade;
import com.fc.brms.common.domain.CfgJobLevel;
import com.fc.brms.common.domain.CfgSalaryLevel;
import com.fc.brms.common.domain.EmployeeTransactionInfo;


/**
 * 异动管理Service
 * 
 * @author 覃启轩
 * @version 1.0  2012-3-21
 */
public interface IPostChangeManageService {

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
	 * @return 异动信息
	 */
	EmployeeTransactionInfo getEmployeePostChangeById(int infoId);
	
	/**
	 * 查询员工异动前的所有信息
	 * 
	 * @return 员工异动前的信息
	 */
	EmployeeTransactionInfo queryEmployeeAllInfo(int employeeId);
	
	/**
	 * 添加员工异动信息
	 * 
	 * @return 
	 */
	int addPostChangeInfo(EmployeeTransactionInfo employeeTransactionInfo, EmployeeTransactionInfo employeeTransInfo);
	
	/**
	 * 根据infoId查询需要删除的异动信息
	 * 
	 * @return int
	 */
	int getPostChangeByInfoId(Map<String, Object> map);
	
	/**
	 * 社保表示信息      (下拉框)
	 * 
	 * @return List<EmployeeTransactionInfo>
	 */
	List<EmployeeTransactionInfo> getSalarySocialSecuritySubmit(int companyId);
	
	/**
	 * 社保类型查询   (下拉框)
	 * 
	 * @return List<EmployeeTransactionInfo>
	 */
	List<EmployeeTransactionInfo> getSalarySocialSecurity(int companyId);
	
	/**
	 * 查询职系
	 * 
	 * @return List<CfgJobGrade>
	 */
	List<CfgJobGrade> findJobGradeInfo();
	
	/**
	 * 查询职级
	 * 
	 * @return List<CfgJobGrade>
	 */
	List<CfgJobLevel> findJobLevelForGrade(String jobGradeId);
	
	/**
	 * 薪酬等级   (下拉框)
	 * 
	 * @return List<CfgSalaryLevel>
	 */
	List<CfgSalaryLevel> getSalaryLevel();
}
