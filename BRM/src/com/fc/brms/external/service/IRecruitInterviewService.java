package com.fc.brms.external.service;

import java.util.List;

import com.fc.brms.common.domain.RecruitInterview;
import com.fc.brms.common.domain.RecruitInterviewProcess;
import com.fc.brms.common.domain.RecruitOffer;
import com.fc.brms.common.domain.UserResumeExtend;
import com.fc.brms.common.domain.UserTrackRecord;
import com.fc.brms.common.domain.UserTrackRecordContent;

public interface IRecruitInterviewService {
	public List<RecruitInterview> getInterviewByUserId(int userId);

	/**
	 * 新增面试
	 * @param recruitInterviewProcess
	 * @return
	 */
	public int addNewInterviewByRipId(int userId,int taskId,RecruitInterviewProcess recruitInterviewProcess);
	
	/**
	 * 更新面试过程
	 * @param interviewProcess
	 * @return
	 */
	public int updateInterviewProcess(RecruitInterviewProcess interviewProcess,int userId,int taskId, UserTrackRecord record,UserTrackRecordContent content);
	
	/**
	 * 新增问题-回答
	 * @param content
	 * @return
	 */
	public int addNewTrackContent(UserTrackRecordContent content);
	
	/**
	 * 根据招聘任务ID 得到相关简历
	 * @param taskId
	 * @return
	 */
	public List<RecruitInterview> getInterviewByTaskId(int taskId,int companyId);
	
	/**
	 *  得到相关简历
	 * 
	 * @return
	 */
	public List<RecruitInterview> getUserResume();
	
	/**
	 * 更新匹配
	 * @param interview
	 * @return
	 */
	public int updateInterviewByTtask(RecruitInterview interview);
	
	/**
	 * 新增面试通知
	 * @param offer
	 * @return
	 */
	public int addNewOffer(RecruitOffer offer);
	

	/**
	 * 获得经纪人的兴趣爱好
	 * @param userId
	 * @return
	 */
	public UserResumeExtend getUserHobbiesById(int userId);
}
