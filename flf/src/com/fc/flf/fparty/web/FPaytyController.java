package com.fc.flf.fparty.web;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FPaytyController {

	private static Log logger = LogFactory.getLog(FPaytyController.class);

	@RequestMapping(value = "/toflogin")
	public String index() {
		return "/fparty/FLogin";
	}	
	
}
