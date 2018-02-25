package com.fc.flf.fparty.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.fc.flf.common.domain.CustomerInfo;
import com.fc.flf.common.domain.EventInfo;
import com.fc.flf.common.domain.HouseGroupInfo;
import com.fc.flf.common.domain.HouseInfo;
import com.fc.flf.common.util.Page;
import com.fc.flf.fparty.service.IEventInfoService;
import com.fc.flf.fparty.service.IVisitorHouseService;
import com.fc.flf.portal.service.IHouseInfoService;
import com.fc.flf.portal.service.ILineSetMealService;

@Service
public class FPublicNoticeForData {
	@Resource
	private IEventInfoService iEventInfoService;
	
	@Resource
	private IHouseInfoService iHouseInfoService;
	
	@Resource
	private ILineSetMealService iLineSetMealService;
	@Autowired
	private IVisitorHouseService visitorHouseService;
	
	public void addDataToModel(Model model) {
		List<EventInfo> eventInfoes = iEventInfoService.findFutrueEventInfo();
		List<HouseInfo> recentSigns=iHouseInfoService.findRecentSignHouseInfo();
		List<HouseGroupInfo> houseGroupInfoes = iLineSetMealService.getCurrentWeekdayOpenHouseGroupInfo();
		model.addAttribute("eventInfoes", eventInfoes);
		model.addAttribute("recentSigns", recentSigns);
		model.addAttribute("houseGroupInfoes", houseGroupInfoes);
	}
	
	/**
	 * 房乐会首页蜂蜜推荐的楼盘
	 * @param model
	 * @param customer
	 */
	public void addUserHouseToModel(Model model ,CustomerInfo customer) {        
		Page userRecommendPage=new Page();
		userRecommendPage.setPageSize(5);
		int recommendHouseCount=visitorHouseService.recommendHousesCount(customer);
		userRecommendPage.setRowCount(recommendHouseCount);
		List<HouseInfo> listRecommendHouseInfo=visitorHouseService.recommendHouse(userRecommendPage, customer);
	    model.addAttribute("listRecommendHouseInfo", listRecommendHouseInfo);
        model.addAttribute("userRecommendPage", userRecommendPage);
	}
	
	/**
	 * 房乐会首页你可能感兴趣的楼盘
	 * @param model
	 * @param customer
	 */
	public void addSkimHouseToModel(Model model ,CustomerInfo customer) {       		
        Page skimPage=new Page();
        skimPage.setPageSize(5);
        int skimHouseCount=visitorHouseService.skimHousesCount(customer);
        skimPage.setRowCount(skimHouseCount);
        List<HouseInfo> listSkimHouseInfo=visitorHouseService.skimHouses( skimPage , customer); //我可能感兴趣的楼盘信息
        model.addAttribute("listSkimHouseInfo", listSkimHouseInfo);
		model.addAttribute("skimPage", skimPage);
	}
	
}
