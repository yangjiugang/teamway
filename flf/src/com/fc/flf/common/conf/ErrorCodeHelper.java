package com.fc.flf.common.conf;

import java.util.HashMap;
import java.util.Map;

import org.springframework.ui.Model;

/**
 * 
 * 
 * @author 异常信息获取帮助类
 * 
 * 
 */

public class ErrorCodeHelper {
	
	private final static Map<String, String> errorCodeMap;
	
	static{
		errorCodeMap = new HashMap<String, String>();
		//房乐会-我的首页
		errorCodeMap.put("FLF-0701", "无该用户信息,请重新登录！");
		errorCodeMap.put("FLF-0702", "该账号在其它地方登录,您被迫下线,请重新登录！");
		errorCodeMap.put("FLF-0703", "您输入的邮件地址有误,请重新输入！");
		errorCodeMap.put("FLF-0704", "邮件发送失败！");
		errorCodeMap.put("FLF-0705", "邮件发送失败,未知的邮件协议主机！");
	}
	
	public static String getErrorMsg(String errorCode){
		return errorCodeMap.get(errorCode);
	}
	
	public static void addErrorMsg(Model model, String errorCode){
		model.addAttribute("errorMsg",getErrorMsg(errorCode));
	}
	
	public static void addErrorMsg(String errorField, Model model, String errorCode){
		model.addAttribute(errorField,getErrorMsg(errorCode));
	}
}
