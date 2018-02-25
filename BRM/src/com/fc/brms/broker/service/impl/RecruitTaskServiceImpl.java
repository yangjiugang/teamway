package com.fc.brms.broker.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fc.brms.broker.mapper.IRecruitTaskMapper;
import com.fc.brms.broker.service.IRecruitTaskService;
import com.fc.brms.common.domain.RecruitTask;
import com.fc.brms.common.util.Page;

/**
 * 
 * @author 邓祥
 * 招聘任务 实现类
 * @version 2012-3-28
 */

@Service
public class RecruitTaskServiceImpl implements IRecruitTaskService{
	
	@Resource
	private IRecruitTaskMapper recruitTaskMapper ;
	
	@Override
	public void delRecruitTask(int taskId) {
		recruitTaskMapper.delRecruitTask(taskId);
		
	}
	
	@Override
	public RecruitTask recruitTaskById(int taskId) {
		
		return recruitTaskMapper.recruitTaskById(taskId);
	}
	
	@Override
	public int recruitTaskCount(int taskStatus) {
		
		return recruitTaskMapper.recruitTaskCount(taskStatus);
	}
	
	@Override
	public List<RecruitTask> recruitTaskList(int taskStatus,int companyId) {
		
		return recruitTaskMapper.recruitTaskList(taskStatus,companyId);
	}
	
	@Override
	public void insertRecruitTask(RecruitTask recruitTask) {
		recruitTaskMapper.insertRecruitTask(recruitTask);
		
	}
	
	@Override
	public void updateRecruitTask(RecruitTask recruitTask) {
		
		recruitTaskMapper.updateRecruitTask(recruitTask);
	}
	
	@Override
	public void closeRecruitTask(int taskId) {
		
		recruitTaskMapper.closeRecruitTask(taskId);
		
	}

	@Override
	public List<RecruitTask> recruitTaskListByPage(int userId,Page page) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		int count = recruitTaskMapper.recruitTaskCountByPage(map);
		page.setRecords(count);
		map.put("limit", page.getLimit());
		List<RecruitTask>  recruitTasks = recruitTaskMapper.recruitTaskListByPage(map);
		return recruitTasks;
	}
}
