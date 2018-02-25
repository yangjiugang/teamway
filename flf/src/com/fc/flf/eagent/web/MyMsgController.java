package com.fc.flf.eagent.web;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fc.flf.account.web.LoginController;
import com.fc.flf.common.domain.CustomerMention;
import com.fc.flf.common.domain.FcSysMsg;
import com.fc.flf.common.domain.HouseDiscuss;
import com.fc.flf.common.domain.HousePrice;
import com.fc.flf.common.domain.UserInfo;
import com.fc.flf.common.domain.UserMsg;
import com.fc.flf.common.domain.UserRecommendShare;
import com.fc.flf.common.util.Page;
import com.fc.flf.common.util.SessionInfo;
import com.fc.flf.eagent.service.ICustomerMetionService;
import com.fc.flf.eagent.service.IFcSysMsgService;
import com.fc.flf.eagent.service.IUserMsgService;
import com.fc.flf.fparty.service.IUserRecommendShareService;
import com.fc.flf.portal.service.IHouseDiscussService;
import com.fc.flf.portal.service.IHousePriceService;
import com.fc.flf.portal.service.IUserInfoService;

@Controller
public class MyMsgController {
	private static Log logger = LogFactory.getLog(LoginController.class);
	@Resource
	private ICustomerMetionService customerMetionService;
	
	@Resource
	private IHouseDiscussService houseDiscussService;
	
	@Resource
	private IUserMsgService userMsgService;
	
	@Resource
	private IFcSysMsgService fcSysMsgService;
	
	@Resource
	private IUserInfoService userInfoService;
	
	@Resource
	private IUserRecommendShareService userRecommendShareService;
	
	@Resource
	private IHousePriceService housePriceService;
 	
	@RequestMapping(value = "/eagent_message")
    public String xiaoXi(HttpServletRequest request,Model model) throws Exception {
		int userId=0;
		try {
			userId=SessionInfo.getVisitorId(request);
		} catch (Exception e) {
			if(logger.isErrorEnabled()){
				logger.error(e);			
				}
			throw new Exception("没找到用户"+e.getMessage(),e);
		}
		Object tabTag=request.getParameter("tab");
		UserInfo userInfo=userInfoService.getUserInfoById(userId);
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("tabTag",tabTag);
		
		Page cusMetionPage= new Page();
		cusMetionPage.setPageSize(8);
		cusMetionPage.setRowCount(userMsgService.findMsgMetionComplaintCount(userId));
		List<UserMsg> cusMetions = userMsgService.findMsgMetionComplaint(userId, cusMetionPage.getLimit());
		model.addAttribute("cusMetions", cusMetions);
		model.addAttribute("cusMetionPage", cusMetionPage);
		
		Page houseDisPage=new Page();
		houseDisPage.setPageSize(8);
		houseDisPage.setRowCount(houseDiscussService.findCountHouseDisByUserId(userId));
		List<HouseDiscuss> houseDiss = houseDiscussService.findDiscussByUserId(userId,houseDisPage.getLimit());
		model.addAttribute("houseDisPage", houseDisPage);
		model.addAttribute("houseDiss", houseDiss);
		
		Page userRecomPage=new Page();
		userRecomPage.setPageSize(8);
		userRecomPage.setRowCount(userRecommendShareService.findCountRecommendByUserId(userId));
		List<UserRecommendShare> userRecoms=userRecommendShareService.findRecommendByUserId(userId, userRecomPage.getLimit());
		model.addAttribute("userRecomPage", userRecomPage);
		model.addAttribute("userRecoms", userRecoms);
		
		Page userMsgPage=new Page();
		userMsgPage.setPageSize(8);
		userMsgPage.setRowCount(userMsgService.findMsgCountByMsgTypeAndSenderType(userId, 1,0));
		List<UserMsg> userMsgs=userMsgService.findMsgByMsgTypeAndSenderType(userId,1,0, userMsgPage.getLimit());
		model.addAttribute("userMsgPage", userMsgPage);
		model.addAttribute("userMsgs", userMsgs);
		
		Page sysMsgPage=new Page();
		sysMsgPage.setPageSize(8);
		sysMsgPage.setRowCount(fcSysMsgService.findMsgCountByMsgType(0));
		List<FcSysMsg> sysMsgs=fcSysMsgService.findMsgByMsgType(0, sysMsgPage.getLimit());
		model.addAttribute("sysMsgPage", sysMsgPage);
		model.addAttribute("sysMsgs", sysMsgs);
		
		Page housePricePage=new Page();
		housePricePage.setPageSize(8);
		housePricePage.setRowCount(housePriceService.findCusPriceCountByUserId(userId));
		List<HousePrice> cusHousePrices=housePriceService.findCusPriceByUserId(userId,housePricePage.getLimit());
		model.addAttribute("housePricePage", housePricePage);
		model.addAttribute("cusHousePrices", cusHousePrices);
		
		Page frihousePricePage=new Page();
		frihousePricePage.setPageSize(8);
		frihousePricePage.setRowCount(housePriceService.findFriPriceCountByUserId(userId));
		List<HousePrice> friHousePrices=housePriceService.findFriPriceByUserId(userId,housePricePage.getLimit());
		model.addAttribute("frihousePricePage", frihousePricePage);
		model.addAttribute("friHousePrices", friHousePrices);
		
        return "/eagent/index-xiaoxi";
    }
	
	@RequestMapping(value = "/cusMetionForPage")
	@ModelAttribute("datas")
	public List<UserMsg> cusMetionForPage(Page page,int userId){
		page.setRowCount(userMsgService.findMsgMetionComplaintCount(userId));
		List<UserMsg> cusMetions = userMsgService.findMsgMetionComplaint(userId, page.getLimit());
		return cusMetions;
	}
	@RequestMapping(value="/findMetionByID")
	@ResponseBody
	public CustomerMention findMentionById(int mentionId){
		return customerMetionService.findCustomerMetionById(mentionId);
	}
	
	@RequestMapping(value="/fXiaoxiDel")
	@ResponseBody
	public Page delcusMetionById(Page page,int mentionId,int userId){
		customerMetionService.delCusMetionByMetionId(mentionId);
		page.setRowCount(customerMetionService.findCustomerMentionCountByUserId(userId));
		return page;
	}
	
	@RequestMapping(value="/fHouseDisDel")
	@ResponseBody
	public Page delHouseDisById(Page page,int discussId,int userId){
		houseDiscussService.delHouseDisByDisId(discussId);
		page.setRowCount(houseDiscussService.findCountHouseDisByUserId(userId));
		return page;
	}
	
	@RequestMapping(value = "/HouseDisForPage")
	@ModelAttribute("datas")
	public List<HouseDiscuss> HouseDisForPage(Page page,int userId){
		page.setRowCount(houseDiscussService.findCountHouseDisByUserId(userId));
		List<HouseDiscuss> houseDiss = houseDiscussService.findDiscussByUserId(userId, page.getLimit());
		return houseDiss;
	}
	
	@RequestMapping(value="/findhouseDisByID")
	@ResponseBody
	public HouseDiscuss findHouseDisById(int discussId){
		HouseDiscuss houseDis = houseDiscussService.findDiscussById(discussId);
		return houseDis;
	}
	
	@RequestMapping(value="/userRecomForPage")
	@ModelAttribute("datas")
	public List<UserRecommendShare> userRecomForPage(Page page,int userId){
		page.setRowCount(userRecommendShareService.findCountRecommendByUserId(userId));
		List<UserRecommendShare> userRecoms = userRecommendShareService.findRecommendByUserId(userId, page.getLimit());
		return userRecoms;
	}
	
	@RequestMapping(value="/findRecommendByID")
	@ResponseBody
	public UserRecommendShare findRecommendByID(int recommendId){
		UserRecommendShare recom=userRecommendShareService.findRecommendById(recommendId);
		return recom;
	}
	
	@RequestMapping(value="/fUserRecomDel")
	@ResponseBody
	public Page delUserRecomById(Page page,int recommendId,int userId){
		userRecommendShareService.delRecommendShareById(recommendId);
		page.setRowCount(userRecommendShareService.findCountRecommendByUserId(userId));
		return page;
	}
	
	@RequestMapping(value="/userMsgForPage")
	@ModelAttribute("datas")
	public List<UserMsg> userMsgForPage(Page page,int userId){
		page.setRowCount(userMsgService.findMsgCountByMsgType(userId, 1));
		List<UserMsg> userMsgs = userMsgService.findMsgByMsgType(userId, 1, page.getLimit());
		return userMsgs;
	}
	
	@RequestMapping(value="/sysMsgForPage")
	@ModelAttribute("datas")
	public List<UserMsg> sysMsgForPage(Page page,int userId){
		page.setRowCount(userMsgService.findMsgCountByMsgType(userId, 2));
		List<UserMsg> userMsgs = userMsgService.findMsgByMsgType(userId, 2, page.getLimit());
		return userMsgs;
	}
	
	@RequestMapping(value="/findUserMsgByID")
	@ResponseBody
	public UserMsg findUserMsgByID(int userMsgId){
		userMsgService.updateUserMsgReadById(userMsgId,1);
		UserMsg uMsg=userMsgService.findUserMsgByID(userMsgId);
		return uMsg;
	}
	
	@RequestMapping(value="/fUserMsgDel")
	@ResponseBody
	public Page delUserMsgById(Page page,int id,int userId,int MsgType){
		userMsgService.delMsg(id);
		page.setRowCount(userMsgService.findMsgCountByMsgType(userId, MsgType));
		return page;
	}
	
	@RequestMapping(value="/findSysMsgByID")
	@ResponseBody
	public FcSysMsg findSysMsgByID(int sysMsgId){
		FcSysMsg FSMsg=fcSysMsgService.findSysMsgById(sysMsgId);
		return FSMsg;
	}
	
	@RequestMapping(value="/cusHousePriceForPage")
	@ModelAttribute("datas")
	public List<HousePrice> cusHousePriceForPage(Page page,int userId){
		page.setRowCount(housePriceService.findCusPriceCountByUserId(userId));
		List<HousePrice> cusPrices = housePriceService.findCusPriceByUserId(userId, page.getLimit());
		return cusPrices;
	}
	
	@RequestMapping(value="/findCusHPriceByID")
	@ResponseBody
	public HousePrice findCusHPriceByID(int cusHousePriceId){
		HousePrice cusHousePrice=housePriceService.findHousePriceByPriceId(cusHousePriceId);
		return cusHousePrice;
	}
	
	@RequestMapping(value="/friHousePriceForPage")
	@ModelAttribute("datas")
	public List<HousePrice> friHousePriceForPage(Page page,int userId){
		page.setRowCount(housePriceService.findFriPriceCountByUserId(userId));
		List<HousePrice> cusPrices = housePriceService.findFriPriceByUserId(userId, page.getLimit());
		return cusPrices;
	}
	
	@RequestMapping(value="/esendMsg")
	@ResponseBody
	public String sendMsg(UserMsg userMsg){
		System.out.println();
		if(userMsg.getMsgContent().trim()!=null && userMsg.getMsgContent().trim()!=""){
			userMsg.setMsgType(1);
			userMsg.setReceiveUserType(1);
			userMsg.setSendTime(new Date(System.currentTimeMillis()));
			userMsg.setSendUserType(0);
			userMsgService.addUserMsg(userMsg);
			return "success";
		}else{
			return "fail";
		}
	}
}
