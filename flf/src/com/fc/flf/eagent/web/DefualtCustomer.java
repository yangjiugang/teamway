package com.fc.flf.eagent.web;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.fc.flf.common.domain.CustomerEduInfo;
import com.fc.flf.common.domain.CustomerFamilyInfo;
import com.fc.flf.common.domain.CustomerInfoDetail;
import com.fc.flf.common.domain.CustomerInterests;
import com.fc.flf.common.domain.EventBuyHouseOrder;
import com.fc.flf.common.domain.EventInfo;
import com.fc.flf.common.domain.HouseDiscuss;
import com.fc.flf.common.domain.HouseGroupCustomer;
import com.fc.flf.common.domain.UserCustomerRelationship;
import com.fc.flf.common.domain.UserInfoDetail;
import com.fc.flf.common.domain.UserMsg;
import com.fc.flf.common.util.SessionInfo;
import com.fc.flf.eagent.service.ICustomerDefualtService;

@Controller
public class DefualtCustomer {

	@Autowired
	private ICustomerDefualtService defualtService;
	@RequestMapping(value = "IndexBA")
	public String IndexBA(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> map1 = new HashMap<String, Object>();
		Map<String, Object> mapYubei = new HashMap<String, Object>();
		Map<String, Object> mapPutong = new HashMap<String, Object>();
		Map<String, Object> mapHuiyuan = new HashMap<String, Object>();
		map.put("userId",1);
		map1.put("eventType", 2);
		mapYubei.put("userId", 1);
		mapYubei.put("cusType", 1);
		mapPutong.put("userId", 1);
		mapPutong.put("cusType", 2);
		mapHuiyuan.put("userId", 1);
		mapHuiyuan.put("cusType", 3);
		List<UserInfoDetail> list = this.getListCusForUser(request,
				response,map);		
		List<UserInfoDetail> listYubei = this.getListCusForUser(request,
						response,mapYubei);
		List<UserInfoDetail> listPutong = this.getListCusForUser(request,
								response,mapPutong);
		List<UserInfoDetail> listHuiyuan = this.getListCusForUser(request,
				response,mapHuiyuan);	
		int size = list.size();
		System.out.println(list.get(0).getCustomerInfoDetail().getCustomerType()+"this is customerType");
		System.out.println(listYubei.get(0).getCustomerInfoDetail().getCustomerType()+"this is customerType");
		System.out.println(listPutong.get(0).getCustomerInfoDetail().getCustomerType()+"this is customerType");
		int yubeiSize = listYubei.size();
		int putongSize = listPutong.size();
		int huiyuanSize = listHuiyuan.size();
		int vistorID = list.get(0).getCustomerInfoDetail().getCusId();
		map.put("cusId", vistorID);
		map1.put("cusId", vistorID);
		int countPrice = defualtService.queryCountPrice(vistorID);
		int countCollect = defualtService.queryCountCollect(vistorID);
		int countDiscuss = defualtService.queryCountDiscuss(vistorID);
		int countEvent = defualtService.queryCountEvent(map);
		int countLookFang = defualtService.queryCountEvent(map1);
		int countGroup = defualtService.queryCountGroup(vistorID);
		int countOrder = defualtService.queryCountOrder(vistorID);
		int countSkim = defualtService.queryCountSkim(vistorID);
		model.addAttribute("cusList", list);
		model.addAttribute("listYubei", listYubei);
		model.addAttribute("listPutong", listPutong);
		model.addAttribute("listHuiyuan", listHuiyuan);
		model.addAttribute("size", size);
		model.addAttribute("yubeiSize", yubeiSize);
		model.addAttribute("putongSize", putongSize);
		model.addAttribute("huiyuanSize", huiyuanSize);
		model.addAttribute("countPrice", countPrice);
		model.addAttribute("countCollect", countCollect);
		model.addAttribute("countDiscuss", countDiscuss);
		model.addAttribute("countLookFang", countLookFang);
		model.addAttribute("countEvent", countEvent);
		model.addAttribute("countGroup", countGroup);
		model.addAttribute("countOrder", countOrder);
		model.addAttribute("countSkim", countSkim);
		return "/eagent/Index-b-a";
	}
	

	@RequestMapping(value = "IndexKehuXiangqing")
	public String IndexKehuXiangqing(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		int cusId = Integer.parseInt(request.getParameter("nameXiangqing")
				.toString());
		CustomerInfoDetail customerInfoDetail = defualtService.queryCusInCus(cusId);
		CustomerInfoDetail cusList = defualtService.queryCusForCus(cusId);
		List<CustomerFamilyInfo> famList = defualtService
				.queryFamInfoForCus(cusId);
		CustomerInterests cusInList = defualtService.queryIntereForCus(cusId);
		CustomerEduInfo eduList = defualtService.queryEduForCus(cusId);
		model.addAttribute("list", customerInfoDetail);
		model.addAttribute("cusInfo", cusList);
		model.addAttribute("famList", famList);
		model.addAttribute("cusInList", cusInList);
		model.addAttribute("eduList", eduList);
		return "/eagent/Index-kehu-xiangqing";
	}

	@RequestMapping(value = "insertUserMsg")
	public String insertUserMsg(HttpServletRequest request, HttpServletResponse response) {
		String text = request.getParameter("textMsg");		
		int receiveID = Integer.parseInt(request.getParameter("cusId").toString());
		int userId = 1; 
		UserMsg msg = new UserMsg();
		msg.setReceiveUserId(receiveID);
		msg.setMsgContent(text);
		msg.setSendUserId(userId);
		msg.setIsRead(0);
		msg.setMsgType(2);
		msg.setSendUserName("...");
		msg.setReceiveUserType(1);
		msg.setSendUserType(0);
		defualtService.insertUserMsg(msg);
		return "redirect:IndexBA";
	}

	@RequestMapping(value = "IndexBC")
	public String IndexBC(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		int userId = 1;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		List<CustomerInfoDetail> orderList = defualtService.queryOrderCus(map);
		int size = orderList.size();
		for(int i = 0 ; i < size ; i++){
			int cusId = orderList.get(i).getCusId();
			map.put("cusId", cusId);
			int count = defualtService.queryCountEvent(map);
			int countG = defualtService.queryCountGroup(cusId);
			int countO = defualtService.queryCountOrder(cusId);
			int countOrder = count+countG+countO;
			orderList.get(i).setCountOrderCode(countOrder);
		}
		model.addAttribute("size", size);
		model.addAttribute("orderList", orderList);
		return "/eagent/Index-b-c";
	}

	@RequestMapping(value = "IndexBCC")
	public String IndexBCC(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		CustomerInfoDetail customerInfoDetail = this.getCusInfoForCus(request, response);
		int cusId = Integer.parseInt(request.getParameter("nameXiangqing").toString());
		System.out.println("there is come!"+cusId);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cusId", cusId);
		List<EventInfo> eventList = defualtService.queryEventForCus(map);
		List<HouseGroupCustomer> groupList = defualtService.queryGruopForCus(map);
		List<EventBuyHouseOrder> orderList = defualtService.queryOrderForCus(cusId);
		int size = eventList.size();
		int size1 = groupList.size();
		int size2 = orderList.size();
		for(int i = 0 ; i < size ; i++)
		{
			int eventType = eventList.get(i).getEventType();
			String eventName = "参加会所活动";
			switch (eventType) {
			case 1:
				eventName = "本地看房";
				break;
			default:
				break;
			}
			eventList.get(i).setEventTypeName(eventName);
			eventList.get(i).setOrderType("会所活动（看房）订单");
		}
		for(int i = 0 ; i < size1 ; i++)
		{
			int eventType = groupList.get(i).getTravelStatus();
			String travelType = "取消";
			switch (eventType) {
			case 1:
				travelType = "参加";
				break;
			default:
				break;
			}
			groupList.get(i).setTravelType(travelType);
			groupList.get(i).setOrderType("购房团订单");
		}
		for(int i = 0 ; i < size2 ; i++)
		{
			int eventType = orderList.get(i).getOrderStatus();
			String payTypeName = "未付";
			switch (eventType) {
			case 1:
				payTypeName = "已付";
				break;
			default:
				break;
			}
			orderList.get(i).setPayTypeName(payTypeName);
			orderList.get(i).setOrderType("购房订单");
		}
		model.addAttribute("size", size+size1+size2);
		model.addAttribute("cusList", customerInfoDetail);
		model.addAttribute("eventList", eventList);
		model.addAttribute("groupList", groupList);
		model.addAttribute("orderList", orderList);
		return "/eagent/Index-b-c-c";
	}

	@RequestMapping(value = "IndexBB")
	public String IndexBB(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		int userId = 22;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		List<CustomerInfoDetail> discussList = defualtService.qeruyDiscuss(map);
		int size = discussList.size();
		for(int i = 0 ; i < size ; i++){
			int cusId = discussList.get(i).getCusId();
			int count = defualtService.queryCountDiscuss(cusId);
			discussList.get(i).setCountDiscuss(count);
			}
		model.addAttribute("size", size);
		model.addAttribute("discussList", discussList);
		return "/eagent/Index-b-b";
	}

	@RequestMapping(value = "IndexBBB")
	public String IndexBBB(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		int cusId = 1;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cusId", cusId);
		CustomerInfoDetail customerInfoDetail = defualtService.queryCusInCus(cusId);
		List<HouseDiscuss> discussList = defualtService.queryDiscussForCus(map);
		int size = discussList.size();
		model.addAttribute("cusList", customerInfoDetail);
		model.addAttribute("discussList", discussList);
		model.addAttribute("size", size);
		return "/eagent/Index-b-b-b";
	}

	@RequestMapping(value = "IndexBF")
	public String IndexBF(Model model, HttpServletRequest request,
			HttpServletResponse response) {	
		int userId = 1;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("eventType", 2);
		List<CustomerInfoDetail> eventList = defualtService.qerutEventForUser(map);
		int size = eventList.size();
		for(int i = 0 ; i < size ; i++){
			int cusId = eventList.get(i).getCusId();
			map.put("cusId", cusId);
			int count = defualtService.queryCountEvent(map);
			eventList.get(i).setCountEvent(count);
		}
		model.addAttribute("size", size);
		model.addAttribute("groupList", eventList);
		return "/eagent/Index-b-f";
	}

	@RequestMapping(value = "IndexBFF")
	public String IndexBFF(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		int cusId = Integer.parseInt(request.getParameter("nameXiangqing")
				.toString());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cusId", cusId);
		map.put("eventType", 2);
		CustomerInfoDetail customerInfoDetail = defualtService.queryCusInCus(cusId);
		List<EventInfo> eventList = defualtService.queryEventForCus(map);
		int size = eventList.size();
		model.addAttribute("eventList", eventList);
		model.addAttribute("size", size);
		model.addAttribute("cusList", customerInfoDetail);
		return "/eagent/Index-b-f-f";
	}

	@RequestMapping(value = "IndexBDD")
	public String IndexBDD(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		int cusId = Integer.parseInt(request.getParameter("nameXiangqing")
				.toString());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cusId", cusId);
		CustomerInfoDetail customerInfoDetail = defualtService.queryCusInCus(cusId);
		List<HouseGroupCustomer> groupList = defualtService.queryGruopForCus(map);
		int size = groupList.size();
		model.addAttribute("groupList", groupList);
		model.addAttribute("size", size);
		model.addAttribute("cusList", customerInfoDetail);
		return "/eagent/Index-b-d-d";
	}

	@RequestMapping(value = "IndexBD")
	public String IndexBD(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		int userId = 1;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		List<CustomerInfoDetail> groupList = defualtService.queryGroupForUser(map);
		for (int i = 0; i < groupList.size(); i++) {
			int cusId = groupList.get(i).getCusId();
			int count = defualtService.queryCountGroup(cusId);
			groupList.get(i).setCountGroup(count);
		}
		int size = groupList.size();
		System.out.println(groupList.get(0).getCountGroup()+"this's count for group ");
		model.addAttribute("size", size);
		model.addAttribute("groupList", groupList);
		return "/eagent/Index-b-d";
	}

	@RequestMapping(value = "IndexBEE")
	public String IndexBEE(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		int cusId = Integer.parseInt(request.getParameter("nameXiangqing")
				.toString());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cusId", cusId);
		map.put("eventType", 1);
		CustomerInfoDetail customerInfoDetail = defualtService.queryCusInCus(cusId);
		List<EventInfo> lookFangList = defualtService.queryEventForCus(map);
		int size = lookFangList.size();
		model.addAttribute("lookFangList", lookFangList);
		model.addAttribute("size", size);
		model.addAttribute("cusList", customerInfoDetail);
		return "/eagent/Index-b-e-e";
	}

	@RequestMapping(value = "IndexBE")
	public String IndexBE(Model model, HttpServletRequest request,
			HttpServletResponse response) {
		int userId = 1;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("eventType", 1);
		map.put("cusType", null);
		List<CustomerInfoDetail> lookFangList = defualtService.qerutEventForUser(map);
		int size = lookFangList.size();
		for(int i = 0 ; i < size ; i++){
			int cusId = lookFangList.get(i).getCusId();
			map.put("cusId", cusId);
			int count = defualtService.queryCountEvent(map);
			lookFangList.get(i).setCountEvent(count);
		}
		model.addAttribute("size", size);
		model.addAttribute("lookFangList", lookFangList);
		return "/eagent/Index-b-e";
	}
	
	/**
	 * 根据requset请求中条件查询下过单的客户
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
//	@RequestMapping(value = "queryOrderLikeCus")
//	public String queryLikeForCus(HttpServletRequest request,
//			HttpServletResponse response, Model model){
//		
//		return "/eagent/Index-b-c";	
//	}
	
	/**
	 * 根据requset请求中条件查询看过房的客户
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
//	@RequestMapping(value = "queryLookForCus")
//	public String queryLookForCus(HttpServletRequest request,
//			HttpServletResponse response, Model model){
//		Map<String, Object> map = this.getMsgForRequest(request, response);
//		map.put("eventType", 1);
//		List<UserCustomerRelationship> eventList = defualtService.qerutEventForUser(map);
//		int size = eventList.size();
//		for(int i = 0 ; i < size ; i++ ){
//			int cusId = eventList.get(i).getCusId();
//			map.put("cusId", cusId);
//			int count = defualtService.queryCountEvent(map);
//			eventList.get(i).setCountEvent(count);
//		}
//		model.addAttribute("groupList",eventList);
// 		return "/eagent/Index-b-e";	
//	}
	
	/**
	 * 根据requset请求中条件查询参加过购房团的客户
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
//	@RequestMapping(value = "queryGroupForCus")
//	public String queryGroupForCus(HttpServletRequest request,
//			HttpServletResponse response, Model model){
//		Map<String, Object> map = this.getMsgForRequest(request, response);
//		List<UserCustomerRelationship> groupList = defualtService.queryGroupForUser(map);
//		int size = groupList.size();
//		for(int i = 0 ; i < size ; i++){
//			int cusId = groupList.get(i).getCusId();
//			int count = defualtService.queryCountGroup(cusId);
//			groupList.get(i).setCountGroup(count);
//		}
//		model.addAttribute("groupList", groupList);
//		return "/eagent/Index-b-d";	
//	}
	
	/**
	 * 根据requset请求中条件查询评论过的客户
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
//	@RequestMapping(value = "queryDisForCus")
//	public String queryDisForCus(HttpServletRequest request,
//			HttpServletResponse response, Model model){
//		Map<String, Object> map = this.getMsgForRequest(request, response);
//		List<UserCustomerRelationship> disList = defualtService.qeruyDiscuss(map);
//		int size = disList.size();
//		for(int i = 0 ; i < size ; i++ ){
//			int cusId = disList.get(i).getCusId();
//			int count = defualtService.queryCountDiscuss(cusId);
//			disList.get(i).setCountDiscuss(count);
//		}
//		model.addAttribute("discussList", disList);
//		return "/eagent/Index-b-b";	
//	}
	
	/**
	 * 根据requset请求中条件查询参加过活动的客户
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
//	@RequestMapping(value = "queryEventForCus")
//	public String queryEventForCus(HttpServletRequest request,
//			HttpServletResponse response, Model model){
//		Map<String, Object> map = this.getMsgForRequest(request, response);
//		map.put("eventType", 2);
//		List<UserCustomerRelationship> eventList = defualtService.qerutEventForUser(map);
//		int size = eventList.size();
//		for(int i = 0 ; i < size ; i++ ){
//			int cusId = eventList.get(i).getCusId();
//			map.put("cusId", cusId);
//			int count = defualtService.queryCountEvent(map);
//			eventList.get(i).setCountEvent(count);
//		}
//		model.addAttribute("groupList",eventList);
//		return "/eagent/Index-b-f";	
//	}
	
	
/**
 * 根据request中的条件查询客户并返回
 * @param request
 * @param response
 * @param model
 * @return 路径
 */
//	@RequestMapping(value = "queryLike")
//	public String queryLikeForUser(HttpServletRequest request,
//			HttpServletResponse response, Model model)
//	{
//		String sex = request.getParameter("sex");
//		String city = request.getParameter("city");
//		String cusName = request.getParameter("cusName");
//		String sexName = null ;
//		String cityCode = null ;
//		String cus = null ;
//		try {
//			sexName = new String(sex.getBytes("iso8859-1"),"utf-8");
//			cityCode = new String(city.getBytes("iso8859-1"),"utf-8");
//			cus = new String(cusName.getBytes("iso8859-1"),"utf-8");
//		} catch (UnsupportedEncodingException e) {
//			e.printStackTrace();
//		}
//		int sexType = 0 ;
//		Map<String, Object> map = new HashMap<String, Object>();
//		if(sexName != null)
//		{
//			if(sexName == "男" && sexName.equals("男")){
//				sexType = 0;
//			}
//			if(sexName == "女" && sexName.equals("女")){
//				sexType = 1;
//			}
//		}
//		map.put("userId",1);
//		map.put("city",cityCode);
//		map.put("name", cus);
//		map.put("sexType", sexType);
//		List<UserInfoDetail> cusList = this.getListCusForUser(request, response, map);
//		model.addAttribute("cusList", cusList);
//		return "/eagent/Index-b-a";
//	}
	/**
	 * 根据蜂蜜查询客户组合信息
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	public List<UserInfoDetail> getListCusForUser(
			HttpServletRequest request, HttpServletResponse response ,Map<String, Object> map) {
		List<UserInfoDetail> list = defualtService.queryCusInUser(map);
		return list;
	}
	/**
	 * 获得存储了页面请求信息的map
	 * @param request
	 * @param response
	 * @return
	 */
//	public Map<String, Object> getMsgForRequest(HttpServletRequest request ,HttpServletResponse response){
//		Map<String, Object> map = new HashMap<String, Object>();
//		try {
//			String startTime = new String(request.getParameter("startTime").getBytes("iso8859-1"),"utf-8");
//			String endTime = new String(request.getParameter("endTime").getBytes("iso8859-1"),"utf-8");
//			String city = new String(request.getParameter("city").getBytes("iso8859-1"),"utf-8");
//			String name = new String(request.getParameter("name").getBytes("iso8859-1"),"utf-8");
//			map.put("userId", 1);
//			map.put("startTime", startTime);
//			map.put("endTime", endTime);
//			map.put("city", city);
//			map.put("name", name);
//		} catch (UnsupportedEncodingException e) {
//			e.printStackTrace();
//		}	
//		return map;
//	}
	
	/**
	 * 根据客户ID查询 组合信息
	 * @param request
	 * @param response
	 * @return UserCustomerRelationship
	 */
	public CustomerInfoDetail getCusInfoForCus(
			HttpServletRequest request, HttpServletResponse response) {
		int cusId = Integer.parseInt(request.getParameter("nameXiangqing").toString());
		System.out.println("this is come?");
		CustomerInfoDetail customerInfoDetail = defualtService.queryCusInCus(cusId);
		return customerInfoDetail;
	}
	
	public int getUserID(HttpServletRequest request, HttpServletResponse response)
	{

		 try {
		 int userId = SessionInfo.getVisitorId(request);
		 } catch (Exception e) {
		 e.printStackTrace();
		 }
		return 1;
	}
}
