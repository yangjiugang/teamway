package com.fc.brms.external.web;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.fc.brms.broker.service.IEmployeeInfoService;
import com.fc.brms.broker.service.IRecruitTaskService;
import com.fc.brms.common.domain.EmployeeInfo;
import com.fc.brms.common.domain.RecruitInterview;
import com.fc.brms.common.domain.RecruitInterviewProcess;
import com.fc.brms.common.domain.RecruitOffer;
import com.fc.brms.common.domain.RecruitTask;
import com.fc.brms.common.domain.UserEduInfo;
import com.fc.brms.common.domain.UserProjectExperience;
import com.fc.brms.common.domain.UserResume;
import com.fc.brms.common.domain.UserResumeExtend;
import com.fc.brms.common.domain.UserSkills;
import com.fc.brms.common.domain.UserTrackRecord;
import com.fc.brms.common.domain.UserTrackRecordContent;
import com.fc.brms.common.domain.UserWorkExperience;
import com.fc.brms.common.util.DateTools;
import com.fc.brms.common.util.Page;
import com.fc.brms.external.service.IRecruitInterviewService;
import com.fc.brms.external.service.IUserEduInfoService;
import com.fc.brms.external.service.IUserProjectExperienceService;
import com.fc.brms.external.service.IUserResumeService;
import com.fc.brms.external.service.IUserSkillsService;
import com.fc.brms.external.service.IUserWorkExperienceService;

@Controller
public class IndexController {
	
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
	private IRecruitInterviewService interviewService;
	
	@Resource
	private IEmployeeInfoService employeeInfoService;
	
	@Resource
	private IRecruitTaskService iRecruitTaskService;
	

	@RequestMapping(value="/external_index")
	public String index(Page page,Model model){
		return "/external/External_Index";
	}
	
	@RequestMapping(value="/getExternalList")
	@ModelAttribute("resumes")
	public List<UserResume> getDataList(Page page,UserResume resume,String type,String isSubmit,HttpServletRequest request){
		List<UserResume> resumes = null;
		Map<String, Object> map = new HashMap<String, Object>();
		if(checkString(type)){
			map.put("type", type);
		}else{
			map.put("type", 0);
		}
		if(checkString(isSubmit)){
			map.put("isSubmit", 1);
			String stime = request.getParameter("startTime");
			String endTime = request.getParameter("endTime");
			String contactCnt = request.getParameter("contactCnt");
			String highestEducation = request.getParameter("highestEducation");
			String keyWord = request.getParameter("keyWord");
			
			if(checkString(stime) && checkString(endTime)){
				map.put("startTime", stime);
				map.put("endTime", endTime);
			}
			if(checkStr_IsNaN(contactCnt) && !equalsStr(contactCnt, "-1"))
				map.put("contactCnt", Integer.parseInt(contactCnt));
			if(checkStr_IsNaN(highestEducation) && !equalsStr(highestEducation, "-1"))
				map.put("highestEducation", Integer.parseInt(highestEducation));
			if(checkString(keyWord)){
				if("".equals(keyWord.trim()))
					map.put("keyWord", "");
				else
					map.put("keyWord", keyWord);
			}
		}
		resumes = iUserResumeService.getUserResumeList(page,map);
		return resumes;
	}
	
	@RequestMapping(value="/external_getUserResumeInfo")
	public String getUserResumeInfo(String userId ,String type , Model model,Page page){
		
		if(checkStr_IsNaN(userId)){
			if(!checkString(type))
				type = "basic";
			int uid = Integer.parseInt(userId);
			
			//基本资料
			if(equalsStr(type, "basic")){
				UserResume basic = iUserResumeService.getUserResumeById(uid);
				model.addAttribute("basic", basic);
				return "/external/SoftInfo_Frame_Basic";
			}
			
			//工作经历
			if(equalsStr(type, "works")){
				List<UserWorkExperience> works= experienceService.getUserWorkByUserId(uid, page);
				model.addAttribute("works", works);
				return "/external/SoftInfo_Frame_Works";
			}
			
			//教育经历
			if(equalsStr(type, "edus")){
				List<UserEduInfo> edus= eduInfoService.getUserEduByIdBeforeType(uid, 0, page);
				model.addAttribute("edus", edus);
				return "/external/SoftInfo_Frame_Edus";
			}
			
			//培训经历
			if(equalsStr(type, "edusByType")){
				List<UserEduInfo> edusByType= eduInfoService.getUserEduByIdBeforeType(uid, 1, page);
				model.addAttribute("edusByType", edusByType);
				return "/external/SoftInfo_Frame_EdusByType";
			}
			
			//项目经验
			if(equalsStr(type, "project")){
				List<UserProjectExperience> project = projectExperienceService.getUserProjectById(uid, page);
				model.addAttribute("project", project);
				return "/external/SoftInfo_Frame_Project";
			}
			
			//技能专长
			if(equalsStr(type, "skills")){
				List<UserSkills> skills = skillsService.getUseSkillsById(uid, page);
				model.addAttribute("skills", skills);
				return "/external/SoftInfo_Frame_Skills";
			}
			
			//兴趣爱好
			if(equalsStr(type, "extend")){
				UserResumeExtend resumeExtend = interviewService.getUserHobbiesById(uid);
				model.addAttribute("extend", resumeExtend);
				return "/external/SoftInfo_Frame_Extend";
			}
		}
		return "";
	}
	
	/**
	 * 弹出面试及交流记录窗口
	 * @param userId
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/showInterview")
	public String getInterview(String userId,int taskId,Model model){
		
		if(checkStr_IsNaN(userId)){
			int uid = Integer.parseInt(userId);
			List<RecruitInterview> interview = interviewService.getInterviewByUserId(uid);
			model.addAttribute("interview", interview);
			model.addAttribute("taskId", taskId);
			model.addAttribute("userId", userId);
		}
		
		return "/external/RecruitInterview";
	}
	
	@RequestMapping(value="/external_frameJsp")
	public String frameIndexJsp(String jsp,String type,Model model){
		model.addAttribute("type", type);
		return "/external/"+jsp;
	}
	
	/**
	 * 弹出入职通知界面
	 * @param userId
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/showNewOffer")
	public String showNewOffer(String userId , Model model){
		if(checkStr_IsNaN(userId)){
			int uid = Integer.parseInt(userId);
			model.addAttribute("userId", uid);
			
			EmployeeInfo employeeInfo = employeeInfoService.getUserInfoById(1);		//写死
			int rId = Integer.parseInt(userId);
			UserResume resume = iUserResumeService.getUserResumeById(rId);
			
			model.addAttribute("resume", resume);
			model.addAttribute("userInfo", employeeInfo);
		}
		return "/external/NewOffer";
	}
	
	
	/**
	 * 新增入职通知
	 * @param model
	 * @param recruitOffer
	 * @param uid
	 * @return
	 */
	@RequestMapping(value="/addNewOffer")
	public String addNewOffer(Model model,RecruitOffer recruitOffer,String uid){
		int rId = recruitOffer.getResumeId();
		UserResume resume = iUserResumeService.getUserResumeById(rId);
		recruitOffer.setUserName(resume.getUserName());
		recruitOffer.setUserTelphone(resume.getUserTelphone());
		recruitOffer.setEmail(resume.getEmail());
		
		EmployeeInfo employeeInfo = employeeInfoService.getUserInfoById(1);
		recruitOffer.setContactId(employeeInfo.getUserId());
		recruitOffer.setContactUserEmail(employeeInfo.getEnterpriseMail());
		recruitOffer.setOfferStatus(0);		//到岗时间
		
		//?
		recruitOffer.setTaskId(1);	//taskId
		recruitOffer.setInterviewId(1);
		recruitOffer.setCompanyId(1);
		
		recruitOffer.setUserDept(1);	//部门ID
		recruitOffer.setOrganizationName("赞无数据");	//组织单元名称
		recruitOffer.setUserPost(0);
		recruitOffer.setProbationDate(DateTools.dateToHour());	//试用期开始时间
		recruitOffer.setPositiveDate(DateTools.dateToHour());	//转正时间
		recruitOffer.setProbationSalary(0);
		
		int isAdd = interviewService.addNewOffer(recruitOffer);
		model.addAttribute("isAdd", isAdd);
		
		return "/external/NewOffer";
	}
	
	@RequestMapping(value="/showInterviewCall")
	public String showInterviewCall(String userId,int taskId,Model model){
		if(checkStr_IsNaN(userId)){
			EmployeeInfo employeeInfo = employeeInfoService.getUserInfoById(1);
			int rId = Integer.parseInt(userId);
			UserResume resume = iUserResumeService.getUserResumeById(rId);
			
			model.addAttribute("resume", resume);
			model.addAttribute("taskId", taskId);
			model.addAttribute("userInfo", employeeInfo);
		}
		return "/external/InterviewCall";
	}
	
	@RequestMapping(value="/addNewInterview")
	public String addNewInterview(String userId,int taskId ,String emploId,Model model,RecruitInterviewProcess recruitInterviewProcess){
		
		if(checkStr_IsNaN(userId) && checkStr_IsNaN(emploId)){
			int uid = Integer.parseInt(userId);
			int rid = Integer.parseInt(emploId);
			//init val
			
			int isAdd = interviewService.addNewInterviewByRipId(uid,taskId, recruitInterviewProcess);
			model.addAttribute("isAdd", isAdd);
			
			//粘性表单
			EmployeeInfo employeeInfo = employeeInfoService.getUserInfoById(rid);
			int rId = Integer.parseInt(userId);
			UserResume resume = iUserResumeService.getUserResumeById(uid);
			
			model.addAttribute("resume", resume);
			model.addAttribute("userInfo", employeeInfo);
			return "/external/InterviewCall";
		}
		return "/external/InterviewCall";
	}
	
	@RequestMapping(value="/jumpInterview")
	public String jumpInterview(Model model){
		return "";
	}
	
	@RequestMapping(value="/updateInterview")
	public String updateInterview(int userId,int rid,int taskId,RecruitInterviewProcess interviewProcess,UserTrackRecord record,UserTrackRecordContent content,Model model){
		//根据userId 查询recruit_interview表 获得数据 interviewId
		
		EmployeeInfo employeeInfo = employeeInfoService.getUserInfoById(rid);
		record.setCompanyId(employeeInfo.getCompanyId());
		record.setUserId(userId);
		//部门
		record.setMainTalkOrganizationId(employeeInfo.getOrganizationId());
		record.setMainTalkOrganizationName(employeeInfo.getOrganizationName());
		//岗位
		record.setMainTalkPostId(employeeInfo.getPostId());
		record.setMainTalkPostName(employeeInfo.getPostName());
		//名称，id
		record.setMainTalkEmployee(employeeInfo.getUserId());
		record.setMainTalkEmployeeName(employeeInfo.getUserName());
		//约谈地点
		record.setTalkPlace(interviewProcess.getInterviewAddress());
		//面试类型
		record.setTalkType(interviewProcess.getInterviewType());
		record.setCreateTime(DateTools.dateToHour());
		
		int isAdd = interviewService.updateInterviewProcess(interviewProcess, userId,taskId, record,content);
		//根据InterviewersId=0,interviewId,taskId,CompanyId 更新recruit_interview_process
		model.addAttribute("isAdd", isAdd);
		return "/external/RecruitInterview";
	}
	
	@RequestMapping(value="/getRecruitTask")
	@ModelAttribute("tasks")
	public List<RecruitTask> getRecruitTaskList(int userId,Page page){
		List<RecruitTask> tasks = iRecruitTaskService.recruitTaskListByPage(userId, page);
		return tasks;
	}
	
	@RequestMapping(value="/showTaskDiv")
	public String showTaskDiv(int userId,Model model){
		model.addAttribute("userId", userId);
		return "/external/RecruitTaskList";
	}
	
	@RequestMapping(value="/updateTaskResult")
	@ResponseBody
	public int updateTask(int tid,int userId,int companyId){
		RecruitInterview interview = new RecruitInterview();
		interview.setTaskId(tid);
		interview.setCompanyId(companyId);
		interview.setUserId(userId);
		
		interview.setInterviewCnt(0);
		interview.setInterviewResult(0);
		interview.setEntryDate(DateTools.dateToHour());
		interview.setEntryNotice(0);
		interview.setEntryStatus(0);
		int isAdd = interviewService.updateInterviewByTtask(interview);

		
		return isAdd;
	}
	
	/**
	 * Controller Iframe src(jump)
	 * @param jsp
	 * @return
	 */
	@RequestMapping(value="/external_softInfo")
	public String frameJsp(String jsp,String userId,Model model){
		if(checkString(userId)){
			String[] uidArray = userId.split(",");
			List<UserResume> list = new ArrayList<UserResume>();
			for (int i = 0; i < uidArray.length; i++) {
				if(checkStr_IsNaN(uidArray[i])){
					int uid = Integer.parseInt(uidArray[i]);
					UserResume resume = iUserResumeService.getUserResumeById(uid);
					if(resume!=null){
						list.add(resume);
					}
				}
			}
			model.addAttribute("userList", list);
		}
		int index = jsp.indexOf("?");
		if(index!=-1)
			jsp = jsp.substring(0, index);
		return "/external/"+jsp;
	}
	
	private boolean checkString(String str){
		if(!"".equals(str) && str!=null)
			return true;
		else
			return false;
	}
	
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
	
	private boolean equalsStr(String requestType,String type){
		if(requestType.equals(type))
			return true;
		else
			return false;
	}
	
	/**
	 * 证件号码保密处理
	 * @return
	 */
	private String makeNum(String num){
		return "";
	}
}
