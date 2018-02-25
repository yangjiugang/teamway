package com.fc.brms.deactivated.web;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fc.brms.common.domain.DimissionEmployeeInfo;
import com.fc.brms.common.util.Page;
import com.fc.brms.common.util.mail.HolidayRegardsTemplate;
import com.fc.brms.deactivated.service.IDimissioEmployeeService;
import com.fc.brms.common.util.SessionInfo;

@Controller
public class DimissionEmployeeController {
	@Resource
	private IDimissioEmployeeService dimissionUserResumeService;
	
	@RequestMapping(value="/getDimissionUserResumeInfoByPage")
	@ModelAttribute("dimissionEmp")
	public List<DimissionEmployeeInfo> getDimissionUserResumeInfoForPage(HttpServletRequest request, Page page) throws Exception{
		int [] black={0,1};
		int companyId=SessionInfo.getCompanyId(request);
		List<DimissionEmployeeInfo> dimissionUserResume = dimissionUserResumeService.findIDimissionUserResumeInfo(page,companyId,black);
		return dimissionUserResume;
	}
	
	@RequestMapping(value="/getDimissionUserResumeInfoWithFactorByPage")
	@ModelAttribute("dimissionEmp")
	public List<DimissionEmployeeInfo> getDimissionUserResumeInfoWithFactorByPage(HttpServletRequest request, Page page,Date startDate,Date endDate,
			int talkNum,int education,String keyWord,String parentFactor)throws Exception{
		int [] black={0,1};
		if("black:2".equals(parentFactor)){
			black=new int[]{2};
		}
		int companyId=SessionInfo.getCompanyId(request);
		List<DimissionEmployeeInfo> dimissionUserResume=dimissionUserResumeService.findDimissionUserInfoWithFactor(page, startDate, endDate, education, keyWord, companyId, talkNum, black);
		return dimissionUserResume;
	}
	
	@RequestMapping(value="/updateDimissionUserToBlack")
	@ResponseBody
	public String updateDimissionUserToBlack(HttpServletRequest request, String userIds,int redBlack)throws Exception{
		int companyId=SessionInfo.getCompanyId(request);
		String[] ids = userIds.split(",");
		int [] ids1=new int[ids.length];
		for (int i=0; i<ids.length ; i++) {
			ids1[i]=Integer.parseInt(ids[i]);
		}
		dimissionUserResumeService.updateDimissionUserToBlack(ids1,companyId,redBlack);
		return "SUCCESS";
	}
	
	@RequestMapping(value="/getBlackDimissionUserResumeInfo")
	@ModelAttribute("dimissionEmp")
	public List<DimissionEmployeeInfo> getBlackDimissionUserResumeInfo(HttpServletRequest request, Page page)throws Exception{
		int [] black={2};
		int companyId=SessionInfo.getCompanyId(request);
		List<DimissionEmployeeInfo> dimissionUserResume=dimissionUserResumeService.findIDimissionUserResumeInfo(page, companyId,black);
		return dimissionUserResume;
	}
	
	@RequestMapping(value="/sendHolidayRegards")
	@ResponseBody
	public String sendHolidayRegards(HttpServletRequest request, int userId,String userName,String companyName,
									String sendUserName,String HolidayDate,String HolidayName)throws Exception{
		int companyId=SessionInfo.getCompanyId(request);
		String mailContents=new HolidayRegardsTemplate().getTemplate(userName, companyName, sendUserName, HolidayDate, HolidayName);
		String mailSubject=companyName+"节日问候";
		return dimissionUserResumeService.sendHolidayRegards(userId,companyId,mailContents,mailSubject);
		
	}
}
