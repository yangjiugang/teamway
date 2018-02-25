package com.fc.flf.portal.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fc.flf.common.domain.FcSysAd;
import com.fc.flf.common.domain.HouseInfo;
import com.fc.flf.common.util.Page;
import com.fc.flf.portal.service.IAbroadPurchaseService;
import com.fc.flf.portal.service.IFcSysAdService;

@Controller
public class AboardPurchaseController {
	@Resource
	private IFcSysAdService fsas;
	@Resource
	private IAbroadPurchaseService aps;
 
	@RequestMapping(value = "/abroad")
    public String abroad(Model model,Page page) {
		List<FcSysAd> Advertisements = fsas.findFcSysAdByTypeWithHouseInfo(15);
		page.setRowCount(aps.getCountAbraod());
		List<HouseInfo> hiList = aps.getAllAbroad(page);
		model.addAttribute("houseInfoList", hiList);
		model.addAttribute("Advertisements", Advertisements);
		
        return "forward:hotHousesRecommend";
    }
	@RequestMapping(value="hotHousesRecommend")
	public String HotHousesRecommend(Model model){
		List<HouseInfo> list = aps.getHotHousesName();
		model.addAttribute("hotHouses",list);
		return "/portal/AbroadPurchase";
	}
}
