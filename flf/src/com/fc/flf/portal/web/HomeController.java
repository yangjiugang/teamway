package com.fc.flf.portal.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fc.flf.account.service.ILoginService;
import com.fc.flf.common.domain.FcSysAd;
import com.fc.flf.common.domain.FcSysVisitor;
import com.fc.flf.common.listener.SessionListener;
import com.fc.flf.common.util.DateTools;
import com.fc.flf.common.util.SessionInfo;
import com.fc.flf.portal.service.IFcSysAdService;
import com.fc.flf.portal.service.IHouseInfoService;
import com.fc.flf.portal.service.IUserInfoService;

@Controller
public class HomeController {
	@Resource
	private IFcSysAdService fsas;
	@Resource
	private IHouseInfoService houseInfoService;
	@Resource
	private ILoginService loginService;
	@Resource
	private IUserInfoService userInfoService;
	
	@RequestMapping(value = {"/","/index"})
    public String index(Model model,HttpServletRequest request) throws Exception {
		String date = DateTools.dateToString(DateTools.getCurrentWeekday());
		int userId = 0;
		try{
			userId = SessionInfo.getVisitorId(request);
		}catch(Exception e){}
		SecurityContext sc = SecurityContextHolder.getContext();
		Object obj = sc.getAuthentication().getPrincipal();
		if(obj instanceof UserDetails){
			UserDetails user = (UserDetails)obj;
			String loginId =user.getUsername();
			FcSysVisitor visitorInfo = loginService.getVisitorById(loginId);
			visitorInfo.setIsOnline(0);
			request.getSession().setAttribute("SessionListener", new SessionListener(visitorInfo));
			//更新在线状态
			loginService.updateLoginStatus(visitorInfo);
			buildSession(visitorInfo,request);
		}
		List<FcSysAd> Advertisements = fsas.findAdvertisementByType(12);
		model.addAttribute("homeInfoNewHouseList", houseInfoService.findHomeInfoNewHouseList());
		model.addAttribute("history",houseInfoService.findRecentBrowsers());
		model.addAttribute("collectHouses", houseInfoService.findCollectHouse());
		model.addAttribute("Advertisements", Advertisements);
		model.addAttribute("skimUsers",userInfoService.getSkimUserListByUserId(userId));
		model.addAttribute("attentionHouseInfos", houseInfoService.attentionHouseInfos());
		model.addAttribute("everyoneAttentions", houseInfoService.everyoneAttention());
		model.addAttribute("weekActivitys", houseInfoService.weekActivity(date));
		return "/portal/Index";
    }
	
	@RequestMapping(value = "/err")
    public String err() {
        return "/Error";
    }
	
	/**
	 * 对于记住登录状态的用户,建立session信息
	 * 
	 * @param visitorInfo
	 * @param request
	 */
	public void buildSession(FcSysVisitor visitorInfo, HttpServletRequest request){
		String visitorType = visitorInfo.getVisitorType();
		SessionInfo.setVisitorId(request, visitorInfo.getVisitorId());
		SessionInfo.setVisitorName(request, visitorInfo.getVisitorName());
		SessionInfo.setEmail(request, visitorInfo.getEmail());
		SessionInfo.setPhone(request, visitorInfo.getPhone());
		SessionInfo.setVisitorStatus(request,visitorInfo.getVisitorStatus());
		SessionInfo.setVisitorType(request, visitorType);
		SessionInfo.setLoginTime(request, (visitorInfo.getLoginTime() == null) ? ("") : (visitorInfo.getLoginTime()).toString());
		SessionInfo.setLoginIP(request, visitorInfo.getLoginIp());
	}
}
