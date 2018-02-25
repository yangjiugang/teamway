package com.fc.flf.fparty.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.fc.flf.common.domain.CustomerInfo;
import com.fc.flf.common.domain.HouseInfo;
import com.fc.flf.common.util.Page;
import com.fc.flf.fparty.service.IVisitorHouseService;

@Service
public class FPublicHouseForDate {
	@Autowired
	private IVisitorHouseService visitorHouseService;
	
	/**
	 * 我关注的楼盘信息  (十条)
	 * @param view
	 * @param customer
	 */
	public void addCustomerSkimHouseToModel(ModelAndView view,CustomerInfo customer){
		Page skimPage=new Page();
		int skimCount=visitorHouseService.skimHousesCount(customer);  //我关注的楼盘信息数量
		skimPage.setRowCount(skimCount); //总页数
		List<HouseInfo> skimHouseList=visitorHouseService.skimHouses(skimPage, customer); //我关注的楼盘信息
		view.addObject("skimHouseList",skimHouseList);
		view.addObject("skimCount",skimCount);
		view.addObject("skimPage",skimPage);
	}
	
	/**
	 * 我收藏的楼盘信息  (十条)
	 * @param view
	 * @param customer
	 */
	public void addCustomerCollectHouseToModel(ModelAndView view,CustomerInfo customer){
		Page collectPage=new Page();
		int collectCount=visitorHouseService.collectHousesCount(customer);  //我收藏的楼盘信息数量
		collectPage.setRowCount(collectCount); //总页数
		List<HouseInfo> collectHouseList=visitorHouseService.collectHouse(collectPage, customer); //我收藏的楼盘信息	
		view.addObject("collectHouseList",collectHouseList);
		view.addObject("collectCount",collectCount);
		view.addObject("collectPage",collectPage);
	}
	
	/**
	 * 我喊过价的楼盘信息	  (十条)
	 * @param view
	 * @param customer
	 */
	public void addCustomerPriceHouseToModel(ModelAndView view,CustomerInfo customer){
		Page pricePage=new Page();
		int priceCount=visitorHouseService.priceHousesCount(customer);  //我喊过价的楼盘信息数量
		pricePage.setRowCount(priceCount); //总页数
		List<HouseInfo> priceHouseList=visitorHouseService.priceHouse(pricePage, customer); //我喊过价的楼盘信息	
		view.addObject("priceHouseList",priceHouseList);
		view.addObject("priceCount",priceCount);
		view.addObject("pricePage",pricePage);
	}
	
	/**
	 * 我实地看过的楼盘信息	  (十条)
	 * @param view
	 * @param customer
	 */
	public void addCustomerLookHouseToModel(ModelAndView view,CustomerInfo customer){
		Page lookPage=new Page();
		int lookCount=visitorHouseService.lookHousesCount(customer);  //我实地看过的楼盘信息数量
		lookPage.setRowCount(lookCount); //总页数
		List<HouseInfo> lookHouseList=visitorHouseService.lookHouse(lookPage, customer); //我实地看过的楼盘信息	
		view.addObject("lookHouseList",lookHouseList);
		view.addObject("lookCount",lookCount);
		view.addObject("lookPage",lookPage);
	}
	
	/**
	 * 经纪人推荐的楼盘信息  (十条)
	 * @param view
	 * @param customer
	 */
	public void addUserRecommedHouseToModel(ModelAndView view,CustomerInfo customer){
		Page recommendPage=new Page();
		int recommendCount=visitorHouseService.recommendHousesCount(customer);
		recommendPage.setRowCount(recommendCount); //总页数
		List<HouseInfo> recommendHouseList=visitorHouseService.recommendHouse(recommendPage, customer); //经纪人推荐的楼盘信息	
		view.addObject("recommendHouseList",recommendHouseList);
		view.addObject("recommendCount",recommendCount);
		view.addObject("recommendPage",recommendPage);
	}

}
