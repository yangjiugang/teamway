package com.fc.flf.eagent.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fc.flf.common.domain.ClubStudyData;
import com.fc.flf.common.domain.ClubStudyDataInfo;
import com.fc.flf.common.util.Page;
import com.fc.flf.eagent.service.IClubStudyDataService;

@Controller
public class ClubStudyDataController {

	@Resource
	private IClubStudyDataService clubStudyDataService;
	
	@RequestMapping(value="/frameClubStudy")
	public String getClubStudyDataList(Page page,HttpServletRequest request,Model model){
		int type = 0;
		int format = 0;
		if (!"".equals(request.getParameter("type")) && request.getParameter("type")!=null) {
			type = Integer.parseInt(request.getParameter("type"));
		}
		if (!"".equals(request.getParameter("format")) && request.getParameter("format")!=null) {
			format = Integer.parseInt(request.getParameter("format"));
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", type);
		map.put("format", format);
		
		int count = clubStudyDataService.selectClubStudyDataCountByType(map);
		page.setRowCount(count);
		map.put("start", (page.getCurPage() - 1) * page.getPageSize());
		map.put("end", page.getPageSize());
		
		List<ClubStudyData> clubStudyDataList = clubStudyDataService.selectClubStudyDataByTypeToPage(map);
		model.addAttribute("clubStudyDataList", clubStudyDataList);
		model.addAttribute("count", count);
		model.addAttribute("format", format);
		model.addAttribute("type", type);
		return "/eagent/FrameProtocol";
	}
	
	@RequestMapping(value="/showStudyInfo")
	public String showStudyInfo(int dataId,Model model){
		ClubStudyDataInfo clubStudyDataInfo = clubStudyDataService.selectClubStudyDataInfoById(dataId);
		model.addAttribute("clubStudyDataInfo", clubStudyDataInfo);
		return "/eagent/StudyNews";
	}
	
	@RequestMapping(value="/eagent_study_jumpClubStudy")
	public String jumpClubStudy(int type,Model model){
		if(type<-1)
			type=0;
		model.addAttribute("type", type);
		return "/eagent/ProtocolStudy";
	}
}

