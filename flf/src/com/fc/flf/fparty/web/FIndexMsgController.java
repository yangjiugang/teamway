package com.fc.flf.fparty.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fc.flf.common.domain.FcSysMsg;
import com.fc.flf.common.domain.UserMsg;
import com.fc.flf.common.util.Page;
import com.fc.flf.eagent.service.IFcSysMsgService;
import com.fc.flf.eagent.service.IUserMsgService;

@Controller
public class FIndexMsgController {
	@Resource
	private IUserMsgService	userMsgService;
	@Resource
	private IFcSysMsgService fcSysMsgService;
	
	@RequestMapping(value = "/fIndexSysMsg")
	@ModelAttribute("datas")
	public List<FcSysMsg> forSysMsg(Page page,int msgSendType){
		int sysSendMsgCount=fcSysMsgService.findMsgCountByMsgType(msgSendType);
		page.setRowCount(sysSendMsgCount);
		List<FcSysMsg> sysSendMsg=fcSysMsgService.findMsgByMsgType(msgSendType, page.getLimit());
		return sysSendMsg;
	}
	
	@RequestMapping(value = "/fIndexUserMsg")
	@ModelAttribute("datas")
	public List<UserMsg> forUserMsg(Page page,int customerId,int msgType){
		int sysSendMsgCount=userMsgService.findMsgCountByMsgType(customerId, msgType);
		page.setRowCount(sysSendMsgCount);
		if(page.getCurPage()>page.getPageCount()){
			if(page.getPageCount()>0){
				page.setCurPage(page.getCurPage()-1);	
			}
		}
		List<UserMsg> sysSendMsg=userMsgService.findMsgByMsgType(customerId, msgType, page.getLimit());
		return sysSendMsg;
	}
	
	@RequestMapping(value = "/fIndexFengMsg")
	@ModelAttribute("datas")
	public List<UserMsg> forFengMsg(Page page,int customerId){
		int sysSendMsgCount=userMsgService.findMsgCount(customerId);
		page.setRowCount(sysSendMsgCount);
		if(page.getCurPage()>page.getPageCount()){
			if(page.getPageCount()>0){
				page.setCurPage(page.getCurPage()-1);	
			}
			
		}
		List<UserMsg> sysSendMsg=userMsgService.findMsgSendByFeng(customerId, page.getLimit());
		return sysSendMsg;
	}
	
	@RequestMapping(value = "/fIndexDelUserMsg")
	@ResponseBody
	public int delUserMsg(int msgId){
		userMsgService.delMsg(msgId);
		return 1;
	}
	
	@RequestMapping(value = "/fIndexDelSysMsg")
	@ResponseBody
	public int delFcSysMsg(int msgId){
		return 1;
	}
}
