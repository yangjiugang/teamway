package com.fc.brms.broker.web;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fc.brms.broker.service.IEmployeePushService;
import com.fc.brms.broker.service.IQuestionLibraryService;
import com.fc.brms.broker.service.IQuestionPaperService;
import com.fc.brms.broker.service.IQuestionTestService;
import com.fc.brms.broker.service.ITrainService;
import com.fc.brms.common.domain.QuestionTest;
import com.fc.brms.common.domain.TrainingAttachment;
import com.fc.brms.common.domain.TrainingContentType;
import com.fc.brms.common.domain.TrainingSchedule;
import com.fc.brms.common.domain.TrainingTask;
import com.fc.brms.common.domain.TrainingUsers;
import com.fc.brms.common.util.CommonUtil;
import com.fc.brms.common.util.DownView;
import com.fc.brms.common.util.ExcelTemplateView;
import com.fc.brms.common.util.FileUtil;
import com.fc.brms.common.util.Page;
import com.fc.brms.common.util.SessionInfo;

@Controller
public class TrainController {

	@Resource
	private ITrainService trainService;
	@Resource
	private IQuestionTestService questionTestService;
	@Resource
	private IQuestionPaperService questionPaperService;
	@Resource
	private IQuestionLibraryService questionLibraryService;
	@Resource
	private IEmployeePushService employeePushService;
	
	@RequestMapping(value = "/trainManage")
	public String trainManage(){
		return "/broker/TrainManagement";
	}
	
	@RequestMapping(value = "/trainList")
	public String trainList(Model model,int taskStatus,String flag){
		model.addAttribute("organizations", CommonUtil.toJson(employeePushService.findOrganization()));
		model.addAttribute("taskStatus", taskStatus);
		model.addAttribute("flag",flag);
		return "/broker/TrainList";
	}
	
	@RequestMapping(value = "/trainLeft")
	public String trainLeft(){
		return "/broker/TrainLeft";
	}
	
	@RequestMapping(value = "/findTrainingTasks")
	@ModelAttribute("rows")
	public List<TrainingTask> findTrainingTasks(Page page,TrainingTask task){
		return trainService.findTrainingTasks(page, task);
	}
	
	/**
	 * 培训活动添加页面
	 * @return
	 */
	@RequestMapping(value = "/trainAdd")
	public String trainAdd(Model model){
		model.addAttribute("types", trainService.findTrainTypeList(null));
		return "/broker/TrainAdd";
	}
	/**
	 * 培训类型添加页面 
	 */
	@RequestMapping(value = "/trainTypeAdd")
	public String trainTypeAdd(){
		return "/broker/TrainType";
	}
	
	@RequestMapping("/trainType")
	public String trainType(){
		return "/broker/TrainTypeList";
	}
	
	@RequestMapping(value = "findTrainTypeList")
	@ModelAttribute("rows")
	public List<TrainingContentType> findTrainTypeList(Page page){
		return trainService.findTrainTypeList(page);
	}
	
	@RequestMapping(value = "/saveTrainType")
	public void saveTrainType(TrainingContentType type){
		trainService.saveTrainType(type);
	}
	
	@RequestMapping(value = "/updateTrainType")
	public void updateTrainType(TrainingContentType type){
		trainService.updateTrainType(type);
	}
	
	@RequestMapping(value = "/delTrainType")
	public void delTrainType(String ids){
		Integer[] idss = CommonUtil.getIntegers(ids);
		for(int id : idss){
			trainService.delTrainType(id);
		}
	}
	
	@RequestMapping(value = "/findTrainTypeById")
	public String findTrainTypeById(int typeId,Model model){
		model.addAttribute("type",trainService.findTrainTypeById(typeId));
		return "/broker/TrainType";
	}
	
	
	@RequestMapping(value = "/upLoadFile")
	@ResponseBody
	public String updateFile(@RequestParam("file") MultipartFile mFile,int taskId) throws IOException{
		String fileNames[] = FileUtil.getFileName(mFile.getOriginalFilename());
		String f = FileUtil.getPath() + File.separator + fileNames[0];
		FileUtil.saveFile(mFile.getInputStream(), f );
		TrainingAttachment attachment = new TrainingAttachment();
		attachment.setAttachmentPath(fileNames[1]);
		attachment.setCreateTime(new Date());
		attachment.setCreateUser(1);
		attachment.setTaskId(taskId);
		attachment.setFileName(mFile.getOriginalFilename());
		attachment.setCompanyId(1);
		trainService.saveAttachment(attachment);
		Map<String,String> map = new HashMap<String,String>(); 
		map.put("oldName", mFile.getOriginalFilename());
		map.put("newName", fileNames[1]);
		map.put("attachmentId", String.valueOf(attachment.getAttachmentId()));
		return CommonUtil.toJson(map);
	}
	
	@RequestMapping(value = "/downLoadFile")
	public ModelAndView downAppendix(String fileName){
		DownView view = new DownView(fileName);
		return new ModelAndView(view);
	}
	
	@RequestMapping(value = "/saveTrainTask")
	@ModelAttribute("taskId")
	public int saveTrainTask(TrainingTask task,String[] courseName,String[] teacher,
				Date[] scheduleStartTime,Date[] scheduleEndTime,String[] attachmentId,String employeeId) throws Exception{
		trainService.saveTrainTask(task);
		for(int i = 0; i < courseName.length; i++){
			TrainingSchedule schedule = new TrainingSchedule();
			schedule.setTaskId(task.getTaskId());
			schedule.setTeacher(teacher[i]);
			schedule.setCourseName(courseName[i]);
			schedule.setScheduleEndTime(scheduleEndTime[i]);
			schedule.setScheduleStartTime(scheduleStartTime[i]);
			schedule.setCompanyId(SessionInfo.getCompanyId(CommonUtil.getRequest()));
			trainService.saveTrainingSchedule(schedule);
		}
		if(attachmentId != null){
			for(int i = 0; i < attachmentId.length; i++){
				trainService.updateAttachment(Integer.parseInt(attachmentId[i]), task.getTaskId());
			}
		}
		Integer[] employeeIds = CommonUtil.getIntegers(employeeId);
		for(Integer e : employeeIds){
			TrainingUsers user = new TrainingUsers();
			user.setTaskId(task.getTaskId());
			user.setEmployeeId(e);
			user.setCompanyId(SessionInfo.getCompanyId(CommonUtil.getRequest()));
			trainService.saveTrainUser(user);
		}
		return task.getTaskId();
	}
	
	@RequestMapping(value = "/findTrainTaskById")
	public String findTrainTaskById(int taskId,Model model){
		TrainingTask task = trainService.findTaskById(taskId);
		task.setSchedules(trainService.findTrainingScheduleByTaskId(taskId));
		task.setTrainAttachments(trainService.findAttachmentByTaskId(taskId));
		task.setTrainingUsers(trainService.findTrainingUsers(taskId));
		model.addAttribute("task",task);
		model.addAttribute("types", trainService.findTrainTypeList(null));
		return "/broker/TrainAdd";
	}
	
	@RequestMapping(value = "/delFile")
	public void delFile(String fileName,Integer id){
		trainService.delTrainingAttachmentById(id);
		FileUtil.delFile(FileUtil.getPath() + File.separator + fileName);
	}
	
	@RequestMapping(value = "/updateTrainTask")
	public void updateTrainTask(TrainingTask task,String[] scheduleId,String[] courseName,String[] teacher,
			Date[] scheduleStartTime,Date[] scheduleEndTime,String employeeId) throws Exception{
		trainService.updateTrainTask(task);
		for(int i = 0; i < courseName.length; i++){
			TrainingSchedule schedule = new TrainingSchedule();
			schedule.setScheduleId(Integer.parseInt(scheduleId[i]));
			schedule.setTaskId(task.getTaskId());
			schedule.setTeacher(teacher[i]);
			schedule.setCourseName(courseName[i]);
			schedule.setScheduleEndTime(scheduleEndTime[i]);
			schedule.setScheduleStartTime(scheduleStartTime[i]);
			if("0".equals(scheduleId[i])){
				schedule.setCompanyId(1);
				trainService.saveTrainingSchedule(schedule);
			}else{
				trainService.updateTrainingSchedule(schedule);
			}
		}
		List<TrainingUsers> users = trainService.findTrainingUsers(task.getTaskId());
		Integer[] employeeIds = CommonUtil.getIntegers(employeeId);
		for(TrainingUsers user : users){
			trainService.delTrainingUsersById(user.getId());
		}
		for(Integer e : employeeIds){
			TrainingUsers user = new TrainingUsers();
			user.setTaskId(task.getTaskId());
			user.setEmployeeId(e);
			user.setCompanyId(SessionInfo.getCompanyId(CommonUtil.getRequest()));
			trainService.saveTrainUser(user);
		}
		/*
		boolean flag = true;
		int eid = 0;
		label:for(TrainingUsers user : users){
				flag = true;
				for(Integer e : employeeIds){
					if(user.getEmployeeId() == e){
						continue label;
					}else{
						flag = false;
						eid = e;
						break;
					}
				}
				if(flag){
					
				}
			 }
		*/
		
	}
	
	@RequestMapping(value = "/delTainingTask")
	public void delTainingTask(String ids){
			Integer[] idss = CommonUtil.getIntegers(ids);
			for(Integer taskId : idss){
				trainService.updateTrainingTaskStatus(taskId, 3);
			}
	}
	
	@RequestMapping(value = "/findTrainTaskDetail")
	public String findTrainTaskDetail(int taskId,Model model){
		TrainingTask task = trainService.findTaskById(taskId);
		model.addAttribute("task", task);
		model.addAttribute("types", trainService.findTrainTypeList(null));
		
		model.addAttribute("libTypes", CommonUtil.toJson(questionLibraryService.findQuestionType()));
		QuestionTest test = questionTestService.getQuestionTestByTestId(task.getTestId());
		if(test != null){
			model.addAttribute("paper", questionPaperService.getQuestionPaperById(test.getPaperId()));
		}
		return "/broker/TrainTaskDetail";
	}
	
	@RequestMapping(value = "/findTrainingScheduleByTaskId")
	@ModelAttribute("rows")
	public List<TrainingSchedule> findTrainingScheduleByTaskId(int taskId){
		return trainService.findTrainingScheduleByTaskId(taskId);
	}
	
	@RequestMapping(value = "/findTrainingUsers")
	@ModelAttribute("rows")
	public List<TrainingUsers> findTrainingUsers(int taskId){
		return trainService.findTrainingUsers(taskId);
	}
	
	@RequestMapping(value="/trainPublishPage")
	public String trainPublishPage(int taskId,Model model){
		model.addAttribute("taskId", taskId);
		return "/broker/TrainPublish";
	}
	
	@RequestMapping(value = "/trainPublish")
	public void trainPublish(TrainingTask task){
		trainService.trainPublish(task);
	}
	/**
	 * 测试下载模板
	 */
	@RequestMapping(value = "/exportTemplate")
	public ModelAndView exportTemplate(){
		return new ModelAndView(new ExcelTemplateView("xxx.xls"));
	}
}
