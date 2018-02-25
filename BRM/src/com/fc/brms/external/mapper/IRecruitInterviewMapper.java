package com.fc.brms.external.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.fc.brms.common.domain.RecruitInterview;
import com.fc.brms.common.domain.RecruitInterviewProcess;
import com.fc.brms.common.domain.RecruitOffer;
import com.fc.brms.common.domain.UserResumeExtend;
import com.fc.brms.common.domain.UserTrackRecord;
import com.fc.brms.common.domain.UserTrackRecordContent;

public interface IRecruitInterviewMapper {
	public List<RecruitInterview> getInterviewByUserId(int userId);
	public List<UserTrackRecordContent> getTrackContentById(int trackId);
	
	/**
	 * 新增面试
	 * @param recruitInterviewProcess
	 * @return
	 */
	public int addNewInterview(RecruitInterviewProcess recruitInterviewProcess);
	/**
	 * 新增面试
	 * @param recruitInterviewProcess
	 * @return
	 */
	public int addNewInterviewByRipId(RecruitInterview interview);
	
	/**
	 * 是否已经发送过招聘面试
	 * @param userId
	 * @return
	 */
	public String isInInterview(Map<String, Object> map);
	
	/**
	 * 更新当前面试次数
	 * @param interviewId
	 * @return
	 */
	public int updateInterviewCnt(int interviewId);
	
	/**
	 * 根据ID查询面试
	 * @param userId
	 * @return
	 */
	public RecruitInterview findInterviewByUserId(Map<String, Object> map);
	
	/**
	 * 更新面试过程
	 * @param interviewProcess
	 * @return
	 */
	public int updateInterviewProcess(RecruitInterviewProcess interviewProcess);
	
	/**
	 * 查询已发起的面试通知
	 * @param interviewProcess
	 * @return
	 */
	public int findIsStutsProcessById(RecruitInterviewProcess interviewProcess);
	
	/**
	 * 插入面试过程
	 * @param record
	 * @return
	 */
	public int addNewUserTrackRecord(UserTrackRecord record);
	
	/**
	 * 新增问题-回答
	 * @param content
	 * @return
	 */
	public int addNewTrackContent(UserTrackRecordContent content);
	
	/**
	 * 更新免谈记录标示
	 * @param interviewProcess
	 * @return
	 */
	public int updateTrackId(RecruitInterviewProcess interviewProcess);
	
	/**
	 * 更新匹配
	 * @param interview
	 * @return
	 */
	public int updateInterviewByTtask(RecruitInterview interview);
	
	/**
	 * 根据招聘任务ID 得到相关简历
	 * @param taskId
	 * @return
	 */
	public List<RecruitInterview> getInterviewByTaskId(@Param("taskId") int taskId,@Param("companyId") int companyId);
	
	/**
	 *  得到相关简历
	 * 
	 * @return
	 */
	public List<RecruitInterview> getUserResume();

	/**
	 * 增加简历匹配数+1
	 * @param taskId
	 * @return
	 */
	public int updateTaskMatchCnt(int taskId);
	
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
