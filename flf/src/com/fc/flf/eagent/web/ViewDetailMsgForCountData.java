package com.fc.flf.eagent.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.fc.flf.account.web.LoginController;
import com.fc.flf.common.util.SessionInfo;
import com.fc.flf.eagent.service.IFcSysMsgService;
import com.fc.flf.eagent.service.IUserMsgService;
import com.fc.flf.fparty.service.IUserRecommendShareService;
import com.fc.flf.portal.service.IHouseDiscussService;

@Service
public class ViewDetailMsgForCountData {
	private static Log logger = LogFactory.getLog(LoginController.class);	
	
	@Resource
	private IUserMsgService userMsgService;
	
	@Resource
	private IHouseDiscussService houseDiscussService;
	
	
	@Resource
	private IFcSysMsgService fcSysMsgService;
	
	@Resource
	private IUserRecommendShareService userRecommendShareService;
	
	
	public void addDataToModel(Model model,HttpServletRequest request)throws Exception {
		int userId=0;
		try {
			userId = SessionInfo.getVisitorId(request);
		} catch (Exception e) {
			if(logger.isErrorEnabled()){
				logger.error(e);			
				}
			throw new Exception("没找到用户"+e.getMessage(),e);

		}
		int cusMetionCount=userMsgService.findMsgMetionComplaintCount(userId);
		int houseDisCount=houseDiscussService.findCountHouseDisByUserId(userId);
		int userRecomCount=userRecommendShareService.findCountRecommendByUserId(userId);
		int userMsgCount=userMsgService.findMsgCountByMsgType(userId, 1);
		int sysMsgCount=fcSysMsgService.findMsgCountByMsgType(0);
		model.addAttribute("cusMetionCount", cusMetionCount);
		model.addAttribute("houseDisCount", houseDisCount);
		model.addAttribute("userRecomCount", userRecomCount);
		model.addAttribute("userMsgCount", userMsgCount);
		model.addAttribute("sysMsgCount", sysMsgCount);
	}
}
