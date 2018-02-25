package com.fc.flf.portal.web;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fc.flf.common.domain.HouseEstimate;
import com.fc.flf.common.domain.HouseInfo;
import com.fc.flf.common.domain.HouseInfoDetail;
import com.fc.flf.common.domain.HouseInfoPriceByStat;
import com.fc.flf.common.domain.HousePicInfo;
import com.fc.flf.common.domain.VisitorCollectHouse;
import com.fc.flf.common.util.CommonUtil;
import com.fc.flf.common.util.CookieUnit;
import com.fc.flf.common.util.DateTools;
import com.fc.flf.common.util.HouseInfoUnit;
import com.fc.flf.common.util.Page;
import com.fc.flf.common.util.SessionInfo;
import com.fc.flf.portal.service.IHouseEstimateService;
import com.fc.flf.portal.service.IHouseInfoDetailService;
import com.fc.flf.portal.service.IHouseInfoService;
import com.fc.flf.portal.service.IHousePicInfoService;
import com.fc.flf.portal.service.IHousePriceService;
import com.fc.flf.portal.service.ILineSetMealService;
import com.fc.flf.portal.service.IUserStudySaleHouseService;
import com.fc.flf.portal.service.IVisitorCollectHouseService;

@Controller
public class HouseInfoController {

	@Resource
	private IHouseInfoService houseInfoService;
	@Resource
	private IHouseInfoDetailService houseInfoDetailService;
	@Resource
	private IHouseEstimateService houseEstimateService;
	@Resource
	private IHousePriceService housePriceService;
	@Resource
	private IHousePicInfoService housePicInfoService; 
	@Resource 
	private IUserStudySaleHouseService userSaleHouserService;
	@Resource
	private ILineSetMealService lineSetMealService;
	@Resource
	private IVisitorCollectHouseService collectHouseService;	//收藏楼盘
	
	public IHouseInfoService getHouseInfoService() {
		return houseInfoService;
	}

	public void setHouseInfoService(IHouseInfoService houseInfoService) {
		this.houseInfoService = houseInfoService;
	}

	public IUserStudySaleHouseService getUserSaleHouserService() {
		return userSaleHouserService;
	}

	public void setUserSaleHouserService(
			IUserStudySaleHouseService userSaleHouserService) {
		this.userSaleHouserService = userSaleHouserService;
	}
	
	public void setHousePriceService(IHousePriceService housePriceService) {
		this.housePriceService = housePriceService;
	}

	public void framePlugin(int houseId,Model model,String read){
		HouseInfo houseInfo = houseInfoService.findHouseInfoById(houseId);
		int count = userSaleHouserService.getHouseSaleSum(houseId);
		HouseInfoPriceByStat avgPrice = housePriceService.avgPriceByNowMonth(houseId); //get Now Month HouseInfo Price avg
		int price =0;
		if(avgPrice.getAvgPrice()!=0.0){
			price=(int)avgPrice.getAvgPrice();
		}
		model.addAttribute("avgPrice", price);
		model.addAttribute("houseInfo", houseInfo);
		model.addAttribute("count", count);
		model.addAttribute("read", read);
	}
	
	@RequestMapping(value="/getHouseInfoById")
	public String getHouseInfoById(int houseId,Model model,HttpServletResponse response) throws Exception {
		houseInfoService.saveVisitorSkimHouse(houseId,response);
		houseInfoService.updateHouseAttenttion(houseId);
		int countPicType=4;	//宣传类型图
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("houseId", houseId);
		map.put("picType", countPicType);
		int pageSum=housePicInfoService.getHousePicInfoList(map).size();
		int countSize = 0;
		
		if(pageSum%2==0)
	    {
	    	countSize = (int) Math.ceil(pageSum / 2);
	    }
	    else
	    {
	     	countSize = (pageSum / 2)+1;
	    }
		
		/*
		 * 根据houseId查询 
		 * 	houseInfo(findHouseInfoById 新楼盘信息表)
		 * 	houseInfoDetail(findHouseInfoDetailById新楼盘详细信息)
		 * 	houseEstimate(findHouseEstimateById楼盘评估)
		 * 	housePrice(avgPriceByNowMonth 当月最新楼盘平均价)
		 * 	userSaleHouse(getHouseSaleSum 经纪人认售楼盘总人数)
		 * 	lineSetMeal(getGroupNameByHouseId旅游购房团团名)
		 */
		HouseInfo houseInfo = houseInfoService.findHouseInfoById(houseId);	
		HouseInfoDetail houseInfoDetail = houseInfoDetailService.findHouseInfoDetailById(houseId);
		HouseEstimate houseEstimate = houseEstimateService.findHouseEstimateById(houseId);
		String groupName = lineSetMealService.getGroupNameByHouseId(houseId);
		
		map.remove("picType");
		map.put("picType", 2);
		List<HousePicInfo> housePicInfoList=housePicInfoService.getHousePicInfoList(map);
		model.addAttribute("houseInfo", houseInfo);
		model.addAttribute("houseInfoDetail", houseInfoDetail);
		model.addAttribute("houseEstimate", houseEstimate);
		model.addAttribute("housePicInfoList", housePicInfoList);
		model.addAttribute("picInfoListSize", housePicInfoList.size());
		model.addAttribute("houseId", houseId);
		model.addAttribute("pageCount", countSize);
		model.addAttribute("groupName", groupName);
		
		framePlugin(houseId, model,"houseIndex");
		return "/portal/HouseInfo";
	}
	
	@RequestMapping(value="/showHouseInfoBannerImg")
	public String houseInfoBannerImg(int pageCount,int houseId,int page,int pageSize,Model model){
		int countSize = pageCount;
		if(page<=0 || page > countSize){
			page=1;
		}else if(pageSize<=2){
			pageSize=2;
		}else{
			
		}
		Map<String, Object> map=new HashMap<String, Object>();
		
		Page pg = new Page();
		pg.setCurPage(page);
		pg.setPageSize(pageSize);
		
		map.put("picType", 4);
		map.put("houseId", houseId);
		List<HousePicInfo> housePicInfoList=housePicInfoService.getHousePicInfoListOnLimit(pg,map);
		model.addAttribute("housePicInfoList", housePicInfoList);
		
		return "/portal/HouseInfoBannerImg";
	}
	
	@RequestMapping(value="/getHouseInfoServey")
	public String getHouseInfoServey(int houseId,Model model){
		HouseInfo houseInfo = houseInfoService.findHouseInfoById(houseId);
		HouseInfoDetail houseInfoDetail = houseInfoDetailService.findHouseInfoDetailById(houseId);
		int count = userSaleHouserService.getHouseSaleSum(houseId);
		model.addAttribute("count", count);
		model.addAttribute("houseInfo", houseInfo);
		model.addAttribute("houseInfoDetail", houseInfoDetail);
		framePlugin(houseId, model, "houseInfo");
		return "/portal/HouseInfoServey";
	}
	
	@RequestMapping(value="/showMaps")
	public String showMaps(){
		return "/portal/HouseInfoMap";
	}
	
	@RequestMapping(value = "/searchHouses")
	public String searchHouses(Model model,HouseInfo houseInfo,Page page,String isExpand)
								throws UnsupportedEncodingException{
		HouseInfoUnit.resolveMutiSelectHouseInfo(houseInfo);
		model.addAttribute("isExpand",isExpand);
		model.addAttribute("houseInfos",houseInfoService.findHouseInfoAccurate(houseInfo,page));
		model.addAttribute("count",houseInfoService.getHouseInfoAccurateCount(houseInfo));
		model.addAttribute("houseInfo",houseInfo);
		return "/portal/monopolyofsale";
	}
	
	@RequestMapping(value="/collectHouse")
	@ResponseBody
	public int collectHouse(int houseId,HttpServletRequest request){
		int userId = -1;
		VisitorCollectHouse visitorCollectHouse = null;
		try {
			userId = SessionInfo.getVisitorId(request);
			String userType = SessionInfo.getVisitorType(request);
			visitorCollectHouse= new VisitorCollectHouse();
			//截取用户类型
			if (!"".equals(userType)) {
				int index = userType.lastIndexOf("_");
				int type = Integer.parseInt(userType.substring(index+1));
				visitorCollectHouse.setVisitorType(type);
			}
			visitorCollectHouse.setHouseId(houseId);
			visitorCollectHouse.setVisitorId(userId);
			visitorCollectHouse.setCollectTime(DateTools.dateToHour());
		} catch (Exception e) {
			//游客权限 是否
			return -2;
		}
		
		return collectHouseService.userCollectHouse(visitorCollectHouse);
		
	}
}
