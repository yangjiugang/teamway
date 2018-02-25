package com.fc.flf.portal.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fc.flf.common.domain.HouseDiscuss;
import com.fc.flf.common.domain.HouseInfo;
import com.fc.flf.common.util.Page;
import com.fc.flf.common.util.SessionInfo;
import com.fc.flf.portal.service.IHouseDiscussService;
import com.fc.flf.portal.service.IHouseInfoService;
import com.fc.flf.portal.service.IHousePriceService;
import com.fc.flf.portal.service.IUserStudySaleHouseService;

@Controller
public class HouseDiscussController {

	@Resource
	private IHouseDiscussService houseDiscussService;
	@Resource
	private IHouseInfoService houseInfoService;
	@Resource 
	private IUserStudySaleHouseService userSaleHouserService;
	@Resource
	private IHousePriceService housePriceService;
	
	@RequestMapping(value="/houseInfoRemark")
	public String showDiscussList(int houseId,int userType,String doRemark,HttpServletRequest request,Page page,Model model) throws Exception{
		Map<String, Object> map=new HashMap<String, Object>();
		
		List<HouseDiscuss> discussList=null;
		map.put("houseId", houseId);
		if(doRemark!=null && SessionInfo.getVisitorId(request)!=0){
			int index = SessionInfo.getVisitorType(request).lastIndexOf("_");
			String type = SessionInfo.getVisitorType(request).substring(index+1);
			userType=Integer.parseInt(type);
		}
		
		if(userType==0){			
			discussList=houseDiscussService.queryHouseDiscuss(page,houseId);
		}else{
			map.put("visitorType", userType);
			discussList=houseDiscussService.queryHouseDiscussByType(page,map);
		}
		discussList=repaleImgStr(discussList);	//检索字符串中 [img] 并替换成 <img>
		model.addAttribute("discussList", discussList);
		HouseInfo houseInfo = houseInfoService.findHouseInfoById(houseId);
		model.addAttribute("houseInfo", houseInfo);
		model.addAttribute("houseId", houseId);
		model.addAttribute("userType", userType);
		
		HouseInfoController controller = new HouseInfoController();
		controller.setHouseInfoService(houseInfoService);
		controller.setUserSaleHouserService(userSaleHouserService);
		controller.setHousePriceService(housePriceService);
		controller.framePlugin(houseId, model, "houseDiscuss");
		return "/portal/HouseInfoRemarkList";
	}
	
	@RequestMapping(value="/saveDiscuss")
	public String saveDiscuss(HouseDiscuss discuss,HttpServletRequest request,Model model) throws Exception{
		discuss.setVisitorId(SessionInfo.getVisitorId(request));
		int index = SessionInfo.getVisitorType(request).lastIndexOf("_");
		String type = SessionInfo.getVisitorType(request).substring(index+1);
		discuss.setVisitorType(Integer.parseInt(type));
		discuss.setVisitorName(SessionInfo.getVisitorName(request));
		
		houseDiscussService.saveDiscussByContent(discuss);
		return "redirect:/houseInfoRemark?houseId="+discuss.getHouseId()+"&userType="+discuss.getVisitorType()+"&curPage=1&pageSize=10";
	}
	
	private List<HouseDiscuss> repaleImgStr(List<HouseDiscuss> list){
		for (int i = 0; i < list.size(); i++) {
			if(list.get(i)!=null){
				HouseDiscuss discuss=list.get(i);
				if (discuss.getContent().indexOf("[")!=-1) {
					discuss.setContent(discuss.getContent().replaceAll("\\[", "<img src='images/face/"));
					discuss.setContent(discuss.getContent().replaceAll("\\]", "' />"));
					list.set(i, discuss);
				}
				
			}
		}
		
		return list;
	}
}
