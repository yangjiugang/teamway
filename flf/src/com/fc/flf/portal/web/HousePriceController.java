package com.fc.flf.portal.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fc.flf.common.domain.HouseInfo;
import com.fc.flf.common.domain.HouseInfoPriceByStat;
import com.fc.flf.common.domain.HouseInfoPriceTotal;
import com.fc.flf.common.domain.HousePrice;
import com.fc.flf.common.domain.UserSaleHouse;
import com.fc.flf.common.util.SessionInfo;
import com.fc.flf.portal.service.IHouseInfoService;
import com.fc.flf.portal.service.IHousePriceService;
import com.fc.flf.portal.service.IUserStudySaleHouseService;

@Controller
public class HousePriceController {
	
	@Resource
	private IHousePriceService housePriceService;
	@Resource
	private IHouseInfoService houseInfoService;
	@Resource
	private IUserStudySaleHouseService userSaleHouseService;
	
	@RequestMapping(value="/updatePriceOnHouseInfo")
	@ResponseBody
	public HouseInfoPriceTotal updatePriceOnHouseInfo(HttpServletRequest request,Model model){
		HousePrice housePrice = null;
		if (!"".equals(request.getParameter("math")) && request.getParameter("math")!=null) {
			housePrice = new HousePrice();
			int houseId = Integer.parseInt(request.getParameter("houseId"));
			int housePriceNumber = Integer.parseInt(request.getParameter("housePrice"));
			
			housePrice.setHouseId(houseId);
			housePrice.setHousePrice(housePriceNumber);
		}
		String userName = null;
		try{
			userName=SessionInfo.getVisitorName(request);
			housePrice.setVisitorName(userName);
			int visitorId = SessionInfo.getVisitorId(request);
			
			String type = SessionInfo.getVisitorType(request);
			int index = type.lastIndexOf("_");
			int userType = Integer.parseInt(type.substring(index+1));
			
			housePrice.setVisitorId(visitorId);
			housePrice.setVisitorType(userType);
		}catch (Exception e) {
			return null;
		}
		housePrice.setVisitorName(userName);
		int isSave=housePriceService.saveHousePrice(housePrice);
		List<HouseInfoPriceTotal> priceTotals = housePriceService.getPriceTotal(housePrice.getHouseId());
		model.addAttribute("houseId",housePrice.getHouseId());
		return priceTotals.get(0);
	}
	
	@RequestMapping(value="/showAnalytic")
	public String showAnalytic(int year,int houseId,Model model){
		Map<String, Object> map = new HashMap<String, Object>();
		int visitorType=0;
		map.put("year", year);
		map.put("houseId", houseId);
		
		List< List<HouseInfoPriceByStat> > list=new ArrayList< List<HouseInfoPriceByStat> >();
		HouseInfo houseInfo = houseInfoService.findHouseInfoById(houseId);
		
		for(int i=0;i <=3; i++ ){
			if (i==2) {
				continue;
			}
			visitorType=i;
			
			if (map.get("visitorType")!=null) {
				map.remove("visitorType");
			}
			
			map.put("visitorType", visitorType);
			List<HouseInfoPriceByStat> priceByStat = housePriceService.groupByDate(map);
			if (priceByStat!=null && priceByStat.size()!=0) {
				list.add(priceByStat);
			}
			
		}
		model.addAttribute("list", list);
		model.addAttribute("houseId", houseId);
		model.addAttribute("houseInfo", houseInfo);
		
		return "/portal/Analytic";
	}
	
	@RequestMapping(value="/jumpAnalytic")
	public String jumpAnalytic(int year , int houseId,Model model){
		Map<String, Object> map = new HashMap<String, Object>();
		int visitorType=0;
		
		map.put("houseId", houseId);
		List<HouseInfoPriceByStat> avgPriceList=new ArrayList<HouseInfoPriceByStat>();
		HouseInfo houseInfo = houseInfoService.findHouseInfoById(houseId);
		for(int i=0;i <=3; i++ ){
			if (i==2) {
				continue;
			}
			visitorType=i;
			if (map.get("visitorType")!=null) {
				map.remove("visitorType");
			}
			
			map.put("visitorType", visitorType);
			HouseInfoPriceByStat avgPrice = housePriceService.avgPriceByVisitorType(map);
			avgPriceList.add(avgPrice);
		}
		avgPriceList.add(housePriceService.avgPriceByNowMonth(houseId));
		model.addAttribute("avgPriceList",avgPriceList);
		model.addAttribute("year", year);
		model.addAttribute("houseId", houseId);
		model.addAttribute("houseInfo", houseInfo);
		
		HouseInfoController controller = new HouseInfoController();
		controller.setHouseInfoService(houseInfoService);
		controller.setUserSaleHouserService(userSaleHouseService);
		controller.setHousePriceService(housePriceService);
		controller.framePlugin(houseId, model, "housePrice");
		return "/portal/HousePriceAnalytic";
	}
}
