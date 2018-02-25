package com.fc.flf.fparty.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.fc.flf.common.domain.CustomerInfo;
import com.fc.flf.common.domain.EventInfo;
import com.fc.flf.common.util.Page;
import com.fc.flf.fparty.service.IEventInfoService;

@Service
public class FPublicActivityForDate {
	@Resource
	private IEventInfoService eventInfoService;
	
	/**
	 * 客户关注的活动
	 * @param view
	 * @param customer
	 */
	public void addCustomerSkimActivityToModel(ModelAndView view,CustomerInfo customer){
		Page attentionPage=new Page(); 
		int attentionCount=eventInfoService.getAttenActivityCount(customer);   //关注活动的总数量
		attentionPage.setRowCount(attentionCount);    	//总页数
		List<EventInfo> attentionList=eventInfoService.attentionActivity(attentionPage, customer);  //关注的活动的list集合
		view.addObject("attentionList", attentionList);
		view.addObject("attentionCount",attentionCount);
		view.addObject("attentionPage", attentionPage);
	}
	
	/**
	 * 客户报名de活动
	 * @param view
	 * @param customer
	 */
	public void addCustomerApplyActivityToModel(ModelAndView view,CustomerInfo customer){
		Page applyPage=new Page();
		int applyCount=eventInfoService.getApplyActivityCount(customer);  //报名活动的总数量
		applyPage.setRowCount(applyCount);  //总页数
		List<EventInfo> applyList=eventInfoService.applyActivity(applyPage, customer);  //我报名活动的List集合
		view.addObject("applyList", applyList);
		view.addObject("applyCount",applyCount);
		view.addObject("applyPage", applyPage);
	}
	
	/**
	 * 客户参加de活动
	 * @param view
	 * @param customer
	 */
	public void addCustomerJoinActivityToModel(ModelAndView view,CustomerInfo customer){
		Page joinPage=new Page();
		int joinCount=eventInfoService.getJoinActivityCount(customer);  //我参加活动的总数量
		joinPage.setRowCount(joinCount);  //总页数
		List<EventInfo> joinList=eventInfoService.joinActivity(joinPage, customer);  //我参加活动的List集合
		view.addObject("joinList", joinList);
		view.addObject("joinCount",joinCount);
		view.addObject("joinPage", joinPage);
	}
	
	/**
	 * 经济人推荐的活动
	 * @param view
	 * @param customer
	 */
	public void addUserRecommendActivityToModel(ModelAndView view,CustomerInfo customer){
		Page recommendPage=new Page();
		int recommendCount=eventInfoService.getRecommendActivityCount(customer);  //经济人推荐活动的总数量
		recommendPage.setRowCount(recommendCount);
		List<EventInfo> recommendList=eventInfoService.recommendActivity(recommendPage, customer); //经济人推荐的活动
		view.addObject("recommendList", recommendList);
		view.addObject("recommendCount",recommendCount);
		view.addObject("recommendPage", recommendPage);
	}
	
}
