package com.teamway.cms.webcontroller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class CommonInterceptor  extends HandlerInterceptorAdapter  {

	 @Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	           
	        if(handler.getClass().isAssignableFrom(HandlerMethod.class)){
	            AuthPassport authPassport = ((HandlerMethod) handler).getMethodAnnotation(AuthPassport.class);
	            
	            if(authPassport == null || authPassport.validate() == false){
	                return true;
	            }else{      
	            	String username = (String)request.getSession().getAttribute("USER_NAME");
	                if(username != null){
	                    return true;
	                }
	                else
	                {
	                	response.sendRedirect("login");
	                    return false;
	                }       
	            }
	        }
	        else
	            return true;   
	        
	     }
}
