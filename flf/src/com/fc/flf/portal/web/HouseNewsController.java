package com.fc.flf.portal.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fc.flf.common.domain.HouseInfo;
import com.fc.flf.common.domain.HouseNews;
import com.fc.flf.common.util.Page;
import com.fc.flf.portal.service.IHouseInfoService;
import com.fc.flf.portal.service.IHouseNewsService;
import com.fc.flf.portal.service.IHousePriceService;
import com.fc.flf.portal.service.IUserStudySaleHouseService;

@Controller
public class HouseNewsController {

	@Resource
	private IHouseNewsService houseNewsService;
	@Resource 
	private IUserStudySaleHouseService userSaleHouserService;
	@Resource
	private IHouseInfoService houseInfoService;
	@Resource
	private IHousePriceService housePriceService;
	
	@RequestMapping(value="/houseNews")
	public String getHouseNews(int houseId,Page page,Model model){
		
		HouseInfo houseInfo = houseInfoService.findHouseInfoById(houseId);
		int saleSum = userSaleHouserService.getHouseSaleSum(houseId);
		List<HouseNews> houseNews=houseNewsService.getHouseNews(page,houseId);		//新闻列表 根据houseId
		model.addAttribute("houseNews", houseNews);
		model.addAttribute("houseInfo", houseInfo);
		model.addAttribute("count", saleSum);
		
		HouseInfoController houseInfoController = new HouseInfoController();
		houseInfoController.setHouseInfoService(houseInfoService);
		houseInfoController.setUserSaleHouserService(userSaleHouserService);
		houseInfoController.setHousePriceService(housePriceService);
		houseInfoController.framePlugin(houseId, model, "houseNews");
		return "/portal/HouseNews";
	}
	
	@RequestMapping(value="/newsInfo")
	public String getNewsInfo(int newsId,Model model){
		HouseNews news = houseNewsService.getNewsById(newsId);
		model.addAttribute("news", news);
		return "/portal/NewsInfo";
	}
	
	@RequestMapping(value="/newHouseNews")
	@ResponseBody
	public List<HouseNews> getNewsInfo(){
		return houseNewsService.getNewHouseNews();
	}
}
