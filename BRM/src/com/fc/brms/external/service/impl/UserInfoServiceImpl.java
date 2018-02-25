package com.fc.brms.external.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.brms.common.domain.CfgJobGrade;
import com.fc.brms.common.domain.CfgJobLevel;
import com.fc.brms.common.domain.CfgPost;
import com.fc.brms.common.domain.CfgSalaryLevel;
import com.fc.brms.common.domain.EmployeeCheckingIn;
import com.fc.brms.common.domain.EmployeeContrack;
import com.fc.brms.common.domain.EmployeeFamilyInfo;
import com.fc.brms.common.domain.EmployeeInfo;
import com.fc.brms.common.domain.EmployeeTalkRecord;
import com.fc.brms.common.domain.SalarySocialSecurity;
import com.fc.brms.common.domain.SalarySocialSecuritySusbmit;
import com.fc.brms.common.domain.TrainingTask;
import com.fc.brms.common.util.Page;
import com.fc.brms.external.mapper.IUserInfoMapper;
import com.fc.brms.external.service.IUserInfoService;

@Service
public class UserInfoServiceImpl implements IUserInfoService{
	
	@Resource
	private IUserInfoMapper infoMapper;

	@Transactional(readOnly=true)
	public List<EmployeeFamilyInfo> getUserFamilyById(int empId) {
		return infoMapper.getUserFamilyById(empId);
	}

	@Transactional
	public int addNewFamilyById(EmployeeFamilyInfo employeeFamilyInfo) {
		return infoMapper.addNewFamilyById(employeeFamilyInfo);
	}

	@Transactional(readOnly=true)
	public EmployeeInfo findUserInfoById(int empId) {
		return infoMapper.findUserInfoById(empId);
	}

	@Override
	public CfgPost getUserPostById(int poseId) {
		return infoMapper.getUserPostById(poseId);
	}

	@Transactional(readOnly=true)
	public CfgJobGrade getJobGradeById(int jobGradeId) {
		return infoMapper.getJobGradeById(jobGradeId);
	}

	@Transactional(readOnly=true)
	public CfgJobLevel getJobLevelById(int jobLevelId) {
		return infoMapper.getJobLevelById(jobLevelId);
	}

	@Transactional(readOnly=true)
	public CfgSalaryLevel getSalaryById(int salaryLevelId) {
		return infoMapper.getSalaryById(salaryLevelId);
	}

	@Transactional(readOnly=true)
	public SalarySocialSecurity getSocialById(int socialSecurityId) {
		return infoMapper.getSocialById(socialSecurityId);
	}

	@Transactional(readOnly=true)
	public List<EmployeeTalkRecord> getTalkRecordListById(Map<String, Object> map,Page page) {
		
		int count = infoMapper.getTalkRecordListCountById(map);
		page.setRecords(count);
		map.put("limit", page.getLimit());
		List<EmployeeTalkRecord> records = infoMapper.getTalkRecordListById(map);
		return records;
	}


	@Transactional(readOnly=true)
	public EmployeeTalkRecord getTalkRecordInfoById(int talkId) {
		return infoMapper.getTalkRecordInfoById(talkId);
	}

	@Transactional(readOnly=true)
	public List<EmployeeCheckingIn> getCheckingListById(Map<String, Object> map,Page page) {
		int count = infoMapper.getCheckingListCountById(map);
		page.setRecords(count);
		map.put("limit", page.getLimit());
		return infoMapper.getCheckingListById(map);
	}

	@Transactional(readOnly=true)
	public EmployeeCheckingIn getCheckingById(Map<String, Object> map) {
		return infoMapper.getCheckingById(map);
	}

	@Transactional(readOnly=true)
	public List<TrainingTask> getTrainingTaskListById(Map<String, Object> map,Page page) {
		int count = infoMapper.getTrainingTaskListCountById(map);
		page.setRecords(count);
		map.put("limit", page.getLimit());
		return infoMapper.getTrainingTaskListById(map);
	}

	@Transactional(readOnly=true)
	public SalarySocialSecuritySusbmit getUserSubmitBuId(int userId) {
		return infoMapper.getUserSubmitBuId(userId);
	}

	@Transactional(readOnly=true)
	public List<EmployeeContrack> getUserContrackById(int userId,Page page) {
		int count = infoMapper.getUserContrackCountById(userId);
		page.setRecords(count);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("limit", page.getLimit());
		List<EmployeeContrack> contracks = infoMapper.getUserContrackById(map);
		return contracks;
	}


}
