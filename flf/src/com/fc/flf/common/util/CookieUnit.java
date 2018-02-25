package com.fc.flf.common.util;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author huangshan
 * 2010-1-09 17:55
 */
public class CookieUnit {

	/** 
     * 添加cookie 
     * @param response 
     * @param name cookie的名称 
     * @param value cookie的值 
     * @param maxAge cookie存放的时间(以秒为单位,假如存放三天,即3*24*60*60; 如果值为0,cookie将随浏览器关闭而清除) 
     */ 
	public static void addCookie(HttpServletResponse response,String name,String value,int maxAge) {
        Cookie cookie = new Cookie(name, value);  
        if (maxAge > 0)
        	cookie.setMaxAge(maxAge);  
        cookie.setPath("/flf");
        response.addCookie(cookie);
    }
	/**
	 * 获取Cookie得值
	 * @param request
	 * @param name
	 * @return
	 */
	public static String getCookieByName(HttpServletRequest request, String name) {  
	    Map<String, Cookie> cookieMap = CookieUnit.readCookieMap(request);  
	       if(cookieMap.containsKey(name)){  
	           Cookie cookie = (Cookie)cookieMap.get(name);  
	           return cookie.getValue();  
	       }else{  
	           return null;  
	       }  
	} 
	/**
	 * 
	 * @param request
	 * @param currentId
	 * @param name
	 * @return
	 * 1.如果当前浏览的id已经在浏览历史里了,我们要把移到最前面 23-2-6-5 
	 * 2.如果浏览历史里已经达到了10个产品了,我们需要把最选进入的元素删除
	 */
	public static String buildViewHistory(HttpServletRequest request, Integer currentId,String name){  
        String cookieValue = CookieUnit.getCookieByName(request, name);  
        LinkedList<Integer> houseIds = new LinkedList<Integer>();  
        if(cookieValue != null && !"".equals(cookieValue.trim())){  
            String[] ids = cookieValue.split("-");            
            for(String id : ids){  
                houseIds.offer(new Integer(id.trim()));  
            }  
            if(houseIds.contains(currentId)) houseIds.remove(currentId);  
            if(houseIds.size()>=10) houseIds.poll();  
        }  
        houseIds.offer(currentId);  
        StringBuffer out = new StringBuffer();  
        for(Integer id : houseIds){  
            out.append(id).append('-');  
        }  
        out.deleteCharAt(out.length()-1);  
        return out.toString();  
    }
	
	protected static Map<String, Cookie> readCookieMap(HttpServletRequest request) {  
		Map<String, Cookie> cookieMap = new HashMap<String, Cookie>();  
		Cookie[] cookies = request.getCookies();  
		if (cookies != null) {  
			for (int i = 0; i < cookies.length; i++) {  
				cookieMap.put(cookies[i].getName(), cookies[i]);  
			}  
		}  
		return cookieMap;  
	 } 
}
