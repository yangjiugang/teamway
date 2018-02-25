package com.fc.flf.eagent.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fc.flf.common.domain.EventBuyHouseOrder;
import com.fc.flf.common.domain.EventInfo;
import com.fc.flf.common.domain.HouseGroupInfo;
import com.fc.flf.common.util.CommonUtil;
import com.fc.flf.common.util.Page;
import com.fc.flf.eagent.service.ICustomerOrderService;

@Controller
public class CustomerOrderController {

	@Autowired
	private ICustomerOrderService customerOrderService;
	
	@RequestMapping(value = "/eagent_order_index")
	public String orderHome(){
		return "/eagent/jiaoyiY4";
	}
	
	@RequestMapping(value = "/eagent_order_myBuyHouseOrder")
	public String myBuyHouseOrder(Model model,Page page,String index) throws Exception{
		model.addAttribute("index",index);
		model.addAttribute("houseOrders", CommonUtil.toJson(customerOrderService.findOrderByUserId(page)));//我的购房订单
		model.addAttribute("myBuyHouseCount", customerOrderService.getMyBuyHouseCount());
		model.addAttribute("myBuyHousePageCount",page.getPageCount()); 
		model.addAttribute("viewHouseOrders", CommonUtil.toJson(customerOrderService.findViewHouseOrder(page,1)));//我的看房订单
		model.addAttribute("viewHouseOrderCount",customerOrderService.findViewHouseOrderCount(1));
		model.addAttribute("viewHouseOrderPageCount",page.getPageCount()); 
		model.addAttribute("myGroupHouses",CommonUtil.toJson(customerOrderService.findHouseGroupByUserId(page)));//我的参团订单
		model.addAttribute("myGroupHouseCount",customerOrderService.findHouseGroupCount());
		model.addAttribute("myGroupHousePageCount",page.getPageCount());
		model.addAttribute("myActivityHouse",CommonUtil.toJson(customerOrderService.findViewHouseOrder(page, 2)));//我参加活动订单
		model.addAttribute("myActivityHouseCount",customerOrderService.findViewHouseOrderCount(2));
		model.addAttribute("myActivityHousePageCount",page.getPageCount());
		return "/eagent/dingdanY4";
	}
	
	@ResponseBody
	@RequestMapping(value = "/eagent_order_myBuyHousePage")
	public List<EventBuyHouseOrder> myBuyHousePage(Page page) throws Exception{
		return customerOrderService.findOrderByUserId(page);
	}
	
	@ResponseBody
	@RequestMapping(value = "/eagent_order_myViewHousePage")
	public List<EventInfo> myViewHousePage(Page page) throws Exception{
		return customerOrderService.findViewHouseOrder(page,1);
	}
	
	@ResponseBody
	@RequestMapping(value = "/eagent_order_myGroupHousePage")
	public List<HouseGroupInfo> myGroupHousePage(Page page) throws Exception{
		return customerOrderService.findHouseGroupByUserId(page);
	}
	
	@ResponseBody
	@RequestMapping(value = "/eagent_order_myActivityPage")
	public List<EventInfo> myActivityPage(Page page) throws Exception{
		return customerOrderService.findViewHouseOrder(page,2);
	}
}
