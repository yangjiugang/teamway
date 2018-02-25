package com.fc.flf.eagent.web;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fc.flf.common.domain.CustomerInfoDetail;
import com.fc.flf.common.domain.EventInfo;
import com.fc.flf.common.domain.HouseGroupInfo;
import com.fc.flf.common.domain.HouseInfo;
import com.fc.flf.common.domain.UserFriends;
import com.fc.flf.common.domain.UserInfo;
import com.fc.flf.common.domain.UserRecommendShare;
import com.fc.flf.common.util.Page;
import com.fc.flf.common.util.SessionInfo;
import com.fc.flf.eagent.mapper.IHouseGroupInfoMapper;
import com.fc.flf.eagent.service.ICustomerFunService;
import com.fc.flf.eagent.service.IUserFriendsService;
import com.fc.flf.eagent.service.IUserStudySaleHouseService;
import com.fc.flf.fparty.service.IEventInfoService;
import com.fc.flf.fparty.service.IUserRecommendShareService;

/**
 * 经纪人推荐分享
 * @author Administrator
 *
 */
@Controller
public class UserRecommendController {
	@Autowired
	private ICustomerFunService customerFunService;
	@Resource
	private IUserFriendsService userFriendsService;
	@Resource
	private IHouseGroupInfoMapper groupInfoMapper;
	@Resource
	private IUserStudySaleHouseService saleHouseService;
	@Resource
	private IEventInfoService eventInfoService;
	@Resource
	private IUserRecommendShareService userRecommendShareService;
	
	
	@RequestMapping(value="/UesrTecommendAll")
	public ModelAndView recommend(HttpServletRequest request)throws Exception{		
		int userId=SessionInfo.getVisitorId(request);
		UserInfo userInfo=new UserInfo();
		userInfo.setUserId(userId);
		//得到客户列表
		Map<String, Object> customerMap = new HashMap<String, Object>();
		customerMap.put("userId", userId);
		customerMap.put("cusTomerName", null);
		Page customerPage=new Page();
		customerPage.setPageSize(20);
		List<CustomerInfoDetail> lstCustomerInfoDetail=customerFunService.getCusTomerList(customerMap, customerPage);	
		//得到好有列表
		Map<String, Object> userMap = new HashMap<String, Object>();
		userMap.put("userId", userId);
		Page userPage=new Page();
		userPage.setPageSize(20);
		List<UserFriends> friends = userFriendsService.selectFriendsByUserIdToPage(userPage,userMap);		
		//旅游路线
		Date date=new Date();
		Map<String, Object> groupMap=new HashMap<String, Object>();
		Page groupPage=new Page();
		groupPage.setPageSize(6);
		int groupCount=groupInfoMapper.findAllHouseGroupInfoCount(date);
		groupPage.setRowCount(groupCount);
		groupMap.put("now", date);
		groupMap.put("limit", groupPage.getLimit());
		List<HouseGroupInfo> lstHouseGroupInfo=groupInfoMapper.findAllHouseGroupInfo(groupMap);
		//推荐房源
		Page salePage=new Page();
		salePage.setPageSize(8);
		int saleCount=saleHouseService.getSaleHouseInfoCount(userInfo);
		salePage.setRowCount(saleCount);
		List<HouseInfo> saleHouseInfo=saleHouseService.saleHouseInfo(salePage,userInfo);  //经纪人认售的楼盘	
		//会所活动
		Page eventPage=new Page();
		eventPage.setPageSize(4);
		List<EventInfo> eventInfos=eventInfoService.fingAllEventInfo(eventPage);
		//经纪人的所有的推荐分享
		Page userRecommendPage=new Page();
		int userRecommendCount=userRecommendShareService.findAllRecommendByUserIdCount(userInfo);
		List<UserRecommendShare> userRecommendShareList=userRecommendShareService.findAllRecommendByUserId(userRecommendPage,userInfo);
		
		ModelAndView view = new ModelAndView("/eagent/HomeTJFXY4");
		view.addObject("lstCustomerInfoDetail",lstCustomerInfoDetail);
		view.addObject("friends",friends);
		
		view.addObject("lstHouseGroupInfo",lstHouseGroupInfo);  
		view.addObject("groupPage",groupPage);
		
		view.addObject("saleHouseInfo",saleHouseInfo);  
		view.addObject("salePage",salePage);
		
		view.addObject("eventInfos",eventInfos);  
		view.addObject("eventPage",eventPage);
		
		view.addObject("userRecommendShareList",userRecommendShareList);  
		view.addObject("userRecommendPage",userRecommendPage);
		view.addObject("userRecommendCount",userRecommendCount);
		
		view.addObject("userInfo",userInfo);
   		view.addObject("result", "true");
   		return view;
	}
	
	@RequestMapping(value="/ajaxRecommendHouseGroupInfo")
	@ResponseBody
	public List<HouseGroupInfo> houseGroupInfo(Page page){
		Date date=new Date();
		Map<String, Object> map=new HashMap<String, Object>();
		page.setPageSize(6);
		int n=groupInfoMapper.findAllHouseGroupInfoCount(date);
		page.setRowCount(n);
		map.put("now", date);
		map.put("limit", page.getLimit());
		List<HouseGroupInfo> list=groupInfoMapper.findAllHouseGroupInfo(map);
		return list;
	}
	
	@RequestMapping(value="/ajaxRecommendHouseInfo")
	@ResponseBody
	public List<HouseInfo> houseInfo(Page salePage,UserInfo userInfo){
		//推荐房源	
		salePage.setPageSize(8);
		int saleCount=saleHouseService.getSaleHouseInfoCount(userInfo);
		salePage.setRowCount(saleCount);
		List<HouseInfo> saleHouseInfo=saleHouseService.saleHouseInfo(salePage,userInfo);  //经纪人认售的楼盘	
		return saleHouseInfo;		
	}
	
	@RequestMapping(value="/ajaxEventInfos")
	@ResponseBody
	public List<EventInfo> houseInfo(Page eventPage){
		//会所活动
		eventPage.setPageSize(4);
		List<EventInfo> eventInfos=eventInfoService.fingAllEventInfo(eventPage);
		return eventInfos;
	}
	
	@RequestMapping(value="/ajaxUserRecommendShare")
	@ResponseBody
	public List<UserRecommendShare> UserRecommendShare(Page recommendSharePage,UserInfo userInfo){
		//经济人的所有推荐分享
		List<UserRecommendShare> userRecommendShareList=userRecommendShareService.findAllRecommendByUserId(recommendSharePage,userInfo);
		return userRecommendShareList;
	}
	
}
