package com.fc.flf.eagent.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fc.flf.common.domain.EventInfo;
import com.fc.flf.common.domain.HouseGroupCustomer;
import com.fc.flf.common.domain.HouseGroupInfo;
import com.fc.flf.common.domain.HouseInfo;
import com.fc.flf.common.util.DateTools;
import com.fc.flf.common.util.OrderSerialNumber;
import com.fc.flf.common.util.Page;
import com.fc.flf.common.util.SessionInfo;
import com.fc.flf.eagent.service.ICustomerFunService;
import com.fc.flf.eagent.service.IUserStudySaleHouseService;
import com.fc.flf.fparty.service.IEventInfoService;
import com.fc.flf.fparty.service.IVisitorHouseGroupService;
import com.fc.flf.portal.service.IHouseInfoService;
import com.fc.flf.portal.service.ILineSetMealService;

/**
 * 客户报名控制器
 * 
 * @author Administrator
 * 
 */
@Controller
public class CustomerApplyController {

	@Autowired
	private ICustomerFunService customerFunService;

	@Autowired
	private ILineSetMealService lineSetMealService;

	@Resource
	private IVisitorHouseGroupService houseGroupService;

	@Resource
	private IEventInfoService eventInfoService;
	
	@Autowired
	private IHouseInfoService houseInfoService;
	
	@Resource
	private IUserStudySaleHouseService userStudySaleHouse;

	/**
	 * 客户报名列表
	 * 
	 * @param startDate
	 * @param endDate
	 * @param keyWord
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/queryCustomerApply")
	public ModelAndView queryList(HttpServletRequest request,Page page, Model model)throws Exception {
		// 获取访问者ID
		int userId = SessionInfo.getVisitorId(request);
		// 查询总记录数
		int iCount = eventInfoService.queryAllOrderCount(userId);
		page.setRowCount(iCount);
		// 放入查询条件
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("limitValue", page.getLimit());
		List<EventInfo> lstEventInfo = eventInfoService.queryAllOrderList(map);
		model.addAttribute("lstEventInfo", lstEventInfo);
		model.addAttribute("iCount", iCount);
		return new ModelAndView("/eagent/CustomerApply");
	}

	/**
	 * 获得客户列表
	 * 
	 * @param cusTomerName
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getCusTomerList")
	public String getCusTomerList(String cusTomerName,
			HttpServletRequest request, Model model, Page page)
			throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", SessionInfo.getVisitorId(request));
		map.put("cusTomerName", cusTomerName);
		model.addAttribute("lstCustomerInfoDetail",
				customerFunService.getCusTomerList(map, page));
		return "/eagent/CustomerResultPage";
	}

	/**
	 * 获得楼盘信息
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getHouseInfoList")
	public String getHouseInfoList(Model model, Page page, String objName,
			HttpServletRequest request)throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		page.setPageSize(6);
		map.put("userId", SessionInfo.getVisitorId(request));
		if (objName != null || "".equals(objName)) {
			map.put("houseName", new String(objName.getBytes("iso8859-1"),"utf-8"));
		}
		int iCount = userStudySaleHouse.getSaleHousesCount(map);
		page.setRowCount(iCount);
		map.put("limit", page.getLimit());
		List<HouseInfo> lstHouseInfo = userStudySaleHouse.getSaleHousesList(map);
		model.addAttribute("lstHouseInfo", lstHouseInfo);
		return "/eagent/HouseResultPage";
	}
	
	/**
	 * 获得看房楼盘
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getSeeHouseInfoList")
	public String getSeeHouseInfoList(Model model, Page page, String objName)
			throws Exception {
		HouseInfo houseInfo = new HouseInfo();
		page.setPageSize(6);
		if (objName != null || "".equals(objName)) {
			houseInfo.setHouseName(new String(objName.getBytes("iso8859-1"),
					"utf-8"));
		}
		List<HouseInfo> lstSeeHouseInfo = houseInfoService.getSeeHouseAccurate(
				houseInfo, page);
		model.addAttribute("lstSeeHouseInfo", lstSeeHouseInfo);
		return "/eagent/SeeHouseResultPage";
	}

	/**
	 * 获得旅游路线
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getTourismLine")
	public String getTourismLine(Model model, Page page, String lineName)
			throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		page.setPageSize(4);
		page.setRowCount(lineSetMealService.getTotalCount());
		map.put("limitStr", page.getLimit());
		map.put("lineName", lineName);
		List<HouseGroupInfo> houseGroupInfo = lineSetMealService
				.getAllHouseGroupInfoCus(map);
		model.addAttribute("houseGroupInfo", houseGroupInfo);
		return "/eagent/TourismLinePage";
	}

	/**
	 * 获得会所活动
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/queryEventInfoList")
	public String queryEventInfoList(Model model, Page page, String eventName)
			throws Exception {
		List<EventInfo> lstEventInfo = eventInfoService
				.queryEventInfoList(eventName, page);
		model.addAttribute("lstEventInfo", lstEventInfo);
		return "/eagent/EventInfoPage";
	}

	/**
	 * 新增订单
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/insertOrder")
	public String insertOrder(HouseGroupCustomer houseGroupCustomer,
			Model model, HttpServletRequest request) throws Exception {
		// 新增购房订单
		if("1".equals(houseGroupCustomer.getOrderType())){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("orderNum", OrderSerialNumber.getSerialNumber());
			map.put("houseId", houseGroupCustomer.getHouseId());
			map.put("houseName", houseGroupCustomer.getOrderObj());
			map.put("cusId", houseGroupCustomer.getCusId());
			map.put("customerId", houseGroupCustomer.getCustomerId());
			map.put("customerName", houseGroupCustomer.getCustomerName());
			map.put("userId", SessionInfo.getVisitorId(request));
			map.put("userName", SessionInfo.getVisitorName(request));
			map.put("orderName", houseGroupCustomer.getOrderObj());
			map.put("orderDate", houseGroupCustomer.getJoinTime());
			map.put("execOrderDate", houseGroupCustomer.getJoinTime());
			map.put("orderStatus", 0);
			map.put("orderMoney", houseGroupCustomer.getPayAmount());
			map.put("payStatus", 0);
			map.put("payType", 0);
			map.put("payDate", "");
			map.put("orderDesc", "");
			//
			map.put("saleControlId", 0);
			houseGroupService.insertBuyHouseOrder(map);
		}
		// 新增看房订单
		if("2".equals(houseGroupCustomer.getOrderType())){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("eventId", houseGroupCustomer.getEventId());
			map.put("cusId", houseGroupCustomer.getCusId());
			map.put("customerId", houseGroupCustomer.getCustomerId());
			map.put("customerName", houseGroupCustomer.getCustomerName());
			// 客户类型
			map.put("visitorType", 2);
			// 是否到场
			map.put("isCheckin", 1);
			// 是否参加
			map.put("isRegister", 1);
			map.put("valuation", "");
			map.put("valuation1", "");
			map.put("valuation2", "");
			map.put("valuation3", "");
			map.put("valuation4", "");
			map.put("createAt", DateTools.getCurrDateTime());
			houseGroupService.insertSeeHouseOrder(map);
		}
		// 新增旅游购房订单
		if("3".equals(houseGroupCustomer.getOrderType())){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("cusId", houseGroupCustomer.getCusId());
			map.put("customerId", houseGroupCustomer.getCustomerId());
			map.put("customerName", houseGroupCustomer.getCustomerName());
			map.put("customerPhone", houseGroupCustomer.getCustomerPhone());
			map.put("joinTime", houseGroupCustomer.getJoinTime());
			map.put("houseGroupId", houseGroupCustomer.getHouseGroupId());
			map.put("togetherCustomers", houseGroupCustomer.getTogetherCustomers());
			try {
				map.put("userId", SessionInfo.getVisitorId(request));
			} catch (Exception e) {
				e.printStackTrace();
			}
			houseGroupService.insertHouseGroupCusTomer(map);
		}
		// 新增会所活动订单
		if("4".equals(houseGroupCustomer.getOrderType())){
			eventInfoService.insertActivityOrder(houseGroupCustomer);
		}
		model.addAttribute("customerName", houseGroupCustomer.getCustomerName());
		model.addAttribute("orderType", houseGroupCustomer.getOrderType());
		model.addAttribute("joinTime", houseGroupCustomer.getJoinTime());
		model.addAttribute("orderObj", houseGroupCustomer.getOrderObj());
		model.addAttribute("payAmount", houseGroupCustomer.getPayAmount());
		return "/eagent/CustomerApply";
	}

	/**
	 * 取消订单
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/canceledOrder")
	public String deleteOrder(int orderId, int orderType, Page page)
			throws Exception {
		if(orderType == 1){
			eventInfoService.deleteSeeHouseOrder(orderId);
		}else if(orderType == 2){
			eventInfoService.deleteSeeHouseOrder(orderId);
		}else if(orderType == 3){
			houseGroupService.deleteHouseGroupOrder(orderId);
		}else if(orderType == 4){
			userStudySaleHouse.deleteBuyHouseOrder(orderId);
		}
		return "forward:queryCustomerApply";
	}
}
