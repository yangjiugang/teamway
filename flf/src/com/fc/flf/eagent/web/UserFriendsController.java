package com.fc.flf.eagent.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fc.flf.common.domain.StatUserInfo;
import com.fc.flf.common.domain.UserFriends;
import com.fc.flf.common.domain.UserInfo;
import com.fc.flf.common.domain.UserMsg;
import com.fc.flf.common.util.DateTools;
import com.fc.flf.common.util.Page;
import com.fc.flf.common.util.SessionInfo;
import com.fc.flf.eagent.service.IStatUserInfoService;
import com.fc.flf.eagent.service.IUserFriendsService;
import com.fc.flf.eagent.service.IUserMsgService;
import com.fc.flf.portal.service.IUserInfoService;

@Controller
public class UserFriendsController {

	@Resource
	private IUserFriendsService userFriendsService;
	@Resource
	private IUserMsgService userMsgService;
	@Resource
	private IStatUserInfoService statUserInfoService;
	
	@RequestMapping(value="/statUserInfo")
	@ResponseBody
	public StatUserInfo statUserInfo(int userId,Model model){
		StatUserInfo statUserInfo = statUserInfoService.selectStatUserInfo(userId);
		return statUserInfo;
	}
	
	@RequestMapping(value="/myFriends")
	public String getFriendList(String frameName,String sex,String city,Page page,HttpServletRequest request,Model model)throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		int userId=SessionInfo.getVisitorId(request);
		int count = -1;
		int sexNum=-1;
		String userCity=new String(city.getBytes("iso8859-1"),"UTF-8");
		List<UserFriends> friends=null;
		if("".equals(frameName.trim()) || frameName==null){
			frameName="select";
		}
		
		map.put("userId", userId);
		if(!"".equals(sex) && sex!=null ){
			sexNum=Integer.parseInt(sex);
			if(sexNum>-1)
				map.put("sex", sexNum);
		}
		if(!"".equals(city) && city!=null && !"不限".equals(userCity)){
			map.put("city", userCity);
		}
		if("select".equals(frameName.trim())){
			friends = userFriendsService.selectFriendsByUserIdBeforeSum(page,map);
			
		}else if("user".equals(frameName.trim())){
			friends = userFriendsService.selectFriendsByUserIdToPage(page,map);
			
		}else if("friend".equals(frameName.trim())){			
			friends = userFriendsService.selectFriendsByFriendIdToPage(page,map);
			
		}else{
			
		}

		model.addAttribute("sex",sexNum==-1?"":sexNum);
		model.addAttribute("city",userCity);
		model.addAttribute("frameName", frameName);
		model.addAttribute("friends", friends);
		return "/eagent/FrameFriends";
	}
	
	@RequestMapping(value="/eagent_friend_jumpFriends")
	public String showFriend(HttpServletRequest request,Model model){
		System.out.println(request.getParameter("sex"));
		if(request.getParameter("sex")!=null && !"".equals(request.getParameter("sex").trim())){
			int sex = Integer.parseInt(request.getParameter("sex"));
			model.addAttribute("sex", sex>-1? sex-1:"");
		}
		if(request.getParameter("city")!=null && !"".equals(request.getParameter("city").trim())){
			String city=request.getParameter("city");
			model.addAttribute("city",city);
		}
		if(request.getParameter("row")!=null && !"".equals(request.getParameter("row").trim())){
			String row=request.getParameter("row");
			model.addAttribute("row", row);
		}
		return "/eagent/MyFriends";
	}
	
	@RequestMapping(value="/sendMsg")
	public String sendMsg(String msgContent,int friendId,HttpServletRequest request,Model model) throws Exception{
		int userId=SessionInfo.getVisitorId(request);
		String userName=SessionInfo.getVisitorName(request);
		DateTools dt=new DateTools();
		UserMsg msgObj=new UserMsg();
		
		msgObj.setIsRead(0);
		msgObj.setSendTime(dt.dateToHour());
		msgObj.setMsgContent(msgContent==""? "null":msgContent);
		msgObj.setMsgType(1);
		
		msgObj.setReceiveUserId(friendId);
		msgObj.setReceiveUserType(0);
		
		msgObj.setSendUserId(userId);
		msgObj.setSendUserName(userName);
		msgObj.setSendUserType(0);
		int row=userMsgService.saveUserMsg(msgObj);
		model.addAttribute("row", row);
		if (!"".equals(request.getParameter("invite"))) {
			return "redirect:/findFriends";
		}
		return "redirect:/eagent_friend_jumpFriends";
	}
	
	@RequestMapping(value="/jumpInvite")
	public String jumpInvite(Page page){
		page.setCurPage(1);
		page.setPageSize(6);
		return "/eagent/InviteFriend";
	}
	
	@RequestMapping(value="/findFriends")
	public String findFriends(Page page,HttpServletRequest request,Model model) throws Exception{
		int userId = SessionInfo.getVisitorId(request);
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(!"".equals(request.getParameter("subBtn")) && request.getParameter("subBtn")!=null){
			String onlineStr = request.getParameter("isOnline");
			String userCity = request.getParameter("userCity");
			String registeredAddressStr = request.getParameter("registeredAddress");
			String jinyanStr = request.getParameter("jinyan");
			String sexStr = request.getParameter("sex");
			String keyWord = request.getParameter("keyWord");
			
			int isOnline = -1;
			int registeredAddress = -1;
			int jinyan = -1;
			int sex = -1;
			
			//类型转换 并压入SQL Map
			if (!"".equals(onlineStr)) {
				isOnline=Integer.parseInt(onlineStr);
				map.put("isOnline", isOnline==-1? null:isOnline);
			}
			if (!"".equals(registeredAddressStr)) {
				registeredAddress = Integer.parseInt(registeredAddressStr);
				map.put("registeredAddress", registeredAddress==-1? null:registeredAddress);
			}
			if(!"".equals(jinyanStr)){
				jinyan = Integer.parseInt(jinyanStr);
				//map.put("jinyan", jinyan);
			}
			if(!"".equals(sexStr)){
				sex = Integer.parseInt(sexStr);
				map.put("sex", sex==-1?null:sex);
			}
			map.put("userCity", userCity=="null"?null:userCity);
			map.put("keyWord", keyWord=="null"?null:keyWord);
			
			model.addAttribute("subBtn", request.getParameter("subBtn"));
		}
				
		List<UserFriends> friends = userFriendsService.findUserFriends(page,map);
		model.addAttribute("friends",friends);
		return "/eagent/InviteFriend";
	}
	
	@RequestMapping(value="/pluginFriend")
	public String pluginFriend(HttpServletRequest request,Model model){
		int userId=-1;
		try{
			userId=SessionInfo.getVisitorId(request);
		}catch (Exception ex) {
			return "/";
		}
		Page page=new Page();
		page.setCurPage(1);
		page.setPageSize(5);
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("userId", userId);
		List<UserFriends> userFriends = userFriendsService.selectFriendsByUserIdBeforeSum(page,map);
		model.addAttribute("userFriends", userFriends);
		return "/eagent/FriendsPlugin";
	}
}
