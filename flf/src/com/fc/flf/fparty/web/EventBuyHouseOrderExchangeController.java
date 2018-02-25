package com.fc.flf.fparty.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fc.flf.common.domain.EventBuyHouseOrder;
import com.fc.flf.common.domain.EventBuyHouseOrderExchange;
import com.fc.flf.common.domain.EventInfo;
import com.fc.flf.common.util.Page;
import com.fc.flf.common.util.SessionInfo;
import com.fc.flf.fparty.service.IEventBuyHouseOrderExchangeService;
import com.fc.flf.fparty.service.IEventInfoService;
import com.fc.flf.fparty.service.IVisitorHouseGroupService;

@Controller
public class EventBuyHouseOrderExchangeController {

	@Autowired
	private IEventBuyHouseOrderExchangeService buyHouseOrderService;

	@Autowired
	private IEventInfoService eventInfoService;
	
	@Resource
	private IVisitorHouseGroupService houseGroupService;
	
	@Resource
	private FPublicNoticeForData fPublicNoticeForData;
	
	@Resource
	private UserInfoAndMsgCountForData userInfoAndMsgCountForData;

	@RequestMapping(value = "/jiaoyi")
	public String list(Model model) {
		List<EventBuyHouseOrderExchange> list = buyHouseOrderService
				.eventBuyHouseOrderExchange();
		model.addAttribute("trade", list);
		return "/fparty/jiaoyi";
	}

	@RequestMapping(value = "/jiaoyiGroup")
	public ModelAndView eventBuyHouse(Page page, EventBuyHouseOrder eventBuy,HttpServletRequest request,Model model)
			throws Exception{
		ModelAndView view = new ModelAndView("/fparty/jiaoyi");
		// 访问者ID
		int cusId = SessionInfo.getVisitorId(request);
		// 查询买房订单总数
		int iBuyHousecount = buyHouseOrderService.getEventBuyHouse(eventBuy);
		// 查询看房订单总数
		int iSeeHouseCount = eventInfoService.querySeeHouseOrderCount(cusId);
		// 查询活动订单总数
		int iActivityCount = eventInfoService.queryActivityOrderCount(cusId);
		// 查询购房团订单总数
		int iJoinHouseCount = houseGroupService.queryJoinHouseGroupCount(cusId,null);
		page.setRowCount(iBuyHousecount);
		List<EventBuyHouseOrderExchange> list = buyHouseOrderService.eventBuyHouse(page, eventBuy);
		view.addObject("trade", list);
		view.addObject("iBuyHousecount", iBuyHousecount);
		view.addObject("iSeeHouseCount", iSeeHouseCount);
		view.addObject("iActivityCount", iActivityCount);
		view.addObject("iJoinHouseCount", iJoinHouseCount);
		fPublicNoticeForData.addDataToModel(model);
		userInfoAndMsgCountForData.addDataToModel(model, request);
		return view;
	}

	/**
	 * 查询看房订单
	 * 
	 * @param page
	 * @param eventBuy
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/getSeeHouseOrder")
	public String querySeeHouseOrder(Page page, Model model, HttpServletRequest request) 
			throws Exception {
		// 访问者ID
		int cusId = SessionInfo.getVisitorId(request);
		// 访问者看房订单总数
		int iCount = eventInfoService.querySeeHouseOrderCount(cusId);
		//page.setPageSize(1);
		page.setRowCount(iCount);
		List<EventInfo> lstEventInfo = eventInfoService.querySeeHouseOrder(cusId, page);
		model.addAttribute("lstEventInfo", lstEventInfo);
		return "/fparty/HouseOrderPage";
	}
	
	/**
	 * 查询活动订单
	 * 
	 * @param page
	 * @param eventBuy
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/getActivityOrder")
	public String queryActivityOrder(Page page, Model model, HttpServletRequest request) 
			throws Exception {
		// 访问者ID
		int cusId = SessionInfo.getVisitorId(request);
		// 访问者活动订单总数
		int iCount = eventInfoService.queryActivityOrderCount(cusId);
		page.setRowCount(iCount);
		List<EventInfo> lstEventInfo = eventInfoService.queryActivityOrder(cusId, page);
		model.addAttribute("lstEventInfo", lstEventInfo);
		return "/fparty/ActivityOrderPage";
	}

}
