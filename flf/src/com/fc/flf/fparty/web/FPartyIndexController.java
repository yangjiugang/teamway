package com.fc.flf.fparty.web;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fc.flf.common.domain.CustomerInfo;
import com.fc.flf.common.domain.HouseInfo;
import com.fc.flf.common.util.Page;
import com.fc.flf.common.util.SessionInfo;
import com.fc.flf.fparty.service.ICustomerInfoService;
import com.fc.flf.fparty.service.IVisitorHouseService;



@Controller
public class FPartyIndexController {
	@Resource
	private FPublicNoticeForData fPublicNoticeForData;	
	@Resource
	private UserInfoAndMsgCountForData userInfoAndMsgCountForData;
	@Resource
	private ICustomerInfoService customerInfoService;
	@Autowired
	private IVisitorHouseService visitorHouseService;
	
	@RequestMapping(value = "/fPartyIndex")
	public String findex(HttpServletRequest request, Model model,Page page) throws Exception{			
		int customerId=SessionInfo.getVisitorId(request);	
		System.out.println("....."+customerId);
		CustomerInfo customer=customerInfoService.findCustomerInfo(customerId);	 //客户的信息		
		
		Object tabTag=request.getParameter("tab");
		model.addAttribute("customer", customer);
		model.addAttribute("customerId",customerId);
		model.addAttribute("tabTag",tabTag);
		fPublicNoticeForData.addDataToModel(model);
		fPublicNoticeForData.addUserHouseToModel(model, customer);
		fPublicNoticeForData.addSkimHouseToModel(model, customer);
		userInfoAndMsgCountForData.addDataToModel(model, request);
		return "/fparty/FIndex";
	}
	
	/**
	 * 我关注的楼盘
	 * @return
	 */
	@RequestMapping(value = "/FSkimHouses")
	@ResponseBody
	public List<HouseInfo> skimBuilding(Page page ,CustomerInfo customer){
		page.setPageSize(5);
		int skimCount=visitorHouseService.skimHousesCount(customer);  //我关注的楼盘信息数量
		page.setRowCount(skimCount);
		List<HouseInfo> skimHouseList=visitorHouseService.skimHouses(page, customer); //我关注的楼盘信息
		return skimHouseList;
	}
	
	/**
	 * 蜂蜜推荐的楼盘
	 * @return
	 */
	@RequestMapping(value = "/FRecommendHouses")
	@ResponseBody
	public List<HouseInfo> recommendBuilding(Page page ,CustomerInfo customer){
		page.setPageSize(5);
		int recommendHouseCount=visitorHouseService.recommendHousesCount(customer);
		page.setRowCount(recommendHouseCount);
		List<HouseInfo> listRecommendHouseInfo=visitorHouseService.recommendHouse(page, customer);
		return listRecommendHouseInfo;
	}
	
	
}
