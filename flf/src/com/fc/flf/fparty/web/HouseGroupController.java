package com.fc.flf.fparty.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fc.flf.common.domain.CustomerInfo;
import com.fc.flf.common.domain.HouseGroupInfo;
import com.fc.flf.common.domain.HouseInfo;
import com.fc.flf.common.util.DateTools;
import com.fc.flf.common.util.Page;
import com.fc.flf.common.util.SessionInfo;
import com.fc.flf.fparty.service.IVisitorHouseGroupService;
import com.fc.flf.portal.service.IHouseInfoService;

/**
 * 我的旅游房团
 * 
 * @author 龚红军
 * 
 */
@Controller
public class HouseGroupController {
	@Resource
	private FPublicHouseGroupForDate addHouseGroupToModel;
	@Resource
	private IVisitorHouseGroupService houseGroupService;
	@Autowired
	private IHouseInfoService houseInfoService;
	@Resource
	private FPublicNoticeForData fPublicNoticeForData;
	@Resource
	private UserInfoAndMsgCountForData userInfoAndMsgCountForData;

	/**
	 * 旅游房团
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/HouseGroupInfo")
	public ModelAndView houseGroupInfo(HttpServletRequest request, Model model,
			CustomerInfo customer) throws Exception {
		ModelAndView view = new ModelAndView("/fparty/lvyougoufantuan");
		addHouseGroupToModel.addCustomerSkimHouseGroupToModel(view, customer); // 客户关注的房团
		addHouseGroupToModel
				.addCustomerCollectHouseGroupToModel(view, customer); // 客户收藏的房团
		addHouseGroupToModel.addCustomerJoinHouseGroupToModel(view, customer); // 客户参加的房团
		addHouseGroupToModel.addCustomerRecommendHouseGroupToModel(view,
				customer); // 经纪人推荐的房团
		fPublicNoticeForData.addDataToModel(model);// 页面公告部分
		userInfoAndMsgCountForData.addDataToModel(model, request);// 我的蜂蜜

		view.addObject("customerInfoDetail", customer);
		view.addObject("result", "true");
		return view;
	}

	/**
	 * 我关注的旅游房团
	 * 
	 * @return
	 */
	@RequestMapping(value = "/attentionHouseGroup")
	@ResponseBody
	public List<HouseGroupInfo> attentionHouseGroup(Page page,
			CustomerInfo customer) {
		int count = houseGroupService.getHouseGroupCount(customer); // 得到有几条记录
		page.setRowCount(count);
		List<HouseGroupInfo> list = houseGroupService.listHouseGroupInfo(page,
				customer);
		return list;
	}

	/**
	 * 我收藏的旅游房团
	 * 
	 * @param page
	 * @param custome
	 * @return
	 */
	@RequestMapping(value = "/collectHouseGroup")
	@ResponseBody
	public List<HouseGroupInfo> collectHouseGroup(Page page,
			CustomerInfo customer) {
		int count = houseGroupService.getCollectHouseGroupCount(customer); // 得到有几条记录
		page.setRowCount(count);
		List<HouseGroupInfo> list = houseGroupService
				.listCollectHouseGroupInfo(page, customer);
		return list;
	}

	/**
	 * 我参加的旅游房团
	 * 
	 * @param page
	 * @param customer
	 * @return
	 */
	@RequestMapping(value = "/joinHouseGroup")
	@ResponseBody
	public List<HouseGroupInfo> joinHouseGroup(Page page, CustomerInfo customer) {
		int cout = houseGroupService.getJoinHouseGroupCount(customer);
		page.setRowCount(cout);
		List<HouseGroupInfo> list = houseGroupService.listJoinHouseGroupInfo(
				page, customer);
		return list;
	}

	/**
	 * 经纪人推荐的旅游房团
	 * 
	 * @param page
	 * @param customer
	 * @return
	 */
	@RequestMapping(value = "/recommendHouseGroup")
	@ResponseBody
	public List<HouseGroupInfo> RecommendHouseGroup(Page page,
			CustomerInfo customer) {
		int cout = houseGroupService.getRecommendHouseGroupCount(customer);
		page.setRowCount(cout);
		List<HouseGroupInfo> list = houseGroupService
				.listRecommendHouseGroupInfo(page, customer);
		return list;
	}

	/**
	 * 查询客户旅游购房团订单
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getJoinHouseGroup")
	public String queryJoinHouseGroup(Page page, HttpServletRequest request,
			Model model) throws Exception {
		// 访问者ID
		int cusId = SessionInfo.getVisitorId(request);
		// 访问者看房订单总数
		// 传入null 是因为此处不需要查询条件
		int iCount = houseGroupService.queryJoinHouseGroupCount(cusId, null);
		page.setRowCount(iCount);
		// 查询结果集
		// 传入null 是因为此处不需要查询条件
		List<HouseGroupInfo> lstHouseGroup = houseGroupService
				.queryJoinHouseGroup(cusId, page, null);
		model.addAttribute("lstHouseGroup", lstHouseGroup);
		return "/fparty/HouseGroupOrderPage";
	}

	/**
	 * 查询客户旅游购房团
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/houseGroup")
	public String houseGroup(Page page, HttpServletRequest request,
			Model model, String queryObj) throws Exception {
		// 访问者ID
		int cusId = SessionInfo.getVisitorId(request);
		// 访问者看房订单总数
		// 传入queryObj查询条件
		int iCount = houseGroupService
				.queryJoinHouseGroupCount(cusId, queryObj);
		page.setRowCount(iCount);
		// 查询结果集
		// 传入queryObj查询条件
		List<HouseGroupInfo> lstHouseGroup = houseGroupService
				.queryJoinHouseGroup(cusId, page, queryObj);
		model.addAttribute("lstHouseGroup", lstHouseGroup);
		return "/fparty/Xianlu";
	}

	/**
	 * 查询看房团
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/participateSeeHouse")
	public String participateSeeHouse(Page page, HttpServletRequest request,
			Model model, String queryObj) throws Exception {
		HouseInfo houseInfo = new HouseInfo();
		page.setPageSize(6);
		if (queryObj != null || "".equals(queryObj)) {
			houseInfo.setHouseName(new String(queryObj.getBytes("iso8859-1"),
					"utf-8"));
		}
		List<HouseInfo> lstHouseInfo = houseInfoService.getSeeHouseAccurate(
				houseInfo, page);
		model.addAttribute("lstHouseInfo", lstHouseInfo);
		return "/fparty/SeeHouse";
	}

	/**
	 * 客户报名旅游购房团
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/registHouseGroup")
	public String registHouseGroup(String customerPhone, int togetherCus,
			int houseGroupId, String joinTime, HttpServletRequest request,
			Model model) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cusId", SessionInfo.getVisitorId(request));
		map.put("customerId", SessionInfo.getVisitorId(request));
		map.put("customerName", SessionInfo.getVisitorName(request));
		map.put("customerPhone", customerPhone);
		map.put("joinTime", DateTools.getTs(joinTime));
		map.put("houseGroupId", houseGroupId);
		map.put("togetherCustomers", togetherCus);
		try {
			map.put("userId", SessionInfo.getVisitorId(request));
		} catch (Exception e) {
			e.printStackTrace();
		}
		houseGroupService.insertHouseGroupCusTomer(map);
		return "forward:houseGroup";
	}

	/**
	 * 客户报名本地看房
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/registSeeHouse")
	public String registSeeHouse(int eventId, HttpServletRequest request,
			Model model) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("eventId", eventId);
		map.put("cusId", SessionInfo.getVisitorId(request));
		map.put("customerId", SessionInfo.getVisitorId(request));
		map.put("customerName", SessionInfo.getVisitorName(request));
		map.put("visitorType", 2);
		map.put("isCheckin", 1);
		map.put("isRegister", 1);
		map.put("valuation", "");
		map.put("valuation1", "");
		map.put("valuation2", "");
		map.put("valuation3", "");
		map.put("valuation4", "");
		map.put("createAt", DateTools.getCurrDateTime());
		houseGroupService.insertSeeHouseOrder(map);
		return "forward:participateSeeHouse";
	}
}
