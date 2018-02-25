package com.fc.brms.deactivated.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class lZGLController {
	
	@RequestMapping(value="/DimissionUserLeft")
	public String lzgl(){
		return "/deactivated/DimissionUserLeft";
	}
	@RequestMapping(value="/lz")
	public String lz(){
		return "/deactivated/lz";
	}
	
	@RequestMapping(value="/dTianjiadiaochahuodong")
	public String Tianjiadiaochahuodong(){
		return "/deactivated/Tianjiadiaochahuodong";
	}
	
	@RequestMapping(value="/YG_Administration_YGXXZL")
	public String YG_Administration_YGXXZL(String userId){
		String[] userIds=userId.split(",");
		System.out.println(userIds);
		return "/deactivated/YG_Administration_YGXXZL";
	}
	
	@RequestMapping(value="/mianshijiaoliujilu")
	public String mianshijiaoliujilu(){
		return "/deactivated/mianshijiaoliujilu";
	}
	
	@RequestMapping(value="/Mianshitongzhi")
	public String Mianshitongzhi(){
		return "/deactivated/Mianshitongzhi";
	}
	
	@RequestMapping(value="/Ruzhitongzhi")
	public String Ruzhitongzhi(){
		return "/deactivated/Ruzhitongzhi";
	}
	
	@RequestMapping(value="/jieriwenhou")
	public String jieriwenhou(Model model,int userId,String userName){
		model.addAttribute("userId", userId);
		model.addAttribute("userName", userName);
		return "/deactivated/jieriwenhou";
	}
	
	@RequestMapping(value="/shengriguanhuai")
	public String shengriguanhuai(){
		return "/deactivated/shengriguanhuai";
	}
}
