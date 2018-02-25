package com.fc.flf.eagent.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fc.flf.common.domain.CustomerInfoDetail;
import com.fc.flf.common.domain.HouseInfo;
import com.fc.flf.common.util.CommonUtil;
import com.fc.flf.common.util.Page;
import com.fc.flf.common.util.SessionInfo;
import com.fc.flf.eagent.service.ICustomerDefualtService;
import com.fc.flf.eagent.service.ICustomerFunService;
import com.fc.flf.portal.service.IUserInfoService;

@Controller
public class EAgentController {
 
	@Resource
	private ICustomerFunService customerFunService;
	@Resource
	private ICustomerDefualtService customerDefualtService;
	@Resource
	private IUserInfoService userInfoService;
	@Resource
	private ViewDetailMsgForCountData viewDetailMsgForCountData;
	
	@RequestMapping(value = "/toelogin")
    public String index() {
        return "/eagent/ELogin";
    }	
	
	@RequestMapping("/eagent_EIndex")
	public String index(HttpServletRequest request,Model model,Page page) throws Exception{
		int userid=SessionInfo.getVisitorId(CommonUtil.getRequest());  //得到经纪人的ID号
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("userId", SessionInfo.getVisitorId(CommonUtil.getRequest()));
		model.addAttribute("customerList",CommonUtil.toJson(customerFunService.getCusTomerList(map,page)));
		model.addAttribute("customerPageCount",page.getPageCount());
		model.addAttribute("buyHouseOrders",customerDefualtService.findBuyHouseOrder());
		model.addAttribute("recentVisitUsers",userInfoService.findRecentVisitUser());
		model.addAttribute("visitorCustomers",customerDefualtService.findVisitorSkimUser());
		model.addAttribute("noContacts",customerDefualtService.findCustomerByNoContact());
		model.addAttribute("recommendHouses",CommonUtil.toJson(customerDefualtService.findRecommendHouse(page)));
		model.addAttribute("userid", userid);//在页面上${VISITOR_ID}可以获取userId
		viewDetailMsgForCountData.addDataToModel(model, request);
		return "/eagent/EIndex";
	}
	
	@ResponseBody
	@RequestMapping(value = "/eagent_customerInfoDetailPage")
	public List<CustomerInfoDetail> customerInfoDetailPage(Page page) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("userId", SessionInfo.getVisitorId(CommonUtil.getRequest()));
		return customerFunService.getCusTomerList(map,page);
	}
	
	@ResponseBody
	@RequestMapping(value = "/eagent_recommendHousePage")
	public List<HouseInfo> recommendHousePage(Page page) throws Exception{
		return customerDefualtService.findRecommendHouse(page);
	}

}