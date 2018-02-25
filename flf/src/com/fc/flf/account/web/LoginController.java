package com.fc.flf.account.web;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.LogFactory;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fc.flf.account.service.ILoginService;
import com.fc.flf.common.domain.FcSysVisitor;
import com.fc.flf.common.listener.SessionListener;
import com.fc.flf.common.util.Constants;
import com.fc.flf.common.util.SessionInfo;
import com.fc.flf.common.web.BaseController;

/**
 * 
 * @author eddy song
 * @version 1.0 2012-01-08
 */

@Controller
public class LoginController extends BaseController {

	private static Logger logger = Logger.getLogger(LoginController.class);

	@Autowired
	private ILoginService loginService;

	@RequestMapping(value = "/login")
	public String login(Model model, HttpServletRequest request) throws Exception{
		try{
			String login_type = (String)request.getSession().getAttribute(Constants.LOGIN_TYPE);
			if(login_type != null){
				if(login_type.equals(Constants.ROLE_FPARTY)){
					return "/fparty/FLogin";
				}else if(login_type.equals(Constants.ROLE_EAGENT)){
					return "/eagent/ELogin";
				}else{
					return "/portal/Index";
				}
			}else{
				return "/portal/Index";
			}
		}catch(Exception e){
			if (logger.isDebugEnabled()) {
				e.printStackTrace();
			}
			throw e;
		}
	}
	
	@RequestMapping(value = "/sessionExpired")
	public String sessionExpired(Model model){
		addErrorMsg(model, "FLF-0702");
		return "/portal/Index";
	}

	@RequestMapping(value = "/authorize")
	public String authorize(Model model, HttpServletRequest request)
			throws Exception {
		try {
			if(logger.isDebugEnabled()){
				logger.debug("LoginController authorize-> begin");
			}
			
			SecurityContext sc = SecurityContextHolder.getContext();
			UserDetails user = (UserDetails) sc.getAuthentication().getPrincipal();
			String login_name = user.getUsername();
			
			//更新登录信息
			String ipAddress = request.getRemoteAddr();
			Date loginTime = new Date();
			FcSysVisitor visitorInfo = new FcSysVisitor();
			visitorInfo.setVisitorName(login_name);
			visitorInfo.setLoginIp(ipAddress);
			visitorInfo.setLoginTime(loginTime);
			visitorInfo.setIsOnline(0);
			request.getSession().setAttribute("SessionListener", new SessionListener(visitorInfo));
			loginService.updateVisitorLoginInfo(visitorInfo);
			
			// 取得用户信息
			
			visitorInfo = loginService.getVisitorById(login_name);
			if (visitorInfo == null) {
				if (logger.isDebugEnabled()) {
					logger.debug("LoginController authorize-> userinfo not found: "+ login_name);
				}
				addErrorMsg(model, getErrorMsg("FLF-0701"));
				return "/protal/Index";      
			}
			
			
			// 将用户信息装入session
			String visitorType = visitorInfo.getVisitorType();
			SessionInfo.setVisitorId(request, visitorInfo.getVisitorId());
			SessionInfo.setVisitorName(request, visitorInfo.getVisitorName());
			SessionInfo.setEmail(request, visitorInfo.getEmail());
			SessionInfo.setPhone(request, visitorInfo.getPhone());
			SessionInfo.setVisitorStatus(request,visitorInfo.getVisitorStatus());
			SessionInfo.setVisitorType(request, visitorType);
			SessionInfo.setLoginTime(request, (visitorInfo.getLoginTime() == null) ? ("") : (visitorInfo.getLoginTime()).toString());
			SessionInfo.setLoginIP(request, visitorInfo.getLoginIp());
					
			if (visitorType.equals(Constants.ROLE_EAGENT)) {
				return "redirect:/eagent_EIndex";
			} else if (visitorType.equals(Constants.ROLE_FPARTY)) {
				return "redirect:/fPartyIndex";
			} else {
				return "/portal/Index";
			}
		} catch (Exception e) {
			if (logger.isDebugEnabled()) {
				logger.error(e);
			}
			throw e;
		}
	}
}
