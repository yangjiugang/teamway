package com.fc.brms.external.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.brms.common.domain.RecruitInterview;
import com.fc.brms.common.domain.RecruitInterviewProcess;
import com.fc.brms.common.domain.RecruitOffer;
import com.fc.brms.common.domain.UserResumeExtend;
import com.fc.brms.common.domain.UserTrackRecord;
import com.fc.brms.common.domain.UserTrackRecordContent;
import com.fc.brms.common.util.DateTools;
import com.fc.brms.common.util.mail.MailActivate;
import com.fc.brms.external.mapper.IRecruitInterviewMapper;
import com.fc.brms.external.service.IRecruitInterviewService;

@Service
public class RecruitInterviewServiceImpl implements IRecruitInterviewService {

	@Resource
	private IRecruitInterviewMapper interviewMapper;
	
	@Transactional(readOnly=true)
	public List<RecruitInterview> getInterviewByUserId(int userId) {
		List<RecruitInterview> interviews = interviewMapper.getInterviewByUserId(userId);
		for (int i = 0; i < interviews.size(); i++) {
			
			if(interviews.get(i)!=null){
				RecruitInterview obj = interviews.get(i);
				if(obj.getRecruitInterviewProcess()!=null){
					int trackId =obj.getRecruitInterviewProcess().getTrackId();
					if(trackId!=0 && obj.getRecruitInterviewProcess().getUserTrackRecord()!=null){
						List<UserTrackRecordContent> contents = interviewMapper.getTrackContentById(trackId);
						obj.getRecruitInterviewProcess().getUserTrackRecord().setContents(contents);
					}
				}
			}
		}
		return interviews;
	}


	@Transactional
	public int addNewInterviewByRipId(int userId,int taskId,RecruitInterviewProcess recruitInterviewProcess) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("taskId", taskId);
		
		RecruitInterview interview = interviewMapper.findInterviewByUserId(map);
		//String isInter = interviewMapper.isInInterview(map);		//check is data in table
		
		int isAdd = -1;
		if(interview!=null){
			recruitInterviewProcess.setTrackId(interview.getTaskId());
			recruitInterviewProcess.setCompanyId(interview.getCompanyId());
			recruitInterviewProcess.setInterviewTime(DateTools.dateToHour());	//计划面试时间
			recruitInterviewProcess.setInterviewType(0);
			recruitInterviewProcess.setInterviewersId(0);
			recruitInterviewProcess.setInterviewersName("");
			recruitInterviewProcess.setInterviewers("");
			recruitInterviewProcess.setInterviewResult(0);
			
			//发起面试通知
			recruitInterviewProcess.setInterviewId(interview.getInterviewId());
			isAdd = interviewMapper.addNewInterview(recruitInterviewProcess);
		}else{
			return -2;
		}
		
		return isAdd;
	}
	
	private boolean checkStr_IsNaN(String str){
		if(!"".equals(str) && str!=null){
			try{
				Integer.parseInt(str);
			}catch (NumberFormatException ex) {
				return false;
			}
			return true;
		}else
			return false;
	}


	@Transactional
	public int updateInterviewProcess(RecruitInterviewProcess interviewProcess,
			int userId,int taskId, UserTrackRecord record,UserTrackRecordContent content) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("taskId",taskId );
		RecruitInterview interview = interviewMapper.findInterviewByUserId(map);
		int isAdd = -3;
		//是否匹配过招聘任务?
		if(interview!=null){
			interviewProcess.setCompanyId(interview.getCompanyId());
			interviewProcess.setInterviewId(interview.getInterviewId());
			
			//查询是否对该轮面试发起过匹配任务
			int isStatus = interviewMapper.findIsStutsProcessById(interviewProcess);
			if(isStatus<0)
				return -2;
			
			int isProcess = interviewMapper.updateInterviewProcess(interviewProcess);
			if(isProcess>0){
				isAdd = interviewMapper.addNewUserTrackRecord(record);
				if(isAdd>0){
					int trackId = record.getTrackId();
					interviewProcess.setTrackId(trackId);
					isAdd = interviewMapper.updateTrackId(interviewProcess);
					isAdd = interviewMapper.addNewTrackContent(content);
				}
			}
		}
		return isAdd;
	}


	@Transactional
	public int addNewTrackContent(UserTrackRecordContent content) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<RecruitInterview> getInterviewByTaskId(int taskId, int companyId) {
		
		return interviewMapper.getInterviewByTaskId(taskId,companyId);
	}

	@Override
	public List<RecruitInterview> getUserResume() {
		
		return interviewMapper.getUserResume();
	}


	@Transactional
	public int updateInterviewByTtask(RecruitInterview interview) {
		int isAdd = interviewMapper.updateInterviewByTtask(interview);
		if(isAdd>0)
			isAdd = interviewMapper.updateTaskMatchCnt(interview.getTaskId());
		return isAdd;
	}
	
	@Transactional
	public int addNewOffer(RecruitOffer offer) {
		int isAdd = -1;
		if(offer!=null){
			isAdd = interviewMapper.addNewOffer(offer);
			MailActivate.sendVisitorFansEmail(offer.getEmail(), offer.getUserName(), offer);
		}
		return isAdd;
	}

	@Transactional(readOnly=true)
	public UserResumeExtend getUserHobbiesById(int userId) {
		return interviewMapper.getUserHobbiesById(userId);
	}
}
