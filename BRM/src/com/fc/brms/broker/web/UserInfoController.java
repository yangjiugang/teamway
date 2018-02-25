package com.fc.brms.broker.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fc.brms.broker.service.IAppraisalManagementService;
import com.fc.brms.broker.service.IEmployeeInfoService;
import com.fc.brms.broker.service.IRecruitTaskService;
import com.fc.brms.broker.service.IRewardPunishmentService;
import com.fc.brms.common.domain.CfgJobGrade;
import com.fc.brms.common.domain.CfgJobLevel;
import com.fc.brms.common.domain.CfgPost;
import com.fc.brms.common.domain.CfgSalaryLevel;
import com.fc.brms.common.domain.EmployeeAppraisal;
import com.fc.brms.common.domain.EmployeeCheckingIn;
import com.fc.brms.common.domain.EmployeeContrack;
import com.fc.brms.common.domain.EmployeeFamilyInfo;
import com.fc.brms.common.domain.EmployeeInfo;
import com.fc.brms.common.domain.EmployeeRewardPunishment;
import com.fc.brms.common.domain.EmployeeTalkRecord;
import com.fc.brms.common.domain.SalarySocialSecurity;
import com.fc.brms.common.domain.SalarySocialSecuritySusbmit;
import com.fc.brms.common.domain.TrainingTask;
import com.fc.brms.common.domain.UserEduInfo;
import com.fc.brms.common.domain.UserProjectExperience;
import com.fc.brms.common.domain.UserResume;
import com.fc.brms.common.domain.UserResumeExtend;
import com.fc.brms.common.domain.UserSkills;
import com.fc.brms.common.domain.UserWorkExperience;
import com.fc.brms.common.util.Page;
import com.fc.brms.external.service.IRecruitInterviewService;
import com.fc.brms.external.service.IUserEduInfoService;
import com.fc.brms.external.service.IUserInfoService;
import com.fc.brms.external.service.IUserProjectExperienceService;
import com.fc.brms.external.service.IUserResumeService;
import com.fc.brms.external.service.IUserSkillsService;
import com.fc.brms.external.service.IUserWorkExperienceService;

@Controller
public class UserInfoController {

	@Resource
	private IRecruitInterviewService interviewService;
	@Resource
	private IUserResumeService iUserResumeService;
	@Resource 
	private IUserWorkExperienceService experienceService;
	@Resource
	private IUserEduInfoService eduInfoService;
	@Resource
	private IUserProjectExperienceService projectExperienceService;
	@Resource
	private IUserSkillsService skillsService;
	@Resource
	private IUserInfoService infoService;
	@Resource
	private IEmployeeInfoService employeeInfoService;
	@Resource
	private IAppraisalManagementService appraisalManagementService;
	@Resource
	private IRewardPunishmentService punishmentService;
	
	
	@RequestMapping(value="/showUserInfo")
	public String showUserInfo(String isStr , String type , Model model,Page page,HttpServletRequest request){
		 
		if(checkStr_IsNaN(isStr)){
			if(!checkString(type))
				type = "basic";
			int userId = Integer.parseInt(isStr);
			model.addAttribute("userId", userId);
			EmployeeInfo employeeInfo = infoService.findUserInfoById(userId);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("userId", userId);
			//基本资料
			if(equalsStr(type, "basic")){
				UserResume basic = iUserResumeService.getUserResumeById(employeeInfo.getUserId());
				model.addAttribute("basic", basic);
				return "/external/SoftInfo_Frame_Basic";
			}
			
			//工作经历
			if(equalsStr(type, "works")){
				List<UserWorkExperience> works= experienceService.getUserWorkByUserId(employeeInfo.getUserId(), page);
				model.addAttribute("works", works);
				return "/external/SoftInfo_Frame_Works";
			}
			
			//教育经历
			if(equalsStr(type, "edus")){
				List<UserEduInfo> edus= eduInfoService.getUserEduByIdBeforeType(employeeInfo.getUserId(), 0, page);
				model.addAttribute("edus", edus);
				return "/external/SoftInfo_Frame_Edus";
			}
			
			//培训经历
			if(equalsStr(type, "edusByType")){
				List<UserEduInfo> edusByType= eduInfoService.getUserEduByIdBeforeType(employeeInfo.getUserId(), 1, page);
				model.addAttribute("edusByType", edusByType);
				return "/external/SoftInfo_Frame_EdusByType";
			}
			
			//项目经验
			if(equalsStr(type, "project")){
				List<UserProjectExperience> project = projectExperienceService.getUserProjectById(employeeInfo.getUserId(), page);
				model.addAttribute("project", project);
				return "/external/SoftInfo_Frame_Project";
			}
			
			//技能专长
			if(equalsStr(type, "skills")){
				List<UserSkills> skills = skillsService.getUseSkillsById(employeeInfo.getUserId(), page);
				model.addAttribute("skills", skills);
				return "/external/SoftInfo_Frame_Skills";
			}
			
			//兴趣爱好
			if(equalsStr(type, "extend")){
				UserResumeExtend resumeExtend = interviewService.getUserHobbiesById(employeeInfo.getUserId());
				model.addAttribute("extend", resumeExtend);
				return "/external/SoftInfo_Frame_Extend";
			}
			
			//家庭成员
			if(equalsStr(type, "family")){
				List<EmployeeFamilyInfo> familyInfos = infoService.getUserFamilyById(employeeInfo.getUserId());
				model.addAttribute("family", familyInfos);
				return "/broker/UserInfo_FamilyInfo";
			}
			
			//入职信息
			if(equalsStr(type, "employeeInfo")){
				model.addAttribute("extend", employeeInfo);
				return "/broker/UserInfo_EmployeeInfo";
			}
			
			//岗位
			if(equalsStr(type, "cfgPost")){
				CfgPost cfgPost  = infoService.getUserPostById(employeeInfo.getPostId());
				model.addAttribute("cfgPost", cfgPost);
				return "/broker/UserInfo_CfgPost";
			}
			
			//职系
			if(equalsStr(type, "jobGrade")){
				CfgJobGrade jobGrade = infoService.getJobGradeById(employeeInfo.getJobGradeId());
				model.addAttribute("jobGrade", jobGrade);
				return "/broker/UserInfo_JobGrade";
			}
			
			//职等
			if(equalsStr(type, "jobLevel")){
				CfgJobLevel jobLevel = infoService.getJobLevelById(employeeInfo.getJobLevelId());
				model.addAttribute("jobLevel", jobLevel);
				return "/broker/UserInfo_JobLevel";
			}
			
			//薪酬
			if(equalsStr(type, "salaryLevel")){
				CfgSalaryLevel cfgSalaryLevel = infoService.getSalaryById(employeeInfo.getSalaryLevelId());
				model.addAttribute("salaryLevel", cfgSalaryLevel);
				return "/broker/UserInfo_SalaryLevel";
			}
			
			//社保
			if(equalsStr(type, "security")){
				SalarySocialSecurity security  = infoService.getSocialById(employeeInfo.getSocialSecurityId());
				model.addAttribute("security", security);
				return "/broker/UserInfo_Security";
			}
			
			//面试面谈记录
			if(equalsStr(type, "talkRecords")){
				return "/broker/UserInfo_TalkRecords";
			}
			
			//考勤
			if(equalsStr(type, "checkingIn")){
				return "/broker/UserInfo_CheckingIn";
			}
			
			//培训
			if(equalsStr(type, "trainingTask")){
				return "/broker/UserInfo_TrainingTask";
			}
			//奖惩
			if(equalsStr(type, "punishment")){
				return "/broker/UserInfo_Punishment";
			}
			//绩效
			if(equalsStr(type, "appraisal")){
				return "/broker/UserInfo_Appraisal";
			}
			//所得税
			if(equalsStr(type, "submit")){
				SalarySocialSecuritySusbmit susbmit = infoService.getUserSubmitBuId(userId);
				model.addAttribute("susbmit", susbmit);
				return "/broker/UserInfo_Submit";
			}
			//合同
			if(equalsStr(type, "contrack")){
				List<EmployeeContrack> contracks = infoService.getUserContrackById(userId, page);
				model.addAttribute("contracks", contracks);
				return "/broker/UserInfo_Contrack";
			}
		}
		return "";
	}
	
	
	/**
	 * ajax 面试
	 * @param page
	 * @param userId
	 * @param submit
	 * @param mtoId
	 * @param mtUserId
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	@RequestMapping(value="/getTalkRecords")
	@ModelAttribute("talkRecords")
	public List<EmployeeTalkRecord> getTalkRecords(Page page,int userId,String isSubmit,String mtoId,String mtUserId,String startTime,String endTime){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		if(checkString(isSubmit)){
			if(checkStr_IsNaN(mtoId))
				map.put("mtoId", mtoId);
			if(checkStr_IsNaN(mtUserId))
				map.put("mtUserId", mtUserId);
			if(checkString(startTime) && checkString(endTime)){
				map.put("startTime", startTime);
				map.put("endTime", endTime);
			}
				
		}
		List<EmployeeTalkRecord> talkRecords = infoService.getTalkRecordListById(map, page);
		return talkRecords;
	}
	
	//显示查看维护详情
	@RequestMapping(value="/jumpUserInfo")
	public String showUserInfo(String userId,Model model){
		if(checkString(userId)){
			String[] uidArray = userId.split(",");
			List<EmployeeInfo> list = new ArrayList<EmployeeInfo>();
			for (int i = 0; i < uidArray.length; i++) {
				if(checkStr_IsNaN(uidArray[i])){
					int uid = Integer.parseInt(uidArray[i]);
					EmployeeInfo empEntity = infoService.findUserInfoById(uid);
					if(empEntity!=null){
						list.add(empEntity); 
					}
				}
			}
			model.addAttribute("userList", list);
		}
		return "/broker/UserInfo";
	}
	
	@RequestMapping(value="/getTrainTask")
	@ModelAttribute("tasks")
	public List<TrainingTask> getTrainTask(int userId,Page page,String isSubmit,String taskType,String keyWord){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		if(checkString(isSubmit)){
			if(checkStr_IsNaN(taskType))
				map.put("taskType", taskType);
			if(checkString(keyWord))
				map.put("keyWord", keyWord);
		}
		List<TrainingTask> tasks = infoService.getTrainingTaskListById(map, page);
		return tasks;
	}
	
	/**
	 * AJAX 内部经纪人 列表
	 * @param isSubmit
	 * @param model
	 * @param page
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/getUserList")
	@ModelAttribute("infos")
	public List<EmployeeInfo> getUserList(String isSubmit,Model model,Page page,HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		if(checkString(isSubmit)){
			String stime = request.getParameter("startTime");
			String endTime = request.getParameter("endTime");
			String keyWord = request.getParameter("keyWord");
			
			if(checkString(stime) && checkString(endTime)){
				map.put("startTime", stime);
				map.put("endTime", endTime);
			}
			
			if(checkString(keyWord)){
				if(!"".equals(keyWord.trim()))
					map.put("keyWord", keyWord);
			}
			
		}
		List<EmployeeInfo> infos = employeeInfoService.getUserInfoByIdAndNotTurnover(map, page);
		return infos;
	}
	
	/**
	 * AJAX 考勤
	 * @param userId
	 * @param page
	 * @param submit
	 * @param checkType
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	@RequestMapping(value="/getCheckingIn")
	@ModelAttribute("checkingIns")
	public List<EmployeeCheckingIn> getCheckingIn(int userId, Page page,String isSubmit,String checkType,String startTime,String endTime){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		
		if(checkString(isSubmit)){
			if(checkStr_IsNaN(checkType))
				map.put("checkType", checkType);
			if(checkString(startTime) && checkString(endTime)){
				map.put("startTime", startTime);
				map.put("endTime", endTime);
			}	
		}
		List<EmployeeCheckingIn> checkingIns = infoService.getCheckingListById(map, page);
		return checkingIns;
	}
	
	/**
	 * AJAX绩效
	 * @param userId
	 * @param page
	 * @param isSubmit
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	@RequestMapping(value="/getUserAppraisal")
	@ModelAttribute("appraisals")
	public List<EmployeeAppraisal> getUserAppraisal(int userId,Page page,String isSubmit,String startTime,String endTime){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("empId", userId);
		
		if(checkString(isSubmit)){
			if(checkString(startTime) && checkString(endTime)){
				map.put("startTime", startTime);
				map.put("endTime", endTime);
			}
		}
		List<EmployeeAppraisal> appraisals = appraisalManagementService.getUserAppraisalListById(map, page);
		return appraisals;
	}
	
	/**
	 * AJAX奖惩
	 * @param userId
	 * @param page
	 * @param isSubmit
	 * @param recordType
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	@RequestMapping(value="/getPunishment")
	@ModelAttribute("punishments")
	public List<EmployeeRewardPunishment> getPunishment(int userId,Page page,String isSubmit,String recordType,String startTime,String endTime) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		if(checkString(isSubmit)){
			if(checkStr_IsNaN(recordType))
				map.put("recordType", recordType);
			if(checkString(startTime) && checkString(endTime)){
				map.put("startTime", startTime);
				map.put("endTime", endTime);
			}
		}
		List<EmployeeRewardPunishment> punishments = punishmentService.searchUserPunishmentListById(page, map);
		return punishments;
	}
	
	
	@RequestMapping(value="jumpJsp")
	public String frameJsp(String jsp){
		return "/broker/"+jsp;
	}
	
	
	
	
	
	/**
	 * 检查字符串是否为空
	 * @param str
	 * @return
	 */
	private boolean checkString(String str){
		if(!"".equals(str) && str!=null)
			return true;
		else
			return false;
	}
	
	/**
	 * 检查字符串是否为数字
	 * @param str
	 * @return
	 */
	private boolean checkStr_IsNaN(String str){
		if(!"".equals(str) && str!=null){
			try{
				Integer.parseInt(str);
			}catch (NumberFormatException ex) {
				return false;
			}
			return true;
		}else
			return false;
	}
	
	/**
	 * 检查两字符串是否相等
	 * @param str
	 * @return
	 */
	private boolean equalsStr(String requestType,String type){
		if(requestType.equals(type))
			return true;
		else
			return false;
	}
	
}
