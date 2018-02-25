package com.fc.flf.common.conf;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.fc.flf.common.util.Constants;
import com.fc.flf.common.util.Page;
import com.fc.flf.common.util.SessionInfo;

public class FLFHandlerInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		// 为了记录易介宝的模块名
		String uri = request.getRequestURI().toLowerCase();
		if(!uri.endsWith(".jsp") && !uri.endsWith(".css") && !uri.endsWith(".js") 
				&& !uri.endsWith(".jpg") && !uri.endsWith(".png") && !uri.endsWith(".gif") && uri.contains("/eagent_")) {
			for(Constants.EAGENT_MODULES module : Constants.EAGENT_MODULES.values()) {
				String name = module.name;
				String[] uriNames = uri.split("_");
				if(uriNames.length >= 2 && uriNames[1].equals(name)) {
					SessionInfo.setSessionAttribute(request, Constants.EAGENT_MODULE_SESSION, name);
					break;
				} else if(SessionInfo.getEagentModule(request) != null) {
					SessionInfo.removeSessionAttribute(request, Constants.EAGENT_MODULE_SESSION);
				}
			}
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		String name = handler.getClass().getName();
		if(name.endsWith("Controller") && modelAndView != null) {
			Page page = (Page)modelAndView.getModel().get("page");
			if(page != null) {
				modelAndView.addObject("curPage", page.getCurPage());
				modelAndView.addObject("pageCount", page.getPageCount());
				modelAndView.addObject("rowCount", page.getRowCount());
				modelAndView.addObject("sort", page.getSort());
				modelAndView.addObject("order", page.isOrder());
				modelAndView.getModel().remove("page");
			}
		}
	}
}
