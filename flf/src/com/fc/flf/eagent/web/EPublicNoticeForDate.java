package com.fc.flf.eagent.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.fc.flf.common.domain.HouseGroupInfo;
import com.fc.flf.common.domain.HouseInfo;
import com.fc.flf.common.domain.UserInfo;
import com.fc.flf.common.util.Page;
import com.fc.flf.eagent.service.IUserStudySaleHouseService;
import com.fc.flf.fparty.service.IVisitorHouseGroupService;

@Service
public class EPublicNoticeForDate {	
	@Resource
	private IUserStudySaleHouseService userService;  
	@Resource
	private IVisitorHouseGroupService houseGroupService;
	
	/**
	 * 易介宝的个人主页到得经纪人认售的房源  并且只取前五条	分页显示到页面
	 * @param view
	 * @param userInfo
	 */
    public void addSaleHouseToDate(ModelAndView view,UserInfo userInfo){    	
		Page salePage=new Page();		
		salePage.setPageSize(5);   //设置分页的条数为5条	
		int saleCount=userService.getSaleHouseInfoCount(userInfo);
		salePage.setRowCount(saleCount);
		List<HouseInfo> saleHouses=userService.saleHouseInfo(salePage, userInfo); //到得认售房源
		view.addObject("saleHouses", saleHouses); //认售房源
   		view.addObject("salePage", salePage);
    }
    
    /**
     * 易介宝的个人主页到得经纪人收藏的房团	并且只取前五条	分页显示到页面
     * @param view
     * @param userInfo
     */
    public void addUserCollentGroupToDate(ModelAndView view,UserInfo userInfo){    	
		Page userCollectPage=new Page();
		userCollectPage.setPageSize(5);  //设置分页的条数为5条
		int userCollectCount=houseGroupService.getUserCollectHouseGroupCount(userInfo); //根据经纪人到得经纪人收藏的房团总条数 （分页用）
		userCollectPage.setRowCount(userCollectCount);
		List<HouseGroupInfo> userCollectHouseGroupInfo=houseGroupService.listUserCollectHouseGroupInfo(userCollectPage, userInfo); //得到经纪人收藏的房团
		view.addObject("userCollectHouseGroupInfo", userCollectHouseGroupInfo); //经纪人收藏的房团
   		view.addObject("userCollectPage", userCollectPage);
    }
    
}
