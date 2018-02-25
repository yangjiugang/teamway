package com.fc.flf.portal.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fc.flf.common.domain.FcSysAd;
import com.fc.flf.common.domain.HouseGroupInfo;
import com.fc.flf.common.util.CommonUtil;
import com.fc.flf.common.util.CookieUnit;
import com.fc.flf.common.util.Page;
import com.fc.flf.portal.service.IFcSysAdService;
import com.fc.flf.portal.service.ILineSetMealService;

@Controller
public class HotLineController {

	@Resource
	private ILineSetMealService lss;
	
	@Resource
	private IFcSysAdService fsas;
	
	@RequestMapping(value = "/hotline")
	public String newline(Page page, Model model) {
		page.setRowCount(lss.getTotalCount());
		List<HouseGroupInfo> hgList = lss.getAllHouseGroupInfo(page);
		List<FcSysAd> Advertisements = fsas.findAdvertisementByType(14);
		List<HouseGroupInfo> newGroups = lss.getRecentOpenHouseGroupInfo();
		List<HouseGroupInfo> JJRHG = lss.getEconomicManHouseGroup();
		model.addAttribute("lineSetMealList", hgList);
		model.addAttribute("Advertisements", Advertisements);
		model.addAttribute("newGroups", newGroups);
		model.addAttribute("browsers",lss.RecentBrowsersTouristGroup());
		model.addAttribute("collectHotLine",lss.getCollectTouristGroup()); 
		model.addAttribute("economicManHouseGroup",JJRHG);
		return "forward:hotlineRecommend";
	}
	@RequestMapping(value = "/hotlineRecommend")
	public String hotLineRecommend(Model model){
		List<HouseGroupInfo> hlnList = lss.getHotLineRecommend();
		model.addAttribute("hotlineRecommends",hlnList);
		return "/portal/HotLine";
	}
	
	/**
	 * 进入旅游线路详细页面
	 * @param model
	 * @param houseGroupId
	 * @return
	 */
	@RequestMapping(value="/TravelInfo")
	public String TravelInfo(Model model,int houseGroupId,HttpServletResponse response){
		List<HouseGroupInfo> travelInfoList = lss.getTravelPage(houseGroupId);
		CookieUnit.addCookie(response, "houseGroup",CookieUnit.
				buildViewHistory(CommonUtil.getRequest(),houseGroupId,"houseGroup"), 30*24*60*60);
		lss.saveVisitorSkimHouseGroup(houseGroupId);
		HouseGroupInfo houseGroupInfo = new HouseGroupInfo();
		houseGroupInfo.setHouseGroupId(travelInfoList.get(0).getHouseGroupId());
		houseGroupInfo.setGroupName(travelInfoList.get(0).getGroupName());
		houseGroupInfo.setPicPath(travelInfoList.get(0).getPicPath());
		houseGroupInfo.setGroupLineDesc(travelInfoList.get(0).getGroupLineDesc());
		houseGroupInfo.setGroupStartDate(travelInfoList.get(0).getGroupStartDate());		
		houseGroupInfo.setGroupDeadlineDate(travelInfoList.get(0).getGroupDeadlineDate());
		houseGroupInfo.setGroupDuration(travelInfoList.get(0).getGroupDuration());
		houseGroupInfo.setGroupPrice(travelInfoList.get(0).getGroupPrice());
		houseGroupInfo.setGroupHotline(travelInfoList.get(0).getGroupHotline());
		houseGroupInfo.setHousePurpose(travelInfoList.get(0).getHousePurpose());
		houseGroupInfo.setHouseProperties(travelInfoList.get(0).getHouseProperties());
		houseGroupInfo.setLineProperties(travelInfoList.get(0).getLineProperties());
		houseGroupInfo.setAttentionCnt(travelInfoList.get(0).getAttentionCnt());
		houseGroupInfo.setJoinCnt(travelInfoList.get(0).getJoinCnt());
		houseGroupInfo.setGroupDesc(travelInfoList.get(0).getGroupDesc());
	
		model.addAttribute("HouseGroupScheduleHouseSize",travelInfoList.get(0).getHouseGroupScheduleList().get(0).getHouseGroupScheduleHouseList().size());
		model.addAttribute("HouseGroupInfo", houseGroupInfo);
		model.addAttribute("travelInfoList", travelInfoList);
		return "/portal/Line";
	}
	
	/**
	 * 线路套餐搜索
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/search")
	public String searchHouseGroupInfo(Model model,HouseGroupInfo houseGroupInfo,Page page,String isExpand){
		model.addAttribute("searchHouseGroupInfos", lss.getSearchHouseGroupInfo(houseGroupInfo,page));
		if(isExpand==null){
			isExpand="none";
		}
		model.addAttribute("isExpand",isExpand);
		model.addAttribute("houseGroupInfoCon",houseGroupInfo);
		model.addAttribute("count", lss.getSearchHouseGroupInfoCount(houseGroupInfo));
		return "/portal/Monopolyofsale(L)";
	}
	@RequestMapping(value = "/aaa")
	public String hotline() {
		return "/portal/HotLine";
	}

}
