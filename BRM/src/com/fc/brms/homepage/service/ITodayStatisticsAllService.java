package com.fc.brms.homepage.service;

import java.util.Date;
import java.util.List;

import com.fc.brms.common.domain.EmployeeTalkRecord;
import com.fc.brms.common.domain.QuestionTest;
import com.fc.brms.common.domain.TrainingTask;
import com.fc.brms.common.domain.UserResume;
import com.fc.brms.common.util.Page;

public interface ITodayStatisticsAllService {
	/**
	 * 今日面试
	 * 
	 * @param map
	 * @return
	 */
	public List<UserResume> findTodayInterview(Page page,Date bigTime,Date smallTime,String keyword,int userId);

	/**
	 * 今天面试总条数
	 * 
	 * @param map
	 * @return
	 */
	public int findTodayInterviewCount(Date bigTime,Date smallTime,String keyword,int userId);

	/**
	 * 今日入职
	 * 
	 * @param map
	 * @return
	 */
	public List<UserResume> findTodayJob(Page page);

	/**
	 * 今天入职总条数
	 * 
	 * @param map
	 * @return
	 */
	public int findTodayJobCount();

	/**
	 * 今日培训
	 * 
	 * @param map
	 * @return
	 */
	public List<TrainingTask> findTodayTraining(Page page,int userId);

	/**
	 * 今日培训总条数
	 * 
	 * @param map
	 * @return
	 */
	public int findTodayTrainingCount(int userId);
	
	/**
	 * 今日调查
	 * 
	 * @param map
	 * @return
	 */
	public List<QuestionTest> findTodaySurvey(Page page,int userId);

	/**
	 * 今日调查总条数
	 * 
	 * @param map
	 * @return
	 */
	public int findTodaySurveyCount(int userId);
	
	/**
     * 今日约谈
     * @param map
     * @return
     */
    public List<EmployeeTalkRecord> findTodayAppointments (Page page);
  
    /**
     * 今日约谈总条数
     * @param map
     * @return
     */
    public int findTodayAppointmentsCount();

}
