package com.fc.flf.fparty.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fc.flf.account.web.LoginController;
import com.fc.flf.common.domain.CustomerInfo;
import com.fc.flf.common.util.SessionInfo;
import com.fc.flf.fparty.service.ICustomerInfoService;

@Controller
public class MyProfileContoller {
	
	private static Log logger = LogFactory.getLog(LoginController.class);
	
	@Resource
	private UserInfoAndMsgCountForData userInfoAndMsgCountForData;
	
	@Resource
	private ICustomerInfoService customerInfoService;
	
	@RequestMapping(value = "/MyProfile")
	public String toMyProfile(HttpServletRequest request, Model model)throws Exception{
		int customerId=0;
		try {
			customerId=SessionInfo.getVisitorId(request);
		} catch (Exception e) {
			if(logger.isErrorEnabled()){
				logger.error(e);			
				}
			throw new Exception("没找到用户"+e.getMessage(),e);
		}
		CustomerInfo customerInfo = customerInfoService.findCustomerInfo(customerId);
		userInfoAndMsgCountForData.addDataToModel(model, request);
		model.addAttribute("customerInfo", customerInfo);
		return "/fparty/MyProfile"; 
	}
}
