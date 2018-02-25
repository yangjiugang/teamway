package com.fc.flf.fparty.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.fc.flf.fparty.service.IEventInfoService;
@Controller
public class EventInfoController{
 
	@Autowired
	private IEventInfoService iEventInfoService;
    
    @RequestMapping(value = "/huodong")
    public String list(Model model) {
    	
        return "/fparty/jiaoyi";
    }
}

