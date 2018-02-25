package com.fc.brms.broker.service;

import java.util.List;
import java.util.Map;

import com.fc.brms.common.domain.EmployeeInfo;
import com.fc.brms.common.util.Page;



/**
 * 员工信息管理Service
 * 
 * @author 覃启轩
 * @version 1.0  2012-3-27
 */
public interface IEmployeeInfoService {
	
	/**
	 * 查询约谈记录总记录数
	 * 
	 * @return 总记录数
	 */
	int getEmployeeCommInfoCount(Map<String, Object> map);
	
	/**
	 * 查询约谈记录列表
	 * 
	 * @return 信息集合
	 */
	List<EmployeeInfo> getEmployeeCommInfoList(Map<String, Object> map);
	
	public EmployeeInfo getUserInfoById(int userId);
	
	/**
	 * 通过关键字搜索员工
	 * @param keyword
	 * @return
	 */
	public List<EmployeeInfo> getEmployeeInfoByKeyword(Page page, String keyword);
	
	/**
	 * 通过员工编号查询员工
	 * @param param
	 * @return
	 */
	EmployeeInfo getEmployeeInfoById(int employeeId);
	
	/**
	 * 通过公司部门职位查询员工
	 * @param param
	 * @return
	 */
	List<EmployeeInfo> getEmployeeInfoByPostId(int postId);
	
	/**
	 * 通过部门查询员工
	 * @param param
	 * @return
	 */
	List<EmployeeInfo> getEmployeeInfoByOrgId(int organizationId);
	
	/**
	 * 通过公司查询员工
	 * @param param
	 * @return
	 */
	List<EmployeeInfo> getEmployeeInfoByCompanyId(int companyId);
	
	/**
	 * 多条件查询内部经纪人:  涉及页面 内部经纪人 首页初始化数据
	 * @param map
	 * @return
	 */
	public List<EmployeeInfo> getUserInfoByIdAndNotTurnover(Map<String, Object> map,Page page);
}
