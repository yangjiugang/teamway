package com.fc.flf.eagent.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fc.flf.common.domain.HouseGroupInfo;
import com.fc.flf.common.domain.HouseInfo;
import com.fc.flf.common.domain.UserDynamic;
import com.fc.flf.common.domain.UserFriends;
import com.fc.flf.common.domain.UserInfo;
import com.fc.flf.common.domain.UserRecommendShare;
import com.fc.flf.common.util.Page;
import com.fc.flf.common.util.SessionInfo;
import com.fc.flf.eagent.service.IStatUserInfoService;
import com.fc.flf.eagent.service.IUserFriendsService;
import com.fc.flf.eagent.service.IUserStudySaleHouseService;
import com.fc.flf.portal.service.IUserInfoService;

@Controller
public class StatUserInfoController {

	@Resource
	private IUserStudySaleHouseService userStudySaleHouseService;
	@Resource
	private IUserFriendsService userFriendsService;
	@Resource
	private IUserInfoService userInfoService;
	@Resource
	private IStatUserInfoService statUserInfoService;
	
	@RequestMapping("/getStatInfo")
	public String getStatInfo(int userId,String getType,String listType,Page page,Model model){
		if("".equals(listType.trim()))
			listType="house";
		if("house".equals(listType.trim())){	//选项卡前5项(认售,关注,好友推荐,客户推荐 楼盘)
			List<HouseInfo> houseInfos =null;
			if(!"".equals(getType) && "saleHouse".equals(getType.trim())){		//认售楼盘
				houseInfos = userStudySaleHouseService.getUserSaleHouses(page, userId);
			}else if(!"".equals(getType) && "collectHouse".equals(getType.trim())){	//关注楼盘
				houseInfos = userStudySaleHouseService.getUserSkimHouse(page, userId);
			}else if(!"".equals(getType) && "priceHouse".equals(getType.trim())){		//喊价楼盘
				houseInfos = userStudySaleHouseService.getUserPriceHouse(page, userId);	
			}else if(!"".equals(getType) && "friendHouse".equals(getType.trim())){	//好友推荐楼盘
				houseInfos = userStudySaleHouseService.getUserFriendHouse(page, userId);
			}else if(!"".equals(getType) && "customerHouse".equals(getType.trim())){		//客户推荐楼盘
				houseInfos = userStudySaleHouseService.getUserCustomerHouse(page, userId);
			}else{
				
			}
			
			houseInfos=repaleImgStr(houseInfos);
			model.addAttribute("houseInfos", houseInfos);
			model.addAttribute("count", page.getRowCount());
			model.addAttribute("type", getType);
			model.addAttribute("listType", listType);
			model.addAttribute("userId", userId);
			return "/eagent/FrameHouse";
		}else{
			if(!"".equals(getType) && "houseGroup".equals(getType.trim())){		//购房团
				List<HouseGroupInfo> houseGroupInfos = userStudySaleHouseService.getUserCustomerHouseGroup(page, userId);
				model.addAttribute("houseGroupInfos", houseGroupInfos);
				model.addAttribute("count", page.getRowCount());
				model.addAttribute("type", getType);
				model.addAttribute("listType", listType);
				model.addAttribute("userId", userId);
				return "/eagent/FrameHouseGroup";
			}else if(!"".equals(getType) && "friends".equals(getType.trim())){	//好友
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("userId", userId);
				List<UserFriends> userFriends = userFriendsService.selectFriendsByUserIdBeforeSum(page, map);
				model.addAttribute("userFriends", userFriends);
				model.addAttribute("count", page.getRowCount());
				model.addAttribute("type", getType);
				model.addAttribute("listType", listType);
				model.addAttribute("userId", userId);
				return "/eagent/FrameUserFriends";
			}else if(!"".equals(getType) && "discuss".equals(getType.trim())){	//评论
				return "/eagent/FrameHouseGroup";
			}
			return "";
		}
	}
	
	/**
	 * 跳转-FriendStatUserInfo.jsp 读取好友详细信息
	 * @param userId
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/jumpStatUserInfo")
	public String jumpStatUserInfo(int userId,Model model){
		UserInfo userInfo = userInfoService.getUserInfoById(userId);
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("userId", userId);
		return "/eagent/FriendStatUserInfo";
	}
	
	@RequestMapping(value="/statInfo")
	public String getStatInfo(Page page,HttpServletRequest request,Model model){
		int userId=-1;
		try{
			userId=SessionInfo.getVisitorId(request);
		}catch (Exception e) {
			return "/";
		}
		
		List<UserRecommendShare> userRecommendShares = null;
		if ("".equals(request.getParameter("type")) || request.getParameter("type")== null) {
			userRecommendShares = statUserInfoService.selectStatUserInfoByUserId(page, userId);
		}else{
			userRecommendShares = statUserInfoService.selectStatUserInfoByFriendId(page, userId);
			model.addAttribute("type", 1);
		}
		model.addAttribute("userRecommendShares", userRecommendShares);
		return "/eagent/Eagent_home_FrameStatInfo";
	}
	
	@RequestMapping(value="/getDynamic")
	public String getDynamic(HttpServletRequest request , Model model){
		int userId=-1;
		try{
			userId=SessionInfo.getVisitorId(request);
		}catch (Exception e) {
			return "/";
		}
		
		List<UserDynamic> userDynamics = null;
		if ("".equals(request.getParameter("type")) || request.getParameter("type")== null) {
			userDynamics = statUserInfoService.getUserDynamic(userId);
		}else{
			userDynamics = statUserInfoService.getFriendDynamic(userId);
			model.addAttribute("type", 1);
		}
		model.addAttribute("userDynamics", userDynamics);
		return "/eagent/Eagent_home_FrameDynamic";
	}
	
	@RequestMapping(value="/delDynamic")
	public String delDynamic(String makeType,int userId,HttpServletRequest request ,Model model){
		
		try{
			SessionInfo.getVisitorId(request);
		}catch (Exception e) {
			return "/";
		}
		
		if(!"".equals(makeType.trim()) && makeType!=null){
			if ("1".equals(makeType)) {		//约会客户
				statUserInfoService.delContactRecordById(userId);
			}else if ("2".equals(makeType)) {		//收藏房团
				statUserInfoService.delCollectHouseGroupById(userId);
			}else if ("3".equals(makeType)) {		//收藏楼盘
				statUserInfoService.delCollectHouseById(userId);
			}else if ("4".equals(makeType)) {		//认售学习
				statUserInfoService.delSaleHouseById(userId);
			}else {		//认售学习
				statUserInfoService.delSaleHouseById(userId);
			}
		}
		
		return "forward:getDynamic";
	}
	
	@RequestMapping(value="/delStatInfo")
	public String delStatInfo(int makeType,int userId,HttpServletRequest request ,Model model){
		
		try{
			SessionInfo.getVisitorId(request);
		}catch (Exception e) {
			return "/";
		}
		statUserInfoService.delRecommendShareById(userId);
		return "forward:statInfo";
	}
	
	//评论结果集过滤,转换[imgSrc]= <img imgSrc /> 
	private List<HouseInfo>  repaleImgStr(List<HouseInfo> list){
		for (int i = 0; i < list.size(); i++) {
			if(list.get(i)!=null){
				HouseInfo houseInfo=list.get(i);
				if (houseInfo.getHouseDesc()!=null && houseInfo.getHouseDesc().indexOf("[")!=-1) {
					houseInfo.setHouseDesc(houseInfo.getHouseDesc().replaceAll("\\[", "<img src='images/face/"));
					houseInfo.setHouseDesc(houseInfo.getHouseDesc().replaceAll("\\]", "' />"));
					list.set(i, houseInfo);
				}
				
			}
		}		
		return list;
	}
		
}
