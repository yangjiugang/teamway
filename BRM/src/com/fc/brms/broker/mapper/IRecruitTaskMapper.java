package com.fc.brms.broker.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.fc.brms.common.domain.RecruitTask;

/**
 * 
 * @author 邓祥
 * 招聘任务 数据操作类
 * @version 2012-3-28
 */

public interface IRecruitTaskMapper {
	

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
	public List<RecruitTask> recruitTaskList(@Param("taskStatus") int taskStatus,@Param("companyId")int companyId);
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
	public List<RecruitTask> recruitTaskListByPage(Map<String, Object> map);
	
	/**
	 * 查询进行中招聘任务  总记录
	 * @param map
	 * @return
	 */
	public int recruitTaskCountByPage(Map<String, Object> map);
	
	/**
	 * 增加简历匹配数+1
	 * @param taskId
	 * @return
	 */
	public int updateTaskMatchCnt(int taskId);
	
}
