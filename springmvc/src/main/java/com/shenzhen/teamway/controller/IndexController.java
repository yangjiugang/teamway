package com.shenzhen.teamway.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	
	private Logger Logger  = LoggerFactory.getLogger(getClass());

	@RequestMapping(value = "/hello.html")
	public String hello() {
		return "hello";
	}
	
	@RequestMapping(value = "/camel-tweet.html")
	public String index() {
		return "index";
	}
	
	@RequestMapping(value = "/mySocket.html")
	public String mySocket() {
		Logger.info("----------------------进入方法：--------------------------");
		return "/webSocket/webSocket";
	}
}
