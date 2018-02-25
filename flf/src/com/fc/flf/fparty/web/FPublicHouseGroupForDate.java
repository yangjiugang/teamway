package com.fc.flf.fparty.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.fc.flf.common.domain.CustomerInfo;
import com.fc.flf.common.domain.HouseGroupInfo;
import com.fc.flf.common.util.Page;
import com.fc.flf.fparty.service.IVisitorHouseGroupService;
@Service
public class FPublicHouseGroupForDate {	
	@Resource
	private IVisitorHouseGroupService houseGroupService;
	
	Page page1 = new Page();
	Page page2 = new Page();
	Page page3 = new Page();
	Page page4 = new Page();
	
	/**
	 * 客户关注的房团
	 * @param view
	 * @param customer
	 */
	public void addCustomerSkimHouseGroupToModel(ModelAndView view,CustomerInfo customer){
		int count = houseGroupService.getHouseGroupCount(customer); // 得到有几条记录
		page1.setRowCount(count);
		List<HouseGroupInfo> list = houseGroupService.listHouseGroupInfo(page1,
				customer);
		view.addObject("houseGroupList", list);
		view.addObject("attentionCount", count);
		view.addObject("page1", page1);
	}
	
	/**
	 * 客户收藏的房团
	 * @param view
	 * @param customer
	 */
	public void addCustomerCollectHouseGroupToModel(ModelAndView view,CustomerInfo customer){
		int count2 = houseGroupService.getCollectHouseGroupCount(customer); // 得到有几条记录
		page2.setRowCount(count2);
		List<HouseGroupInfo> list2 = houseGroupService
				.listCollectHouseGroupInfo(page2, customer);
		view.addObject("collectHouseGroup", list2);
		view.addObject("collectCount", count2);
		view.addObject("page2", page2);
	}
	
	/**
	 * 客户参加的房团
	 * @param view
	 * @param customer
	 */
	public void addCustomerJoinHouseGroupToModel(ModelAndView view,CustomerInfo customer){
		int count3 = houseGroupService.getJoinHouseGroupCount(customer);
		page3.setRowCount(count3);
		List<HouseGroupInfo> list3 = houseGroupService.listJoinHouseGroupInfo(
				page3, customer);
		view.addObject("joinHouseGroup", list3);
		view.addObject("joinCount", count3);
		view.addObject("page3", page3);
	}
	
	/**
	 * 经纪人推荐的房团
	 * @param view
	 * @param customer
	 */
	public void addCustomerRecommendHouseGroupToModel(ModelAndView view,CustomerInfo customer){
		int count4 = houseGroupService.getRecommendHouseGroupCount(customer);
		page4.setRowCount(count4);
		List<HouseGroupInfo> list4 = houseGroupService
				.listRecommendHouseGroupInfo(page4, customer);	
		view.addObject("recommendHouseGroup", list4);	
		view.addObject("recommendCount", count4);	
		view.addObject("page4", page4);
	}
		
}
