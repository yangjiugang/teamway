package com.fc.brms.broker.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.fc.brms.common.domain.TrainingAttachment;
import com.fc.brms.common.domain.TrainingContentType;
import com.fc.brms.common.domain.TrainingSchedule;
import com.fc.brms.common.domain.TrainingTask;
import com.fc.brms.common.domain.TrainingUsers;


public interface ITrainMapper {

	public List<TrainingTask> findTrainingTasks(@Param("limit")String limit,@Param("task")TrainingTask task);
	
	public int findTrainingTaskCount(@Param("task")TrainingTask task);
	
	public List<TrainingContentType> findTrainTypeList(@Param("limit")String limit);
	
	public int findTrainTypeCount();
	
	public void saveTrainType(TrainingContentType type);
	
	public void updateTrainType(TrainingContentType type);
	
	public void delTrainType(int typeId);
	
	public TrainingContentType findTrainTypeById(int typeId);
	
	public void saveAttachment(TrainingAttachment attachment);
	
	public void saveTrainTask(TrainingTask task);
	
	public void saveTrainingSchedule(TrainingSchedule schedule);
	
	public String findTrainTaskNextNo(@Param("today")String today);
	
	public void updateAttachment(@Param("id")int id,@Param("taskId")int taskId);
	
	public List<TrainingAttachment> findAttachmentByTaskId(int taskId);
	
	public List<TrainingSchedule> findTrainingScheduleByTaskId(int taskId);
	
	public TrainingTask findTaskById(int taskId);
	
	public void delTrainingAttachmentById(Integer Id);
	
	public void updateTrainTask(TrainingTask task);
	
	public void updateTrainingSchedule(TrainingSchedule schedule);
	
	public void updateTrainingTaskStatus(@Param("taskId")int taskId,@Param("status")int status);
	
	public void saveTrainUser(TrainingUsers user);
	
	public List<TrainingUsers> findTrainingUsers(int taskId);
	
	public void updateTrainTestTestId(@Param("taskId")int taskId,@Param("testId")int testId);
	
	public void trainPublish(TrainingTask task);
	
	public void delTrainingUsersById(int id);
	
	/**
	 * 添加并发送培训通知给员工
	 * 
	 * @param train
	 * @return
	 */
	int insertTrainEmployee(Map<String, Object> map);
}
