package com.fc.flf.portal.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fc.flf.common.domain.UserInfo;
import com.fc.flf.common.domain.UserPhotos;
import com.fc.flf.common.util.Page;
import com.fc.flf.common.util.SessionInfo;
import com.fc.flf.portal.service.IUserInfoService;
import com.fc.flf.portal.service.IUserPhotosService;

@Controller
public class UserInfoController {

	@Resource
	private IUserInfoService userInfoService;
	@Resource
	private IUserPhotosService userPhotosService;
	
	@RequestMapping(value="/getUserInfoList")
	public String userInfoList(HttpServletRequest request,Page page,Model model){
		int userId=-1;
		List<UserInfo> skimUsers = null;
		try{
			userId=SessionInfo.getVisitorId(request);
			skimUsers = userInfoService.getSkimUserListByUserId(userId);
		}catch (Exception ex) {
		}
		List<UserInfo> userInfos = userInfoService.userInfoListOnPage(page);
		
		List<UserInfo> skimUsersOnTop =userInfoService.getSkimUserListOnTop();
		List<UserInfo> skimUsersOnOldTop =userInfoService.getSkimUserListOnOldTop();
		model.addAttribute("skimUsers", skimUsers);
		model.addAttribute("skimUsersOnTop", skimUsersOnTop);
		model.addAttribute("skimUsersOnOldTop", skimUsersOnOldTop);
		model.addAttribute("userInfos", userInfos);
		model.addAttribute("rowCount", page.getRowCount());
		return "/portal/ShowSECList";
	}
	
	@RequestMapping(value="/userByLikeFind")
	public String userByLikeFind(HttpServletRequest request,int isOnline,String userCity,int registeredAddress,int sex,
			String submitBtn,String keyWord,Page page,Model model){
		int userId=-1;
		try{
			userId=SessionInfo.getVisitorId(request);
		}catch (Exception ex){
			return "/toflogin";
		}
		if(submitBtn!=null && !"".equals(submitBtn)){
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("isOnline", isOnline<0 ? null:isOnline);
			map.put("registeredAddress", registeredAddress <0 ? null:registeredAddress);
			map.put("sex", sex <0 ? null : sex);
			if(userCity.equals("notVal") || "".equals(userCity.trim())){
				map.put("userCity", null);
			}else{
				map.put("userCity", userCity);
			}
			
			if(keyWord.equals("notVal") || "".equals(keyWord.trim()) || "请输入关键词".equals(keyWord.trim())){
				map.put("keyWord", null);
			}else{
				map.put("keyWord", keyWord);
			}
			
			int rowCount = userInfoService.findUserInfoCountByLike(map);
			page.setRowCount(rowCount);
			int start=(page.getCurPage() - 1) * page.getPageSize();
			map.put("start", start);
			map.put("end", page.getPageSize());
			
			List<UserInfo> userInfos = userInfoService.findUserInfoByLike(map);
			List<UserInfo> skimUsers = userInfoService.getSkimUserListByUserId(userId);
			List<UserInfo> skimUsersOnTop =userInfoService.getSkimUserListOnTop();
			List<UserInfo> skimUsersOnOldTop =userInfoService.getSkimUserListOnOldTop();
			model.addAttribute("skimUsers", skimUsers);
			model.addAttribute("skimUsersOnTop", skimUsersOnTop);
			model.addAttribute("skimUsersOnOldTop", skimUsersOnOldTop);
			model.addAttribute("userInfos", userInfos);
			map.put("submitBtn", submitBtn);
			model.addAttribute("map", map);
			model.addAttribute("rowCount", rowCount);
			model.addAttribute("isLikeFind", 1);
			return "/portal/ShowSECList";
		}else{
			model.addAttribute("userId", userId);
			model.addAttribute("page", page);
			return "forward:/getUserInfoList";
		}
	}
	
	@RequestMapping(value="/showSECInfo")
	public String showUserInfo(int userId,Model model){
		UserInfo userInfo = userInfoService.getUserInfoById(userId);
		List<UserPhotos> userPhotos = userPhotosService.getUserPhotosByUserId(userId);
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("userPhotos", userPhotos);
		return "/portal/SECInfoFrame";
	}
}
