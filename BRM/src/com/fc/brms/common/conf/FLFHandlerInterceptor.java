package com.fc.brms.common.conf;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.fc.brms.common.util.Page;

public class FLFHandlerInterceptor extends HandlerInterceptorAdapter {

	@Override
	public void postHandle(HttpServletRequest request,HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		String name = handler.getClass().getName();
		if(name.endsWith("Controller") && modelAndView != null) {
			Page page = (Page)modelAndView.getModel().get("page");
			if(page != null) {
				modelAndView.addObject("page", page.getPage());
//				modelAndView.addObject("rows", page.getRows());
				modelAndView.addObject("total", page.getTotal());
				modelAndView.addObject("sort", page.getSord());
				modelAndView.addObject("records", page.getRecords());
			}
			page = null;
		}
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response, Object handler) throws Exception {
		return super.preHandle(request, response, handler);
	}
	
}
