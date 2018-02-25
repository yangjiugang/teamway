package com.fc.brms.homepage.mapper;

import java.util.List;
import java.util.Map;

import com.fc.brms.common.domain.EmployeeTalkRecord;
import com.fc.brms.common.domain.QuestionTest;
import com.fc.brms.common.domain.TrainingTask;
import com.fc.brms.common.domain.UserResume;

public interface ITodayStatisticsAllMapper {
   
	/**
	 * 今日面试
	 * @param map
	 * @return
	 */
   public List<UserResume> findTodayInterview(Map<String, Object> map);
   
   /**
    * 今天面试总条数 
    * @param map
    * @return
    */
   public int findTodayInterviewCount(Map<String, Object> map);

   /**
	 * 今日入职
	 * @param map
	 * @return
	 */
  public List<UserResume> findTodayJob(Map<String, Object> map);
  
  /**
 	 * 今日入职总条数
 	 * @param map
 	 * @return
 	 */
  public int findTodayJobCount(Map<String, Object> map);
  
  /**
   * 今日培训
   * @param map
   * @return
   */
  public List<TrainingTask> findTodayTraining(Map<String, Object> map);
  
  /**
   * 今日培训总条数
   * @param map
   * @return
   */
  public int findTodayTrainingCount(Map<String, Object> map);
  
  /**
   * 今日调查
   * @param map
   * @return
   */
  public List<QuestionTest> findTodaySurvey(Map<String, Object> map);
  
  /**
   * 今日调查总条数
   * @param map
   * @return
   */
  public int findTodaySurveyCount(Map<String, Object> map);
  
  /**
   * 今日约谈
   * @param map
   * @return
   */
  public List<EmployeeTalkRecord> findTodayAppointments (Map<String, Object> map);
  
  /**
   * 今日约谈总条数
   * @param map
   * @return
   */
  public int findTodayAppointmentsCount (Map<String, Object> map);
  
  /**
   * 今日受访
   * @param map
   * @return
   */
  public List<EmployeeTalkRecord> findTodaySiuhong (Map<String, Object> map);
  
  /**
   * 今日受访总条数
   * @param map
   * @return
   */
  public int findTodaySiuhongCount (Map<String, Object> map);
  
  
}
