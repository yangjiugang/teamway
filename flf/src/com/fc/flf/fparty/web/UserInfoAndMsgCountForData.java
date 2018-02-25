package com.fc.flf.fparty.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.fc.flf.account.web.LoginController;
import com.fc.flf.common.domain.UserInfo;
import com.fc.flf.common.util.SessionInfo;
import com.fc.flf.eagent.service.IUserMsgService;
import com.fc.flf.portal.service.IUserInfoService;

@Service
public class UserInfoAndMsgCountForData {
	private static Log logger = LogFactory.getLog(LoginController.class);	
	@Resource
	private IUserInfoService userInfoService;
	
	@Resource
	private IUserMsgService userMsgService;
	
	public void addDataToModel(Model model,HttpServletRequest request)throws Exception {
		int customerId=0;
		try {
			customerId = SessionInfo.getVisitorId(request);
		} catch (Exception e) {
			if(logger.isErrorEnabled()){
				logger.error(e);			
				}
			throw new Exception("没找到用户"+e.getMessage(),e);

		}
		UserInfo userInfo = userInfoService.findUserInfoWithDetail(customerId);
		int countMsg = userMsgService.findMsgCount(customerId);
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("countMsg", countMsg);
	}
}
