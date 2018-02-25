package com.fc.brms.account.web;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fc.brms.account.service.ILoginService;
import com.fc.brms.common.domain.FcSysFunc;
import com.fc.brms.common.domain.FcSysVisitor;
import com.fc.brms.common.util.SessionInfo;
import com.fc.brms.common.web.BaseController;

/**
 * 登录授权控制类
 * 
 * @author eddy song
 * @version 1.0 2012-03-27
 */

@Controller
public class LoginController extends BaseController {

	private static Log logger = LogFactory.getLog(LoginController.class);
	
	Collection<GrantedAuthority> auth;

	@Autowired
	private ILoginService loginService;

	/**
	 * 登录验证失败/系统默认页面
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = {"/","/login"})
	public String login(Model model, HttpServletRequest request) throws Exception{
		try{
			request.getSession().setAttribute("SPRING_SECURITY_LAST_USERNAME", null);
			//对记住用户状态的自动登录
			SecurityContext sc = SecurityContextHolder.getContext();
			Object obj = sc.getAuthentication().getPrincipal();
			if(obj instanceof UserDetails){
				UserDetails user = (UserDetails)obj;
				String loginName =user.getUsername();
				FcSysVisitor visitorInfo = loginService.getVisitorById(loginName);
				bulidSession(request,visitorInfo);
				return "/homepage/Index";
			}
			return "/Login";
		}catch(Exception e){
			if (logger.isErrorEnabled()) {
				if(logger.isErrorEnabled())
					logger.error(e);
			}
			throw e;
		}
	}
	
	@RequestMapping(value = "/sessionExpired")
	public String sessionExpired(Model model){
		addErrorMsg(model, "BRM-0701");
		return "/Login";
	}

	/**
	 * 登录验证成功/授权
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/authorize")
	public String authorize(Model model, HttpServletRequest request)
			throws Exception {
		try {
			HttpSession s = request.getSession();
			SecurityContext sc = (SecurityContext) s.getAttribute("SPRING_SECURITY_CONTEXT");
			UserDetails user = (UserDetails) sc.getAuthentication().getPrincipal();
			//authorize role 
			auth = new ArrayList<GrantedAuthority>();
			for(GrantedAuthority ga: user.getAuthorities()){
				auth.add(ga);
			}
			
			//get user's login name
			String loginName = user.getUsername();
			FcSysVisitor visitorInfo = loginService.getVisitorById(loginName);
			if (visitorInfo == null) {
				if (logger.isErrorEnabled()) {
					logger.debug("LoginController authorize-> userinfo not found: "+ loginName);
				}
				addErrorMsg(model, getErrorMsg("FLF-0702"));
				return "/Login";
			}
			
			UsernamePasswordAuthenticationToken upat = (UsernamePasswordAuthenticationToken)sc.getAuthentication();
			List<FcSysFunc> funcList = loginService.getVisitorFunctionsbyId(loginName);
			
			//authorize function
 			for(FcSysFunc fsf: funcList){
 				auth.add(new GrantedAuthorityImpl(fsf.getFuncCode()));
 			}
 			UserDetails new_user = new User(user.getUsername(),user.getPassword(),true,true,true,true,auth);
			sc.setAuthentication(new UsernamePasswordAuthenticationToken(new_user,upat.getCredentials(),auth));
			
			//build session
			bulidSession(request,visitorInfo);
			return "/homepage/Index";
		} catch (Exception e) {
			if (logger.isErrorEnabled()) {
				logger.error(e);
			}
			throw e;
		}
	}
	
	/**
	 * 建立session信息
	 * 
	 * @param request
	 * @param visitorInfo
	 */
	public void bulidSession(HttpServletRequest request, FcSysVisitor visitorInfo){
		SessionInfo.setVisitorId(request, visitorInfo.getVisitorId());
		SessionInfo.setCompanyId(request, visitorInfo.getCompanyId());
		SessionInfo.setVisitorName(request, visitorInfo.getVisitorName());
		SessionInfo.setLoginIP(request, request.getRemoteAddr());
		SessionInfo.setUserStatus(request, visitorInfo.getUserStatus());
		SessionInfo.setCompanyName(request, visitorInfo.getCompanyName());
		SessionInfo.setOrganizationId(request, visitorInfo.getOrganizationId());
		SessionInfo.setOrganizationName(request, visitorInfo.getOrganizationName());
	}
}
