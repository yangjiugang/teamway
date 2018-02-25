package com.fc.flf.fparty.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fc.flf.common.domain.EventInfoCustomer;
import com.fc.flf.common.domain.HouseDiscuss;
import com.fc.flf.common.util.Page;
import com.fc.flf.common.util.SessionInfo;
import com.fc.flf.fparty.service.IEventInfoCustomerService;
import com.fc.flf.portal.service.IHouseDiscussService;

@Controller
public class PinglunController {

	@Resource
	private IHouseDiscussService houseDiscussService;
	@Resource
	private IEventInfoCustomerService eventInfoCustomerService;
	@Resource
	private FPublicNoticeForData fPublicNoticeForData;	
	@Resource
	private UserInfoAndMsgCountForData userInfoAndMsgCountForData;
	
	@RequestMapping(value="/pinglun")
	public String jumpPinglun(String frameName,HttpServletRequest request,Model model) throws Exception{
		
		int visitorId = SessionInfo.getVisitorId(request);
		int count=houseDiscussService.queryCountDiscussByUser(visitorId);
		
		Page page=new Page();
		page.setCurPage(1);
		page.setPageSize(6);
		page.setRowCount(count);
		
		model.addAttribute("houseId", 1);
		model.addAttribute("frameName", frameName);
		model.addAttribute("page", page);
		model.addAttribute("count", count);
		fPublicNoticeForData.addDataToModel(model);
		userInfoAndMsgCountForData.addDataToModel(model, request);
		return "/fparty/Pinglun";
	}
	
	@RequestMapping(value="/frame")
	public String frameDiscuss(String frameName,Page page,HttpServletRequest request,Model model) throws Exception{
		int visitorId = SessionInfo.getVisitorId(request);
		Map<String, Object> map=new HashMap<String, Object>();
		int count=-1;
		model.addAttribute("frameName", frameName);
		if(frameName.equals("houseDiscuss")){
			
			List<HouseDiscuss> discussList=houseDiscussService.queryHouseDiscussByUser(page,visitorId);
			discussList=repaleImgStr(discussList);
			model.addAttribute("discussList", discussList);
			
			return "/fparty/FrameHouseDiscuss";
		}else if(frameName.equals("eventInfo")){
			count=eventInfoCustomerService.findEventRemarkCountById(visitorId);
			page.setRowCount(count);
			map.put("cusId", visitorId);
			map.put("start", (page.getCurPage() - 1) * page.getPageSize());
			map.put("end", page.getPageSize());
			List<EventInfoCustomer> eICustomerList = eventInfoCustomerService.findEventRemarkByIdToPage(map);
			model.addAttribute("eICustomerList", eICustomerList);
			
			return "/fparty/EventInfoCustomer";
		}else{
			return "/fparty/FrameHouseDiscuss";
		}
		
		
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
