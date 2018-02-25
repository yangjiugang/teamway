package com.fc.flf.common.exception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

import com.fc.flf.common.util.CommonUtil;

public class FLFMappingExceptionResolver extends SimpleMappingExceptionResolver {
	
	@Override
	public ModelAndView doResolveException(HttpServletRequest request, HttpServletResponse response,
			Object handler, Exception ex) {
		
		if(request.getHeader("x-requested-with") != null) { // ajax请求
			if(ex instanceof FLFBizException){
				ExceptionMsg em = new ExceptionMsg();
				em.setAjaxExceptionMsg(ex.getMessage());
				CommonUtil.output(CommonUtil.toJson(em), response);
			}
			return new ModelAndView();
		} else {
			return super.doResolveException(request, response, handler, ex);
		}
	}
	
	
	
}
