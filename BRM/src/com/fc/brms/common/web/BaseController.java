package com.fc.brms.common.web;

import org.springframework.ui.Model;

import com.fc.brms.common.conf.ErrorCodeHelper;

/**
 * 基础controller
 * 
 * @author eddy song
 *
 */
public class BaseController {

	/**
	 * 
	 * @param errorField model中存放error信息的域
	 * @param model
	 * @param errorCode
	 */
	public void addErrorMsg(String errorField, Model model, String errorCode){
		ErrorCodeHelper.addErrorMsg(errorField, model, errorCode);
	}
	
	/**
	 *  提供了默认的errorField 名称为errorMsg
	 *  
	 * @param model 
	 * @param errorCode
	 */
	public void addErrorMsg(Model model, String errorCode){
		ErrorCodeHelper.addErrorMsg(model, errorCode);
	}
	
	public String getErrorMsg(String errorCode){
		return ErrorCodeHelper.getErrorMsg(errorCode);
	}
	
	
}
