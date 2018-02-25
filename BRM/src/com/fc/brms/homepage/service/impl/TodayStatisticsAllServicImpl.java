package com.fc.brms.homepage.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.fc.brms.common.domain.EmployeeTalkRecord;
import com.fc.brms.common.domain.QuestionTest;
import com.fc.brms.common.domain.TrainingTask;
import com.fc.brms.common.domain.UserResume;
import com.fc.brms.common.util.DateTools;
import com.fc.brms.common.util.Page;
import com.fc.brms.homepage.mapper.ITodayStatisticsAllMapper;
import com.fc.brms.homepage.service.ITodayStatisticsAllService;

@Service
public class TodayStatisticsAllServicImpl implements ITodayStatisticsAllService {
	@Resource
	private ITodayStatisticsAllMapper todayMapper;

	/**
	 * 今日面试
	 * 
	 * @param map
	 * @return
	 */
	public List<UserResume> findTodayInterview(Page page, Date bigTime,
			Date smallTime, String keyword,int userId) {
		if (bigTime == null && smallTime == null) {
			bigTime = DateTools.getTs(DateTools.getTomorrow());
			smallTime = DateTools.getTs(DateTools.getToday());
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bigTime", bigTime);
		map.put("smallTime", smallTime);
		map.put("userId", userId);
		map.put("keyword", keyword);
		map.put("limit", page.getLimit());
		return todayMapper.findTodayInterview(map);
	}

	/**
	 * 今天面试总条数
	 * 
	 * @param map
	 * @return
	 */
	public int findTodayInterviewCount(Date bigTime, Date smallTime,
			String keyword,int userId) {
		if (bigTime == null && smallTime == null) {
			bigTime = DateTools.getTs(DateTools.getTomorrow());
			smallTime = DateTools.getTs(DateTools.getToday());
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bigTime", DateTools.getTs(DateTools.getTomorrow()));
		map.put("smallTime", DateTools.getTs(DateTools.getToday()));
		map.put("userId", userId);
		map.put("keyword", keyword);
		return todayMapper.findTodayInterviewCount(map);
	}

	/**
	 * 今日入职
	 * 
	 * @param map
	 * @return
	 */
	public List<UserResume> findTodayJob(Page page) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bigTime", DateTools.getTs(DateTools.getTomorrow()));
		map.put("smallTime", DateTools.getTs(DateTools.getToday()));
		map.put("limit", page.getLimit());
		return todayMapper.findTodayJob(map);
	}

	/**
	 * 今天入职总条数
	 * 
	 * @param map
	 * @return
	 */
	public int findTodayJobCount() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bigTime", DateTools.getTs(DateTools.getTomorrow()));
		map.put("smallTime", DateTools.getTs(DateTools.getToday()));
		return todayMapper.findTodayJobCount(map);
	}

	/**
	 * 今日培训
	 * 
	 * @param map
	 * @return
	 */
	public List<TrainingTask> findTodayTraining(Page page,int userId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bigTime", DateTools.getTs(DateTools.getTomorrow()));
		map.put("smallTime", DateTools.getTs(DateTools.getToday()));
		map.put("userId", userId);
		map.put("limit", page.getLimit());
		return todayMapper.findTodayTraining(map);
	}

	/**
	 * 今日培训总条数
	 * 
	 * @param map
	 * @return
	 */
	public int findTodayTrainingCount(int userId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bigTime", DateTools.getTs(DateTools.getTomorrow()));
		map.put("smallTime", DateTools.getTs(DateTools.getToday()));
		map.put("userId", userId);
		return todayMapper.findTodayTrainingCount(map);
	}

	/**
	 * 今日调查
	 * 
	 * @param map
	 * @return
	 */
	public List<QuestionTest> findTodaySurvey(Page page,int userId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bigTime", DateTools.getTs(DateTools.getTomorrow()));
		map.put("smallTime", DateTools.getTs(DateTools.getToday()));
		map.put("userId", userId);
		map.put("limit", page.getLimit());
		return todayMapper.findTodaySurvey(map);
	}

	/**
	 * 今日调查总条数
	 * 
	 * @param map
	 * @return
	 */
	public int findTodaySurveyCount(int userId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bigTime", DateTools.getTs(DateTools.getTomorrow()));
		map.put("smallTime", DateTools.getTs(DateTools.getToday()));
		map.put("userId", userId);
		return todayMapper.findTodaySurveyCount(map);
	}

	/**
	 * 今日约谈
	 * 
	 * @param map
	 * @return
	 */
	public List<EmployeeTalkRecord> findTodayAppointments(Page page) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bigTime", DateTools.getTs(DateTools.getTomorrow()));
		map.put("smallTime", DateTools.getTs(DateTools.getToday()));
		map.put("limit", page.getLimit());
		return todayMapper.findTodayAppointments(map);
	}

	/**
	 * 今日约谈总条数
	 * 
	 * @param map
	 * @return
	 */
	public int findTodayAppointmentsCount() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bigTime", DateTools.getTs(DateTools.getTomorrow()));
		map.put("smallTime", DateTools.getTs(DateTools.getToday()));
		return todayMapper.findTodayAppointmentsCount(map);
	}

	public static void main(String[] args) {
		System.out.println(DateTools.getTs(DateTools.getTomorrow()));
		System.out.println(DateTools.getTs(DateTools.getToday()));
	}

}
