package com.fc.flf.eagent.web;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fc.flf.common.domain.UserDaily;
import com.fc.flf.common.util.CommonUtil;
import com.fc.flf.common.util.Page;
import com.fc.flf.eagent.service.IUserDailyService;

@Controller
public class DailyController {
	
	@Autowired
	private IUserDailyService userDailyService;
	
	@RequestMapping(value = "/eagent_dailyHome")
	public String dailyHome(Model model,Page page) throws Exception{
		model.addAttribute("dailys", CommonUtil.toJson(userDailyService.findDailyByUserId(page)));
		model.addAttribute("pageCountOwn", page.getPageCount());
		model.addAttribute("friendDailys", CommonUtil.toJson(userDailyService.findFriendDaily(page)));
		model.addAttribute("count",userDailyService.getCount());
		model.addAttribute("friendDailyCount",userDailyService.getFriendDailyCount());
		return "/eagent/rizhiY04Home";
	}
	
	@RequestMapping("/eagent_saveDaily")
	public void saveDaily(UserDaily daily) throws Exception{
		userDailyService.saveDaily(daily);
	}
	
	@RequestMapping("/eagent_updateDaily")
	public void updateDaily(UserDaily daily) throws Exception{
		userDailyService.updateDaily(daily);
	}
	
	@ResponseBody
	@RequestMapping(value = "/eagent_dailyPage")
	public List<UserDaily> dailyPage(Page page)throws Exception{
		return userDailyService.findDailyByUserId(page);
	}
	
	@ResponseBody
	@RequestMapping(value = "/eagent_friendDailyPage")
	public List<UserDaily> friendDailyPage(Page page)throws Exception{
		return userDailyService.findFriendDaily(page);
	}
	
	@RequestMapping(value = "/eagent_uploadImage")
	@ResponseBody
    public String uploadImage(@RequestParam("file") MultipartFile mFile) throws IOException {
    	String url = CommonUtil.saveFile(mFile.getInputStream(), mFile.getOriginalFilename());
    	return url;
    }
	
	@RequestMapping(value = "/eagent_delImage")
    public void delImage(String fileName) throws IOException {
    	CommonUtil.delFile(fileName);
    }
	
//	@ResponseBody
	@RequestMapping(value = "/eagent_delDaily")
	@ModelAttribute("jsonValue")
	public List<UserDaily> delDaily(Page page,int id,Model model) throws Exception{
		userDailyService.delDaily(id);
		model.addAttribute("count", userDailyService.getCount()); 
		return userDailyService.findDailyByUserId(page);
	}
	
	@RequestMapping(value = "/eagent_findDailyByCusIdPage")
    @ResponseBody
    public List<UserDaily> findDailyByCusIdPage(Page page) throws Exception {
    	return userDailyService.findDailyByUserId(page);
    }
}
	
