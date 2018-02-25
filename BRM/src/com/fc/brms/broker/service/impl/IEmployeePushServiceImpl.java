package com.fc.brms.broker.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fc.brms.broker.mapper.IEmployeePushMapper;
import com.fc.brms.broker.service.IEmployeePushService;
import com.fc.brms.common.domain.CfgJobGrade;
import com.fc.brms.common.domain.CfgJobLevel;
import com.fc.brms.common.domain.CfgOrganization;
import com.fc.brms.common.domain.EmployeeInfo;
import com.fc.brms.common.domain.EmployeePushCash;
import com.fc.brms.common.mapper.IOrgStructureMapper;

@Service
public class IEmployeePushServiceImpl implements IEmployeePushService {
	@Resource
	private IEmployeePushMapper employeePushMapper;
	@Resource
	private IOrgStructureMapper orgStructureMapper;
	
	@Override
	public List<EmployeePushCash> findPushForDate(Map<String, Object> map) {
	    List<EmployeePushCash> cashs = employeePushMapper.findPushForDate(map);
		return cashs;
	}
	@Override
	public EmployeePushCash findPushForPushId(EmployeePushCash pushCash) {
	    EmployeePushCash cashs = employeePushMapper.findPushForPushId(pushCash);		
		return cashs;
	}
	@Override
	public void updatePush(Map<String, Object> map) {
		employeePushMapper.updatePush(map);
	}
	@Override
	public List<CfgJobGrade> findJobGrade() {
		List<CfgJobGrade> cfgJobGrades = orgStructureMapper.findJobGrade();
		return cfgJobGrades;
	}
	@Override
	public List<CfgJobLevel> findJobLevelForGrade(int jobGradeId) {
		List<CfgJobLevel> cfgJobLevels = orgStructureMapper.findJobLevelForGrade(jobGradeId);
		return cfgJobLevels;
	}
	@Override
	public List<CfgOrganization> findOrganization() {
		List<CfgOrganization> cfgOrganizations = orgStructureMapper.findOrganization();
		return cfgOrganizations;
	}
	
	@Override
	public int findEmployeeId(int pushId) {		
		return employeePushMapper.findEmployeeId(pushId);
	}
	@Override
	public List<EmployeePushCash> findPushForEmployeeId(int employeeId) {
		List<EmployeePushCash> cashs = employeePushMapper.findPushForEmployeeId(employeeId);
		return cashs;
	}
	@Override
	public List<EmployeeInfo> findEmployeeForEployeeId(String items) {
		String[] item = items.split(",");
		int size = item.length;
		int employeeId[] = new int[size];
		for(int i = 0 ; i < size ; i ++){
			employeeId[i] = Integer.parseInt(item[i].toString());
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("employeeId", employeeId);
		List<EmployeeInfo>  employeeInfos = employeePushMapper.findEmployeeForEployeeId(map);
		return employeeInfos;
	}
	@Override
	public void insertPushCash(Map<String, Object> map) {
		employeePushMapper.insertPushCash(map);
	}


	public int findOrganizationId(int employeeId){
		return employeePushMapper.findOrganizationId(employeeId);
	}
	
	public List<EmployeePushCash> historyPushAnalyse(Map<String, Object> map){
			List<EmployeePushCash> cashs = employeePushMapper.historyPushAnalyse(map);
			return cashs;
	}
	@Override
	public Boolean findEmployeePushIsTrue(Map<String, Object> map) {
		EmployeePushCash cash = employeePushMapper.findEmployeePushIsTrue(map);
		boolean flag = false;
		if(cash==null){
			flag = true;
		}
		return flag;
	}


public Double historyPushAnalyseAvg(Map<String, Object> map){	
	String str = employeePushMapper.historyPushAnalyseAvg(map);
	Double avg = 0.0;
	if(str!=null){
		avg = Double.parseDouble(str);
	}
	return avg;
	
}

public int historyPushAnalyseSum(Map<String, Object> map){
	String str = employeePushMapper.historyPushAnalyseSum(map);
	int sum = 0;
	if(str!=null){
		sum = Integer.parseInt(str);
	}
	return sum;
	
}
}
