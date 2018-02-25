package com.fc.brms.broker.service;

import java.util.List;
import java.util.Map;

import com.fc.brms.common.domain.RecruitTask;
import com.fc.brms.common.util.Page;

/**
 * 
 * @author 邓祥
 * 招聘任务服务类
 * @version 2012-3-28
 */
public interface IRecruitTaskService {

	
	/**
	 * 保存
	 * @param recruitTask
	 */
	public void insertRecruitTask(RecruitTask recruitTask);
	/**
	 * 查询
	 * @param taskStatus
	 * @return
	 */
	public List<RecruitTask> recruitTaskList(int taskStatus,int companyId);
	/**
	 * 查询记录
	 * @param taskStatus
	 * @return
	 */
	public int recruitTaskCount(int taskStatus);
	/**
	 * 删除
	 * @param taskId
	 */
	public void delRecruitTask(int taskId);
	/**
	 * 根据ID查找
	 * @param taskId
	 * @return
	 */
	public RecruitTask recruitTaskById(int taskId);
	/**
	 * 更新
	 * @param recruitTask
	 */
	public void updateRecruitTask(RecruitTask recruitTask);
	
	/**
	 * 终止招聘任务
	 * @param taskId
	 */
	public void closeRecruitTask(int taskId);
	
	
	/**
	 * 查询进行中招聘任务
	 * @param map
	 * @return
	 */
	public List<RecruitTask> recruitTaskListByPage(int userId,Page page);
}
