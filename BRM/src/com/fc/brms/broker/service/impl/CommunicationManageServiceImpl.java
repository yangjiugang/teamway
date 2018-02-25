package com.fc.brms.broker.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.brms.broker.mapper.ICommunicationManageMapper;
import com.fc.brms.broker.mapper.IEmployeeInfoMapper;
import com.fc.brms.broker.service.ICommunicationManageService;
import com.fc.brms.common.domain.EmployeeInfo;
import com.fc.brms.common.domain.EmployeeTalkRecord;


/**
 * 沟通管理 Impl
 * 
 * @author 覃启轩
 * @version 1.0  2012-3-28
 */
@Service
public class CommunicationManageServiceImpl implements ICommunicationManageService  {

	@Resource
	private ICommunicationManageMapper commManageMapper;
	@Resource
	private IEmployeeInfoMapper employeeInfoMapper;
	
	/**
	 * 查询约谈提醒总记录数
	 * 
	 * @return 总记录数
	 */
	public int queryCommunicationManageCount(Map<String, Object> map) {
		return employeeInfoMapper.queryCommunicationManageCount(map);
	}

	/**
	 * 查询约谈提醒记录列表
	 * 
	 * @return 沟通人员信息集合
	 */
	public List<EmployeeInfo> queryCommunicationManageList(Map<String, Object> map) {
		return employeeInfoMapper.queryCommunicationManageList(map);
	}
	
	/**
	 * 删除约谈提醒记录
	 * 
	 * @return 
	 */
	public int deleteCommunicationRemind(String msgId){
		String[] strMsgId = msgId.split(",");
		int iCount=0;
		for(int i = 0; i < strMsgId.length; i++){
			iCount += employeeInfoMapper.deleteCommunicationRemind(Integer.parseInt(strMsgId[i]));
		}
		return iCount;
	}
	
	/**
	 * 查询人员约谈记录
	 * 
	 * @return 沟通人员信息集合
	 */
	public List<EmployeeTalkRecord> queryCommHistory(int employeeId){
		return commManageMapper.queryCommHistory(employeeId);
	}
	
	/**
	 * 根据ID查询约谈记录
	 * 
	 * @return 约谈信息集合
	 */
	public EmployeeTalkRecord getTalkRecordById(int talkId){
		return commManageMapper.getTalkRecordById(talkId);
	}
	
	/**
	 * 根据ID查询约谈内容
	 * 
	 * @return 约谈信息集合
	 */
	public List<EmployeeTalkRecord> queryTalkContent(int talkId){
		return commManageMapper.queryTalkContent(talkId);
	}
	
	/**
	 * 根据ID查询约谈记录
	 * 
	 * @return 约谈信息集合
	 */
	@Transactional
	public int addCommunicationRecord(EmployeeTalkRecord employeeTalkRecord, int companyId, String contentType){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("companyId", companyId);
		map.put("talkNum", "num");
		map.put("surveyType", employeeTalkRecord.getSurveyType());
		map.put("talkToOrganizationId", employeeTalkRecord.getTalkToOrganizationId());
		map.put("talkToOrganizationName", "部门");
		map.put("talkToPostId", employeeTalkRecord.getTalkToPostId());
		map.put("talkToPostName", "岗位");
		map.put("talkToEmployee", employeeTalkRecord.getTalkToEmployee());
		map.put("talkToEmployeeName", employeeTalkRecord.getTalkToEmployeeName());
		map.put("relationships", employeeTalkRecord.getRelationships());
		map.put("surveyOrganizationId", employeeTalkRecord.getSurveyOrganizationId());
		map.put("surveyOrganizationName", employeeTalkRecord.getSurveyOrganizationName());
		map.put("surveyPostId", employeeTalkRecord.getSurveyPostId());
		map.put("surveyPostName", employeeTalkRecord.getSurveyPostName());
		map.put("surveyEmployee", employeeTalkRecord.getSurveyEmployee());
		map.put("surveyEmployeeName", employeeTalkRecord.getSurveyEmployeeName());
		map.put("mainTalkOrganizationId", employeeTalkRecord.getMainTalkOrganizationId());
		map.put("mainTalkOrganizationName", employeeTalkRecord.getMainTalkOrganizationName());
		map.put("mainTalkPostId", employeeTalkRecord.getMainTalkPostId());
		map.put("mainTalkPostName", employeeTalkRecord.getMainTalkPostName());
		map.put("mainTalkEmployee", employeeTalkRecord.getMainTalkEmployee());
		map.put("mainTalkEmployeeName", employeeTalkRecord.getMainTalkEmployeeName());
		map.put("planTalkTime", employeeTalkRecord.getPlanTalkTime());
		map.put("startTime", employeeTalkRecord.getStartTime());
		map.put("endTime", employeeTalkRecord.getEndTime());
		map.put("talkType", employeeTalkRecord.getTalkType());
		map.put("talkPlace", employeeTalkRecord.getTalkPlace());
		map.put("talkEstimate", employeeTalkRecord.getTalkEstimate());
		map.put("stableProcess", employeeTalkRecord.getStableProcess());
		map.put("createTime", "2012-03-30");
		map.put("surveyEmployeeNum", "surveyNum");
		map.put("mainTalkEmployeeNum", "mainNum");
		map.put("talkId", "");
		int iFlag = commManageMapper.addCommunicationRecord(map);
		String strTalkId = (String) map.get("talkId");
		String[] strType = contentType.split(",");
		for(int i = 0; i < strType.length; i++){
			Map<String, Object> maps = new HashMap<String, Object>();
			maps.put("contentType", strType[i]);
			maps.put("content", employeeTalkRecord.getMsgContent());
			maps.put("talkId", strTalkId);
			commManageMapper.addEmployeeTalkContent(maps);
		}
		return iFlag;
	}
	
	/**
	 * 查询约谈信息总记录数
	 * 
	 * @return 约谈信息集合
	 */
	public int queryCommunicationActivtyCount(Map<String, Object> map){
		return commManageMapper.queryCommunicationActivtyCount(map);
	}
	
	/**
	 * 查询约谈信息列表 
	 * 
	 * @return 约谈信息集合
	 */
	public List<EmployeeTalkRecord> queryCommunicationActivtyList(Map<String, Object> map){
		return commManageMapper.queryCommunicationActivtyList(map);
	}

}
