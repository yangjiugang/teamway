package com.fc.flf.common.listener;

import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.fc.flf.account.service.ILoginService;
import com.fc.flf.common.domain.FcSysVisitor;

public class SessionListener implements HttpSessionBindingListener {
	
	@Autowired
	private ILoginService loginService;
	
	private FcSysVisitor visitorInfo;
	
	public SessionListener(FcSysVisitor visitorInfo){
		this.visitorInfo = visitorInfo;
	}
	
	@Override
	public void valueBound(HttpSessionBindingEvent event) {
		// TODO Auto-generated method stub

	}

	@Override
	public void valueUnbound(HttpSessionBindingEvent event) {
		try {
			ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(event.getSession().getServletContext()); 
			loginService = (ILoginService)context.getBean("loginServiceImpl");
			loginService.updateLoginStatus(visitorInfo);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
