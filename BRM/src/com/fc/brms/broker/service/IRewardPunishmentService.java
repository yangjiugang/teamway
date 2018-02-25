package com.fc.brms.broker.service;

import java.util.List;
import java.util.Map;

import com.fc.brms.common.domain.EmployeeInfo;
import com.fc.brms.common.domain.EmployeeRewardPunishment;
import com.fc.brms.common.util.Page;

public interface IRewardPunishmentService {
	
	/**
	 * 查找奖惩信息(分页)
	 * @return
	 */
	public List<EmployeeRewardPunishment> getAllRewardPunishment(Page page);
	
	/**
	 * 统计奖惩
	 * @return
	 */
	public int getCountRewardPunishment();
	
	/**
	 * 根据employeeId查找信息
	 * @param employeeId
	 * @return
	 */
	public EmployeeInfo getEmployeeInfoById(int employeeId);
	
	/**
	 * 根据employeeId查找EmployeeRewardPunishment
	 * @param employeeIf
	 * @return
	 */
	public List<EmployeeRewardPunishment> getRewardPunishmentById(int employeeId,Page page);
	
	/**
	 * 根据employeeId查找EmployeeRewardPunishment的总记录数
	 * @return
	 */
	public int getCountRewardPunishmentById(int employeeId);
	
	/**
	 * 按照id recordId查看
	 * @param employeeRewardPunishment
	 */
	public EmployeeRewardPunishment getRewardPunishmentByIdAndrecordId(EmployeeRewardPunishment employeeRewardPunishment);
	
	/**
	 * 修改 employeeRewardPunishment
	 * @param employeeRewardPunishment
	 */
	public int updateEmployeeRewardPunishmentById(EmployeeRewardPunishment employeeRewardPunishment);
	
	/**
	 * 新增
	 * @param employeeRewardPunishment
	 */
	public int insertEmployeeRewardPunishment(EmployeeRewardPunishment employeeRewardPunishment);
	
	/**
	 * 按照employeeNum查找employeeInfo
	 * @param employeeNum
	 * @return
	 */
	public EmployeeInfo getEmployeeInfoByEmployeeNum(String employeeNum);
	
	/**
	 * 根据姓名拿到id
	 * @param signName
	 * @return
	 */
	public int getEmployeeIdByName(String signName);
	
	/**
	 * 删除
	 * @param recordId
	 */
	public void deleteEmployeeRewardPunishment(int recordId);
	
	/**
	 * 条件搜索
	 * @param employeeRewardPunishment
	 * @return
	 */
	public List<EmployeeRewardPunishment> searchEmployeeRewardPunishment(EmployeeRewardPunishment employeeRewardPunishment,Page page);
	
	/**
	 * 条件搜索统计
	 * @param employeeRewardPunishment
	 * @return
	 */
	public int countSearchEmployeeRewardPunishment(EmployeeRewardPunishment employeeRewardPunishment);
	
	
	/**
	 * 上个月奖励
	 * @return
	 */
	public int lastMonthCount(EmployeeRewardPunishment employeeRewardPunishment);
	
	/**
	 * 查询奖惩根据ID 多条件 分页
	 * @param map
	 * @return
	 */
	public List<EmployeeRewardPunishment> searchUserPunishmentListById(Page page,Map<String, Object> map);
	
	
}
