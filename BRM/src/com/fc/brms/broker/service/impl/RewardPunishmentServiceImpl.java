package com.fc.brms.broker.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.brms.broker.mapper.IRewardPunishmentMapper;
import com.fc.brms.broker.service.IRewardPunishmentService;
import com.fc.brms.common.domain.EmployeeInfo;
import com.fc.brms.common.domain.EmployeeRewardPunishment;
import com.fc.brms.common.util.Page;

@Service
public class RewardPunishmentServiceImpl implements IRewardPunishmentService {

	@Resource
	private IRewardPunishmentMapper rpm;
	
	/**
	 * 查找奖惩信息(分页)
	 * @return
	 */
	public List<EmployeeRewardPunishment> getAllRewardPunishment(Page page) {
		page.setRecords(rpm.getCountRewardPunishment());
		return rpm.getAllRewardPunishment(page.getLimit());
	}

	/**
	 * 统计奖惩
	 * @return
	 */
	public int getCountRewardPunishment() {
		return rpm.getCountRewardPunishment();
	}

	/**
	 * 根据employeeId查找信息
	 * @param employeeId
	 * @return
	 */
	@Override
	public EmployeeInfo getEmployeeInfoById(int employeeId) {
		return rpm.getEmployeeInfoById(employeeId);
	}

	/**
	 * 根据employeeId查找EmployeeRewardPunishment
	 * @param employeeIf
	 * @return
	 */
	public List<EmployeeRewardPunishment> getRewardPunishmentById(int employeeId,Page page) {	
		page.setRecords(rpm.getCountRewardPunishmentById(employeeId));
		return rpm.getRewardPunishmentById(employeeId,page.getLimit());
	}
	
	/**
	 * 根据employeeId查找EmployeeRewardPunishment的总记录数
	 * @return
	 */
	public int getCountRewardPunishmentById(int employeeId){
		return rpm.getCountRewardPunishmentById(employeeId);
	}
	
	/**
	 * 按照id recordId查看
	 * @param employeeRewardPunishment
	 */
	public EmployeeRewardPunishment getRewardPunishmentByIdAndrecordId(EmployeeRewardPunishment employeeRewardPunishment){
		return rpm.getRewardPunishmentByIdAndrecordId(employeeRewardPunishment);
	}
	
	/**
	 * 修改 employeeRewardPunishment
	 * @param employeeRewardPunishment
	 */
	public int updateEmployeeRewardPunishmentById(EmployeeRewardPunishment employeeRewardPunishment){
		int temp = 0;
		try {
			rpm.updateEmployeeRewardPunishmentById(employeeRewardPunishment);
			temp = 1;
		} catch (Exception e) {
			temp = 0;
		}
		return temp;
	}
	
	/**
	 * 新增
	 * @param employeeRewardPunishment
	 */
	public int insertEmployeeRewardPunishment(EmployeeRewardPunishment employeeRewardPunishment){
		int temp=0;
		try{
			rpm.insertEmployeeRewardPunishment(employeeRewardPunishment);
			temp = 1;
		}catch (Exception e) {
			temp = 0;
		}
		return temp;
	}
	
	/**
	 * 按照employeeNum查找employeeInfo
	 * @param employeeNum
	 * @return
	 */
	public EmployeeInfo getEmployeeInfoByEmployeeNum(String employeeNum){
		return rpm.getEmployeeInfoByEmployeeNum(employeeNum);
	}

	/**
	 * 根据姓名拿到id
	 * @param signName
	 * @return
	 */
	public int getEmployeeIdByName(String signName){
		return rpm.getEmployeeIdByName(signName);
	}
	
	/**
	 * 删除
	 * @param recordId
	 */
	public void deleteEmployeeRewardPunishment(int recordId){
		rpm.deleteEmployeeRewardPunishment(recordId);
	}
	
	/**
	 * 条件搜索
	 * @param employeeRewardPunishment
	 * @return
	 */
	public List<EmployeeRewardPunishment> searchEmployeeRewardPunishment(EmployeeRewardPunishment employeeRewardPunishment,Page page){
		page.setRecords(rpm.countSearchEmployeeRewardPunishment(employeeRewardPunishment));		
		employeeRewardPunishment.setLimit(page.getLimit());
		return rpm.searchEmployeeRewardPunishment(employeeRewardPunishment);
	}
	
	/**
	 * 条件搜索统计
	 * @param employeeRewardPunishment
	 * @return
	 */
	public int countSearchEmployeeRewardPunishment(EmployeeRewardPunishment employeeRewardPunishment){
		return rpm.countSearchEmployeeRewardPunishment(employeeRewardPunishment);
	}
	
	/**
	 * 上个月奖励
	 * @return
	 */
	public int lastMonthCount(EmployeeRewardPunishment employeeRewardPunishment){
		return rpm.countSearchEmployeeRewardPunishment(employeeRewardPunishment);
	}

	@Transactional(readOnly=true)
	public List<EmployeeRewardPunishment> searchUserPunishmentListById(Page page,Map<String, Object> map) {
		int count = rpm.searchUserPunishmentListCountById(map);
		page.setRecords(count);
		map.put("limit", page.getLimit());
		List<EmployeeRewardPunishment> punishments = rpm.searchUserPunishmentListById(map);
		return punishments;
	}
}

