package com.fc.brms.broker.service;

import java.util.List;

import com.fc.brms.common.domain.TrainingAttachment;
import com.fc.brms.common.domain.TrainingContentType;
import com.fc.brms.common.domain.TrainingSchedule;
import com.fc.brms.common.domain.TrainingTask;
import com.fc.brms.common.domain.TrainingUsers;
import com.fc.brms.common.util.Page;



public interface ITrainService {
	
	/**
	 * 查询所有的培训任务
	 * @return
	 */
	public List<TrainingTask> findTrainingTasks(Page page,TrainingTask task);
	/**
	 * 查询培训任务的数量
	 * @param task
	 * @return
	 */
	public int findTrainingTaskCount(TrainingTask task);
	/**
	 * 查询培训任务类型
	 * @param page
	 * @return
	 */
	public List<TrainingContentType> findTrainTypeList(Page page);
	/**
	 * 查询培训任务类型记录
	 * @return
	 */
	public int findTrainTypeCount();
	/**
	 * 保存培训类型
	 * @param type
	 */
	public void saveTrainType(TrainingContentType type);
	/**
	 * 更新培训类型
	 * @param type
	 */
	public void updateTrainType(TrainingContentType type);
	/**
	 * 逻辑删除培训类型
	 * @param typeId
	 */
	public void delTrainType(int typeId);
	/**
	 * 根据ID查询培训类型
	 */
	public TrainingContentType findTrainTypeById(int typeId);
	/**
	 * 保存上传附件信息
	 * @param attachment
	 */
	public void saveAttachment(TrainingAttachment attachment);
	/**
	 * 保存培训任务
	 * @param task
	 */
	public void saveTrainTask(TrainingTask task)throws Exception;
	/**
	 * 保存课题
	 * @param schedule
	 */
	public void saveTrainingSchedule(TrainingSchedule schedule);
	/**
	 * 查找培训活动编号
	 * @return
	 */
	public String findTrainTaskNextNo();
	/**
	 * 更新附件表TaskId
	 * @param id
	 * @param taskId
	 */
	public void updateAttachment(int id,int taskId);
	/**
	 * 根据培训任务Id查询 相关附件 
	 * @param taskId
	 * @return
	 */
	public List<TrainingAttachment> findAttachmentByTaskId(int taskId);
	/**
	 * 根据培训任务Id查询 相关附件
	 * @param taskId
	 * @return
	 */
	public List<TrainingSchedule> findTrainingScheduleByTaskId(int taskId);
	/**
	 * 根据ID查询培训任务
	 * @param taskId
	 * @return
	 */
	public TrainingTask findTaskById(int taskId);
	/**
	 * 根据ID删除附件
	 * @param Id
	 */
	public void delTrainingAttachmentById(Integer Id);
	/**
	 * 修改培训活动
	 * @param attachment
	 */
	public void updateTrainTask(TrainingTask task);
	/**
	 * 修改培训安排
	 * @param schedule
	 */
	public void updateTrainingSchedule(TrainingSchedule schedule);
	/**
	 * 修改状态
	 * @param taskId
	 * @param status
	 */
	public void updateTrainingTaskStatus(int taskId,int status);
	/**
	 * 保存培训对象
	 * @param user
	 */
	public void saveTrainUser(TrainingUsers user);
	/**
	 * 查询培训对象
	 * @param taskId
	 * @return
	 */
	public List<TrainingUsers> findTrainingUsers(int taskId);
	/**
	　 *  　修改培训关联的活动
	 * @param taskId
	 * @param testId
	 */
	public void updateTrainTestTestId(int taskId,int testId);
	/**
	 * 发布
	 * @param task
	 */
	public void trainPublish(TrainingTask task);
	/**
	 *  删除培训对象
	 * @param id
	 */
	public void delTrainingUsersById(int id);
	
	/**
	 * 添加并发送培训通知给员工
	 * 
	 * @param train
	 * @return
	 */
	int insertTrainEmployee(TrainingUsers train, String employeeId);
}
