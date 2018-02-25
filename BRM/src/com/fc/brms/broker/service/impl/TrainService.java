package com.fc.brms.broker.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fc.brms.broker.mapper.ITrainMapper;
import com.fc.brms.broker.service.ITrainService;
import com.fc.brms.common.domain.TrainingAttachment;
import com.fc.brms.common.domain.TrainingContentType;
import com.fc.brms.common.domain.TrainingSchedule;
import com.fc.brms.common.domain.TrainingTask;
import com.fc.brms.common.domain.TrainingUsers;
import com.fc.brms.common.util.CommonUtil;
import com.fc.brms.common.util.DateTools;
import com.fc.brms.common.util.Page;
import com.fc.brms.common.util.SessionInfo;


@Service
public class TrainService implements ITrainService{
	
	@Resource
	public ITrainMapper trainMapper;
	
	@Override
	public List<TrainingTask> findTrainingTasks(Page page, TrainingTask task) {
		page.setRecords(findTrainingTaskCount(task));
		return trainMapper.findTrainingTasks(page.getLimit(), task);
	}
	
	@Override
	public int findTrainingTaskCount(TrainingTask task) {
		return trainMapper.findTrainingTaskCount(task);
	}
	
	@Override
	public List<TrainingContentType> findTrainTypeList(Page page) {
		String limit = null;
		if(page != null){
			limit = page.getLimit();
		}
		return trainMapper.findTrainTypeList(limit);
	}
	
	@Override
	public int findTrainTypeCount() {
		return trainMapper.findTrainTypeCount();
	}
	
	@Override
	public void delTrainType(int typeId) {
		trainMapper.delTrainType(typeId);
	}
	
	@Override
	public void saveTrainType(TrainingContentType type) {
		trainMapper.saveTrainType(type);
	}
	
	@Override
	public void updateTrainType(TrainingContentType type) {
		trainMapper.updateTrainType(type);
	}
	
	@Override
	public TrainingContentType findTrainTypeById(int typeId) {
		return trainMapper.findTrainTypeById(typeId);
	}
	
	@Override
	public void saveAttachment(TrainingAttachment attachment) {
		trainMapper.saveAttachment(attachment);
	}
	
	@Override
	public void saveTrainTask(TrainingTask task) throws Exception {
		task.setCompanyId(SessionInfo.getCompanyId(CommonUtil.getRequest()));
		task.setCreateUser(SessionInfo.getVisitorId(CommonUtil.getRequest()));
		task.setOrganizationId(SessionInfo.getOrganizationId(CommonUtil.getRequest()));
		task.setOrganizationalUnit(SessionInfo.getOrganizationName(CommonUtil.getRequest()));
		task.setCreateTime(new Date());
		task.setTaskNum(findTrainTaskNextNo());
		trainMapper.saveTrainTask(task);
	}
	
	@Override
	public void saveTrainingSchedule(TrainingSchedule schedule) {
		trainMapper.saveTrainingSchedule(schedule);
	}
	
	@Override
	public String findTrainTaskNextNo() {
		String ts = DateTools.getTodays().substring(2,8);
		String PX = "PX";
		String no = PX + ts;
		String result = trainMapper.findTrainTaskNextNo(no);
		if(result == null){
			no += "0001";
		}else{
			String maxno = result.substring(2, result.length());
			maxno = String.valueOf((Integer.parseInt(maxno) + 1));
			no = PX + ts + maxno.substring(6,maxno.length());
		}
		return no;
	}
	
	@Override
	public void updateAttachment(int id, int taskId) {
		trainMapper.updateAttachment(id, taskId);
	}
	
	@Override
	public List<TrainingAttachment> findAttachmentByTaskId(int taskId) {
		return trainMapper.findAttachmentByTaskId(taskId);
	}
	
	@Override
	public TrainingTask findTaskById(int taskId) {
		return trainMapper.findTaskById(taskId);
	}
	
	@Override
	public List<TrainingSchedule> findTrainingScheduleByTaskId(int taskId) {
		return trainMapper.findTrainingScheduleByTaskId(taskId);
	}
	
	@Override
	public void delTrainingAttachmentById(Integer Id) {
		trainMapper.delTrainingAttachmentById(Id);
	}
	
	@Override
	public void updateTrainTask(TrainingTask task) {
		trainMapper.updateTrainTask(task);
	}
	
	@Override
	public void updateTrainingSchedule(TrainingSchedule schedule) {
		trainMapper.updateTrainingSchedule(schedule);
	}
	
	@Override
	public void updateTrainingTaskStatus(int taskId, int status) {
		trainMapper.updateTrainingTaskStatus(taskId, status);
	}
	
	@Override
	public void saveTrainUser(TrainingUsers user) {
		trainMapper.saveTrainUser(user);
	}
	
	@Override
	public List<TrainingUsers> findTrainingUsers(int taskId) {
		return trainMapper.findTrainingUsers(taskId);
	}
	
	@Override
	public void updateTrainTestTestId(int taskId, int testId) {
		trainMapper.updateTrainTestTestId(taskId, testId);
	}
	
	@Override
	public void trainPublish(TrainingTask task) {
		trainMapper.trainPublish(task);
	}
	
	@Override
	public void delTrainingUsersById(int id) {
		trainMapper.delTrainingUsersById(id);
	}

	/**
	 * 添加并发送培训通知给员工
	 * 
	 * @param train
	 * @return
	 */
	public int insertTrainEmployee(TrainingUsers train, String employeeId) {
		Map<String, Object> map = new HashMap<String, Object>();
		int iCount = -1;
		String[] strEmployee = employeeId.split(",");
		for(int i = 0; i < strEmployee.length; i++){
			map.put("companyId", train.getCompanyId());
			map.put("employeeId", strEmployee[i]);
			map.put("taskId", train.getTaskId());
			iCount = trainMapper.insertTrainEmployee(map);
		}
		return iCount;
	}
}
