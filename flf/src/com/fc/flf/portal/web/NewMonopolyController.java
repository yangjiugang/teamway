package com.fc.flf.portal.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fc.flf.common.domain.FcSysAd;
import com.fc.flf.common.domain.HouseInfo;
import com.fc.flf.common.util.Page;
import com.fc.flf.portal.service.IFcSysAdService;
import com.fc.flf.portal.service.IHouseInfoService;

@Controller
public class NewMonopolyController {

	@Resource
	private IFcSysAdService fsas;
	@Resource
	private IHouseInfoService his;
	@Resource
	private IHouseInfoService houseInfoService;
	
	@RequestMapping(value = "/newmonopoly")
    public String newmonopoly(Page page,Model model) throws Exception {
		List<FcSysAd> Advertisements = fsas.findFcSysAdByTypeWithHouseInfo(13);
		List<HouseInfo> newHouses = his.findHouseInfoWithDetail();
		model.addAttribute("Advertisements", Advertisements);
		model.addAttribute("newHouses", newHouses);
		model.addAttribute("newHouseList", houseInfoService.findNewHouseList(page));
		model.addAttribute("history",houseInfoService.findRecentBrowsers());
		model.addAttribute("collectHouses", houseInfoService.findCollectHouse());
		model.addAttribute("attentionHouseInfos", houseInfoService.attentionHouseInfos());
		model.addAttribute("fangMishuAttentions", houseInfoService.fangMishuAttention());
        return "/portal/NewMonopoly";
    }
}
