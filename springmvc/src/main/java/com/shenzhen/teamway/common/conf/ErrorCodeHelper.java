package com.shenzhen.teamway.common.conf;

import java.util.HashMap;
import java.util.Map;

import org.springframework.ui.Model;

import com.shenzhen.teamway.common.util.CommonUtil;

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
		errorCodeMap.put("BRM-0701", "登录过期，请重新登录！");
		errorCodeMap.put("BRM-0702", "用户不存在！");
		errorCodeMap.put("BRM-0703", "错误的邮件地址！");
		errorCodeMap.put("BRM-0704", "邮件发送失败,未知的邮件协议主机！");
	}
	
	public static String getErrorMsg(String errorCode){
		return errorCodeMap.get(errorCode);
	}
	
	public static void addErrorMsg(Model model, String errorCode){
		model.addAttribute("errorMsg",CommonUtil.toJson(getErrorMsg(errorCode)));
	}
	
	public static void addErrorMsg(String errorField, Model model, String errorCode){
		model.addAttribute(errorField,CommonUtil.toJson(getErrorMsg(errorCode)));
	}
	
}
