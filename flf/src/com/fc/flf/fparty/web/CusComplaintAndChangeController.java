package com.fc.flf.fparty.web;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fc.flf.account.web.LoginController;
import com.fc.flf.common.domain.UserMsg;
import com.fc.flf.common.util.SessionInfo;
import com.fc.flf.eagent.service.ICustomerFunService;
import com.fc.flf.eagent.service.IUserMsgService;

@Controller
public class CusComplaintAndChangeController {
	private static Log logger = LogFactory.getLog(LoginController.class);
	@Resource
	private IUserMsgService userMsgService;
	
	@Resource
	private ICustomerFunService customerFunService;
	
	@RequestMapping(value="/cusComplaint")
	@ResponseBody
	public String cusComplaint(HttpServletRequest request,UserMsg userMsg) throws Exception{
		int customerId=0;
		try {
			customerId=SessionInfo.getVisitorId(request);
		} catch (Exception e) {
			if(logger.isErrorEnabled()){
				logger.error(e);			
				}
			throw new Exception("没找到用户"+e.getMessage(),e);
		}
		if(userMsg!=null){
			userMsg.setSendTime(new Date(System.currentTimeMillis()));
			userMsg.setSendUserId(customerId);
			userMsgService.addUserMsg(userMsg);
			return "SUCCESS";
		}
		return "FAIL";
	}
	
	@RequestMapping(value="/cusChangeUser")
	@ResponseBody
	public String cusChangeUser(HttpServletRequest request,UserMsg userMsg) throws Exception{
		int customerId=0;
		try {
			customerId=SessionInfo.getVisitorId(request);
		} catch (Exception e) {
			if(logger.isErrorEnabled()){
				logger.error(e);			
				}
			throw new Exception("没找到用户"+e.getMessage(),e);
		}
		if(userMsg!=null){
			userMsg.setSendTime(new Date(System.currentTimeMillis()));
			userMsg.setSendUserId(customerId);
			userMsgService.addUserMsg(userMsg);
			customerFunService.updateCusInfoDetailIsExchange(3, customerId, userMsg.getReceiveUserId());
			return "SUCCESS";
		}
		return "FAIL";
	}

}
