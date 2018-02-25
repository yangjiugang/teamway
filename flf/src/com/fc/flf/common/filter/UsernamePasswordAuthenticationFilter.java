package com.fc.flf.common.filter;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter;
import org.springframework.security.web.util.TextEscapeUtils;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.fc.flf.account.service.ILoginService;
import com.fc.flf.common.domain.FcSysVisitor;
import com.fc.flf.common.util.Constants;

public class UsernamePasswordAuthenticationFilter extends
		AbstractAuthenticationProcessingFilter {

	private ILoginService loginService;
	
	private String defaultTargetUrl = "/authorize";
	
	private String authenticationFailureUrl = "/login?login_error=1";
	
	protected UsernamePasswordAuthenticationFilter() {
		super("/j_spring_security_check");
	}

	@Override
	public Authentication attemptAuthentication(HttpServletRequest request,
			HttpServletResponse reponse) throws AuthenticationException,
			IOException, ServletException {
		String username =  request.getParameter("j_username");
		String password = request.getParameter("j_password");
		UsernamePasswordAuthenticationToken authRequest = null;
		
		// Place the last username attempted into HttpSession for views
        HttpSession session = request.getSession(false);
        if (session != null || getAllowSessionCreation()) {
            request.getSession().setAttribute("SPRING_SECURITY_LAST_USERNAME", TextEscapeUtils.escapeEntities(username));
        }
        
        String login_type = request.getParameter(Constants.LOGIN_TYPE);
		ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext()); 
		loginService = (ILoginService)context.getBean("loginServiceImpl");
		FcSysVisitor visitor = loginService.getVisitorById(username);
		if(!visitor.getVisitorType().equals(login_type)){
			authRequest = new UsernamePasswordAuthenticationToken(username, "");
		}else{
			authRequest = new UsernamePasswordAuthenticationToken(username, password);
		}
        
        setDetails(request, authRequest);
        return this.getAuthenticationManager().authenticate(authRequest);

	}
//	}
//	
//	public void successfulAuthentication(HttpServletRequest request, HttpServletResponse response,
//            Authentication authResult) throws IOException, ServletException {
//
//        if (logger.isDebugEnabled()) {
//            logger.debug("Authentication success. Updating SecurityContextHolder to contain: " + authResult);
//        }
//        
//        SecurityContextHolder.getContext().setAuthentication(authResult);
//
//        // Fire event
//        if (this.eventPublisher != null) {
//            eventPublisher.publishEvent(new InteractiveAuthenticationSuccessEvent(authResult, this.getClass()));
//        }
//        if(successHandler == null){
//            successHandler = new AuthenticationSuccessHandler(getDefaultTargetUrl());
//        }
//        successHandler.onAuthenticationSuccess(request, response, authResult);
//    }
//    
//    public void unsuccessfulAuthentication(HttpServletRequest request, HttpServletResponse response,
//            AuthenticationException failed) throws IOException, ServletException {
//        SecurityContextHolder.clearContext();
//        
//        if(failureHandler == null){
//            failureHandler = new MySimpleUrlAuthenticationFailureHandler(getDefaultFailureUrl());
//        }
//        
//        if (logger.isDebugEnabled()) {
//            logger.debug("Authentication request failed: " + failed.toString());
//            logger.debug("Updated SecurityContextHolder to contain null Authentication");
//            logger.debug("Delegating to authentication failure handler" + failureHandler);
//        }
//
//        HttpSession session = request.getSession(false);
//
//        if (session != null || allowSessionCreation) {
//            request.getSession().setAttribute(SPRING_SECURITY_LAST_EXCEPTION_KEY, failed);
//        }
//
//        rememberMeServices.loginFail(request, response);
//
//        failureHandler.onAuthenticationFailure(request, response, failed);
//    }

	
	/**
     * Provided so that subclasses may configure what is put into the authentication request's details
     * property.
     *
     * @param request that an authentication request is being created for
     * @param authRequest the authentication request object that should have its details set
     */
    protected void setDetails(HttpServletRequest request, UsernamePasswordAuthenticationToken authRequest) {
        authRequest.setDetails(authenticationDetailsSource.buildDetails(request));
    }

    public String getDefaultTargetUrl() {
        return defaultTargetUrl;
    }

	public void setDefaultTargetUrl(String defaultTargetUrl) {
		this.defaultTargetUrl = defaultTargetUrl;
	}

	public String getAuthenticationFailureUrl() {
		return authenticationFailureUrl;
	}

	public void setAuthenticationFailureUrl(String authenticationFailureUrl) {
		this.authenticationFailureUrl = authenticationFailureUrl;
	}

}
