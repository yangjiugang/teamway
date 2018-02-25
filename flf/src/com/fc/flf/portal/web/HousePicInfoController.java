package com.fc.flf.portal.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fc.flf.common.domain.HouseInfo;
import com.fc.flf.common.domain.HousePicInfo;
import com.fc.flf.common.domain.HouseStructureInfo;
import com.fc.flf.common.util.Page;
import com.fc.flf.portal.service.IHouseInfoService;
import com.fc.flf.portal.service.IHousePicInfoService;
import com.fc.flf.portal.service.IHousePriceService;
import com.fc.flf.portal.service.IHouseStructureInfoService;
import com.fc.flf.portal.service.IUserStudySaleHouseService;

@Controller
public class HousePicInfoController {

	@Resource
	private IHousePicInfoService housePicInfoService ;
	@Resource
	private IHouseInfoService houseInfoService;
	@Resource
	private IHouseStructureInfoService houseStructureInfoService;
	@Resource
	private IUserStudySaleHouseService userSaleHouseService;
	@Resource
	private IHousePriceService housePriceService;
		
	
	public void frameHouseInfoTop(int houseId,Model model,String read){
		HouseInfoController houseController = new HouseInfoController();
		houseController.setHouseInfoService(houseInfoService);
		houseController.setUserSaleHouserService(userSaleHouseService);
		houseController.setHousePriceService(housePriceService);
		houseController.framePlugin(houseId, model,read);
	}
	
	/**
	 * 楼盘详细-电子地图
	 * @param houseId
	 * @param picType
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/getHousePicInfoByType")
	public String getHousePicInfoById(int houseId,HttpServletRequest request,Model model){
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("houseId", houseId);
		map.put("picType", 0);
		List<HousePicInfo> pic = housePicInfoService.getHousePicInfoList(map);
		if(pic.size()!=0)
			model.addAttribute("map", pic.get(0).getPicPath());
		frameHouseInfoTop(houseId, model,"ditu");
		return "/portal/HouseMaps";
	}
	
	@RequestMapping(value="/showHouseInfoPhotoList")
	public String showPhotoList(int houseId,Model model){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("houseId", houseId);
		
		Page page = new Page();
		page.setCurPage(1);
		page.setPageSize(3);
		
		int[] types=new int[]{8,7,6,5,4,3,2,1};
		for (int i = 0; i < types.length; i++) {
			if (map.get("picType")!=null) {
				map.remove("map");	
			}
			
			map.put("picType", types[i]);
			map.put("picType"+types[i], housePicInfoService.getHousePicInfoListOnLimit(page,map));
		}
		HouseInfo houseInfo=houseInfoService.findHouseInfoById(houseId);
		int count=userSaleHouseService.getHouseSaleSum(houseId);
		model.addAttribute("houseInfo",houseInfo);
		model.addAttribute("map",map);
		model.addAttribute("count",count);
		model.addAttribute("types", types);
		frameHouseInfoTop(houseId, model, "picList");
		return "/portal/HouseInfoPhotoList";
	}
	
	@RequestMapping(value="/shouwPhotoInfo")
	public String showPhotoInfo(int houseId,int picType,Model model){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("houseId", houseId);
		map.put("picType", picType);
		map.put("start", 0);
		map.put("end", 3);
		List<HouseStructureInfo> houseStructureInfos = houseStructureInfoService.findStructureInfoByHouseId(map);
		HouseInfo houseInfo = houseInfoService.findHouseInfoById(houseId);
		int count=userSaleHouseService.getHouseSaleSum(houseId);
		model.addAttribute("houseInfo", houseInfo);
		model.addAttribute("count",count);
		model.addAttribute("photoList", houseStructureInfos);
		return "/portal/HousePhotoInfo";
	}
	
	@RequestMapping(value="/showHousePrepareList")
	public String prepareList(int houseId,Model model){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("houseId", houseId);
		
		Page page = new Page();
		page.setCurPage(1);
		page.setPageSize(3);
		
		int[] types=new int[]{9,10,11,12};
		for (int i = 0; i < types.length; i++) {
			if (map.get("picType")!=null) {
				map.remove("map");	
			}
			
			map.put("picType", types[i]);
			map.put("picType"+types[i], housePicInfoService.getHousePicInfoListOnLimit(page,map));
		}
		HouseInfo houseInfo=houseInfoService.findHouseInfoById(houseId);
		int count=userSaleHouseService.getHouseSaleSum(houseId);
		model.addAttribute("houseInfo",houseInfo);
		model.addAttribute("map",map);
		model.addAttribute("count",count);
		model.addAttribute("types", types);
		frameHouseInfoTop(houseId, model,"picPT");
		return "/portal/HousePrepareList";
	}
}
