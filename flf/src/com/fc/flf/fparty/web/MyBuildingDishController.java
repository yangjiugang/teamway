package com.fc.flf.fparty.web;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fc.flf.common.domain.CustomerInfo;
import com.fc.flf.common.domain.HouseInfo;
import com.fc.flf.common.util.Page;
import com.fc.flf.fparty.service.IVisitorHouseService;

/**
 * 我的楼盘
 * @author 龚红军
 *
 */
@Controller
public class MyBuildingDishController {
	@Resource
	private FPublicHouseForDate addHouseToDate;
	@Autowired
	private IVisitorHouseService visitorHouseService;
	@Resource
	private FPublicNoticeForData publicNoticeForData;
	@Resource
	private UserInfoAndMsgCountForData userInfoAndMsgCountForData;
	
	/**
	 * 我的楼盘
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/myHouses")
	public ModelAndView MyBuilding(HttpServletRequest request,Model model,CustomerInfo customer) throws Exception{
		ModelAndView view = new ModelAndView("/fparty/Houses");
		addHouseToDate.addCustomerSkimHouseToModel(view, customer);
		addHouseToDate.addCustomerCollectHouseToModel(view, customer);
		addHouseToDate.addCustomerPriceHouseToModel(view, customer);
		addHouseToDate.addCustomerLookHouseToModel(view, customer);
		addHouseToDate.addUserRecommedHouseToModel(view, customer);
		publicNoticeForData.addDataToModel(model);
		userInfoAndMsgCountForData.addDataToModel(model, request);
		view.addObject("customerInfoDetail",customer);
		view.addObject("result", "true");
		return view;
	}
	
	
    
	/**
	 * 我关注的楼盘
	 * @return
	 */
	@RequestMapping(value = "/skimHouses")
	@ResponseBody
	public List<HouseInfo> skimBuilding(Page page ,CustomerInfo customer){
		int skimCount=visitorHouseService.skimHousesCount(customer);  //我关注的楼盘信息数量
		page.setRowCount(skimCount);
		List<HouseInfo> skimHouseList=visitorHouseService.skimHouses(page, customer); //我关注的楼盘信息
		return skimHouseList;
	}
	
	/**
	 * 我收藏的楼盘
	 * @return
	 */
	@RequestMapping(value = "/collectHouses")
	@ResponseBody
	public List<HouseInfo> collectBuilding(Page page ,CustomerInfo customer){
		int collectCount=visitorHouseService.collectHousesCount(customer);  //我收藏的楼盘信息数量
		page.setRowCount(collectCount); //总页数
		List<HouseInfo> collectHouseList=visitorHouseService.collectHouse(page, customer); //我收藏的楼盘信息	
		return collectHouseList;
	}
	
	/**
	 * 经纪人推荐的楼盘
	 * @return
	 */
	@RequestMapping(value = "/recommendHouses")
	@ResponseBody
	public List<HouseInfo> recommendBuilding(Page page ,CustomerInfo customer){
		int recommendCount=visitorHouseService.recommendHousesCount(customer);  //经纪人推荐的楼盘信息数量
		page.setRowCount(recommendCount); //总页数
		List<HouseInfo> recommendHouseList=visitorHouseService.recommendHouse(page, customer); //经纪人推荐的楼盘信息	
		return recommendHouseList;
	}
	/**
	 * 我喊过价的楼盘
	 * @return
	 */
	@RequestMapping(value = "/priceHouses")
	@ResponseBody
	public List<HouseInfo> priceBuilding(Page page ,CustomerInfo customer){
		int priceCount=visitorHouseService.priceHousesCount(customer);  //我喊过价的楼盘信息数量
		page.setRowCount(priceCount); //总页数
		List<HouseInfo> priceHouseList=visitorHouseService.priceHouse(page, customer); //我喊过价的楼盘信息	
		return priceHouseList;
	}
	
	/**
	 * 我实地看过的楼盘
	 * @return
	 */
	@RequestMapping(value = "/lookHouses")
	@ResponseBody
	public List<HouseInfo> lookBuilding(Page page ,CustomerInfo customer){
		int lookCount=visitorHouseService.lookHousesCount(customer);  //我喊过价的楼盘信息数量
		page.setRowCount(lookCount); //总页数
		List<HouseInfo> lookHouseList=visitorHouseService.lookHouse(page, customer); //我喊过价的楼盘信息	
		return lookHouseList;
	}
	
	
	
}
