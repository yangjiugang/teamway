package com.fc.brms.broker.mapper;

import java.util.List;
import java.util.Map;

import com.fc.brms.common.domain.EmployeeFamilyInfo;
import com.fc.brms.common.domain.EmployeeInfo;

/**
 * 生日提醒
 * @author 冯鹄
 * @version 1.0  2012-3-21
 *  
 */
public interface IBirthdayRemindMappeer {
	/**
	 * 查询今天（明天、后天）生日的资料
	 * @param birth 今天的日期
	 * @return List<EmployeeInfo>
	 */
	public List<EmployeeFamilyInfo> todayBirthday(Map<String, Object> map);

	/**
	 * 查询本周（本月）内生日的资料
	 * @param map 本周的开始日期、结束提起、分页参数
	 * @return List<EmployeeInfo>
	 */
	public List<EmployeeFamilyInfo> thisWeekBirthday(Map<String, Object> map);
	
	/**
	 * 条件搜索
	 * @param map 起始日期、 结束日期 、关键字、 分页参数
	 * @return List<EmployeeInfo>
	 */
	public List<EmployeeFamilyInfo> checkBirthdayTerm(Map<String, Object> map);
	
	/**
	 * 根据ID具体查询
	 * @param map ID 日期
	 * @return List<EmployeeFamilyInfo> 
	 */
	public List<EmployeeFamilyInfo> findEmployeeForID(Map<String, Object> map);
	
	/**
	 * 查询生日员工的信息
	 * @param birth
	 * @return
	 */
	public EmployeeInfo EmployeeBirthToday(Map<String, Object> map);
	
	/**
	 * 查询员工家属生日的家属信息
	 * @param birth
	 * @return
	 */
	public List<EmployeeFamilyInfo> EmployeeFamilyBirthToday(Map<String, Object> map);
}
