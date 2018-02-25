package com.fc.flf.portal.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fc.flf.common.domain.HouseInfoDetail;
import com.fc.flf.portal.service.IHouseInfoDetailService;

@Controller
public class HouseInfoDetailController {

	@Resource
	private IHouseInfoDetailService houseInfoDetailService;
	
	@RequestMapping(value="/getHouseInfoDetailById")
	public String getHouseInfoDetailById(int houseId,Model model){
		HouseInfoDetail houseInfoDetail = houseInfoDetailService.findHouseInfoDetailById(houseId);
		model.addAttribute("houseInfoDetail", houseInfoDetail);
		return "/portal/Index";
	}
}
