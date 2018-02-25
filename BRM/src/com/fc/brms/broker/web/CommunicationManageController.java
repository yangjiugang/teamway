package com.fc.brms.broker.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fc.brms.broker.service.ICommunicationManageService;
import com.fc.brms.broker.service.IEmployeeInfoService;
import com.fc.brms.broker.service.ISendMsgMangeService;
import com.fc.brms.common.domain.EmployeeInfo;
import com.fc.brms.common.domain.EmployeeTalkRecord;
import com.fc.brms.common.util.DateTools;
import com.fc.brms.common.util.Page;
import com.fc.brms.common.util.SessionInfo;


/**
 * 沟通管理控制器
 * 
 * @author 覃启轩
 * @version 1.0  2012-3-28
 */
@Controller
public class CommunicationManageController {
	
	@Resource
	private ICommunicationManageService commManageService;
	@Resource
	private IEmployeeInfoService employeeInfoService;
	@Resource
	private ISendMsgMangeService sendMsgMangeService;
	
	/**
	 * 约谈页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(value = { "/broker_Communication" })
	public String InterviewsManage() {
		return "/broker/CommunicationManage";
	}
	
	/**
	 * 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(value = { "/broker_pageForWard" })
	public String pageForWardUtil(String url, String scope, Model model) {
		model.addAttribute("scope", scope);
		return "/broker/"+url;
	}
	
	/**
	 * 查询约谈记录
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = { "/broker_CommunicationList" })
	@ModelAttribute("lstData")
	public List<EmployeeInfo> ommunicationList(Page page) {
		Map<String, Object> map = new HashMap<String, Object>();
		int iCount = employeeInfoService.getEmployeeCommInfoCount(map);
		page.setRecords(iCount);
		map.put("limit", page.getLimit());
		return employeeInfoService.getEmployeeCommInfoList(map);
	}
	
	/**
	 * 查询约谈提醒记录
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = { "/broker_CommRemindList" })
	@ModelAttribute("lstData")
	public List<EmployeeInfo> commRemindList(String commStartTime, String commEndTime,
			String keyWord, Page page) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startTime", commStartTime);
		map.put("endTime", commEndTime);
		map.put("keyWord", keyWord);
		int iCount = commManageService.queryCommunicationManageCount(map);
		page.setRecords(iCount);
		map.put("limit", page.getLimit());
		return commManageService.queryCommunicationManageList(map);
	}
	
	
	/**
	 * 删除约谈提醒记录
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = { "/broker_deleteCommRemind" })
	@ModelAttribute("lstData")
	public String deletecommRemind(String msgId) {
		commManageService.deleteCommunicationRemind(msgId);
		return "";
	}
	
	/**
	 * 约谈记录历史查询
	 * 
	 * @param model
	 * @param request
	 * 
	 * @return
	 */
	@RequestMapping(value = { "/broker_queryDetail" })
	public String queryHisDetail(HttpServletRequest request, Page page, Model model) {
		List<EmployeeInfo> lst = new ArrayList<EmployeeInfo>();
		String[] strId = request.getParameter("id").split(",");
		String[] strName = request.getParameter("name").split(",");
		for(int i = 0; i < strId.length; i++){
			EmployeeInfo e1 = new EmployeeInfo();
			e1.setEmployeeId(Integer.parseInt(strId[i]));
			e1.setUserName(strName[i]);
			lst.add(e1);
		}
		model.addAttribute("lst", lst);
		return "/broker/CommunicationDetail";
	}
	
	/**
	 * 查询人员约谈记录
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = { "/broker_commHistory" })
	@ModelAttribute("detailData")
	public List<EmployeeTalkRecord> queryHisDetail(Model model, HttpServletRequest request) {
		String strId = request.getParameter("id");
		return commManageService.queryCommHistory(Integer.parseInt(strId));
	}
	
	/**
	 * 查询人员约谈记录
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = { "/broker_commHistoryDetail" })
	public String getTalkRecordById(Model model, HttpServletRequest request) {
		String strId = request.getParameter("talkId");
		EmployeeTalkRecord employeeTalkRecord = commManageService.getTalkRecordById(Integer.parseInt(strId));
		String strDiff = "";
		if(null != employeeTalkRecord){
			strDiff = DateTools.dateDiff(employeeTalkRecord.getStartTime(),employeeTalkRecord.getEndTime(),"hourAndMin");
		}
		List<EmployeeTalkRecord> lstEmployeeTalkRecord = commManageService.queryTalkContent(Integer.parseInt(strId));
		if(0 != lstEmployeeTalkRecord.size()){
			model.addAttribute("content",lstEmployeeTalkRecord.get(0).getEmployeeTalkContent().getContent());
		}
		model.addAttribute("lstRecord", lstEmployeeTalkRecord);
		model.addAttribute("lstEmployeeTalkRecord", employeeTalkRecord);
		model.addAttribute("dateDiff", strDiff);
		return "/broker/CommHistoryDetail";
	}
	
	/**
	 * 添加约谈记录
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = { "/broker_addCommRecord" })
	@ModelAttribute("iFlag")
	public String addCommunicationRecord(EmployeeTalkRecord employeeTalkRecord,
			String contentType, Model model, HttpServletRequest request) {
		int companyId = 99;
		try {
			companyId = SessionInfo.getCompanyId(request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		int iFlag = commManageService.addCommunicationRecord(employeeTalkRecord,companyId,contentType);
		model.addAttribute("iFlag", iFlag==1?iFlag:2);
		return "forward:broker_pageForWard?url=CommunicationManageIFrame";
	}
	
	/**
	 * 跳转到约谈提醒页面
	 * 
	 * @param model
	 * @param request
	 * 
	 * @return
	 */
	@RequestMapping(value = { "/broker_sendCommRemind" })
	public String forwardCommRemind(String url, Model model, HttpServletRequest request) {
		List<EmployeeInfo> lst = new ArrayList<EmployeeInfo>();
		String[] strId = request.getParameter("idArray").split(",");
		String[] strName = request.getParameter("nameArr").split(",");
		for(int i = 0; i < strId.length; i++){
			EmployeeInfo e1 = new EmployeeInfo();
			e1.setUserName(strName[i]);
			lst.add(e1);
		}
		model.addAttribute("lst", lst);
		model.addAttribute("userName", request.getParameter("nameArr"));
		model.addAttribute("userId", request.getParameter("idArray"));
		return "/broker/SendCommRemind";
	}
	
	/**
	 * 发送约谈提醒消息
	 * 
	 * @param model
	 * @param request
	 * 
	 * @return
	 */
	@RequestMapping(value = { "/broker_confirmSendRemind" })
	@ModelAttribute("iFlag")
	public int confirmSendRemind(String content1, String content2, 
			String userId,HttpServletRequest request) {
		String[] strId = userId.split(",");
		int iFlag = 0;
		for(int i = 0; i < strId.length; i++){
			Map<String, Object> map = new HashMap<String, Object>();
			try {
				map.put("companyId", SessionInfo.getCompanyId(request));
				map.put("msgType", 3);
				map.put("msgContent", content1+content2);
				map.put("receiveEmployeeId", strId[i]);
				map.put("sendEmployeeId", SessionInfo.getVisitorId(request));
				map.put("sendTime", DateTools.getTs(DateTools.getToday()));
				iFlag += sendMsgMangeService.addCommRemindMsg(map);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return iFlag;
	}
	
	/**
	 * 查询约谈活动管理信息
	 * 
	 * @param model
	 * @param page
	 * 
	 * @return List<EmployeeTalkRecord> 结果集
	 */
	@RequestMapping(value = { "/broker_queryCommActivty" })
	@ModelAttribute("lstEmployeeTalkRecord")
	public List<EmployeeTalkRecord> queryCommActivty(String commStartTime, String commEndTime,
			String keyWord, String scope, Page page) {
		Map<String, Object> map = new HashMap<String, Object>();
		if("请输入关键字".equals(keyWord)){
			keyWord = "";
		}
		map.put("startTimeScope",null);
		map.put("endTimeScope", null);
		map.put("yesterDayTime", null);
		if("thisWeek".equals(scope)){
			Date startTimeScope = DateTools.getMondayOFWeek();
			Date endTimeScope = DateTools.getCurrentWeekday();
			map.put("startTimeScope", startTimeScope);
			map.put("endTimeScope", endTimeScope);
		}else if("yesterDay".equals(scope)){
			map.put("yesterDayTime", DateTools.getTs(DateTools.getYesterDay()));
		}else if("thisMonth".equals(scope)){
			map.put("startTimeScope", DateTools.getCurMonthFrist());
			map.put("endTimeScope", DateTools.getCurMonthLast());
		}
		map.put("commStartTime", commStartTime);
		map.put("commEndTime", commEndTime);
		// 选择器带过来的ID，暂时没有
		map.put("orgId", null);
		map.put("postId", null);
		map.put("keyWord", keyWord);
		int iCount = commManageService.queryCommunicationActivtyCount(map);
		page.setRecords(iCount);
		map.put("limit", page.getLimit());
		return commManageService.queryCommunicationActivtyList(map);
	}
}
