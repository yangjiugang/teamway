package com.fc.brms.common.web;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fc.brms.common.domain.CfgCompany;
import com.fc.brms.common.service.ICommonMailService;
import com.fc.brms.common.util.SessionInfo;
import com.fc.brms.common.util.mail.SimpleMail;
import com.fc.brms.common.util.mail.SimpleMailSender;

/**
 * 发公共邮件
 * 
 * @author songp
 * @version 1.0 2012-03-31
 */

@Controller
public class CommonMailController {

	private static Log logger = LogFactory.getLog(CommonMailController.class);
	
	@Autowired
	private ICommonMailService mailService;
	
	
	/**
	 * 编辑邮件
	 * @param rows 发送内容行数
	 * @param title 邮件抬头
	 * @param types 类型
	 * @param listId tableID
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/editCommonMail")
	public String questionTestPage(@RequestParam String rows,@RequestParam String title,
			@RequestParam String types,@RequestParam String listId,HttpServletRequest request, Model model) {
		model.addAttribute("rowIds", rows);
		model.addAttribute("emailTitle", title);
		model.addAttribute("types", types);
		model.addAttribute("listId", listId);
		return "/common/CommonMail";
	}

	
	/**
	 * 发送邮件
	 * @param emaillist 邮件列表
	 * @param emailTitle 邮件抬头
	 * @param tablevalues 发送内容
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/sendCommonMail")
	public String sendEmail(@RequestParam String emaillist,@RequestParam String emailTitle, @RequestParam String tablevalues,
			HttpServletRequest request, Model model) {
		model.addAttribute("emaillist", emaillist);
		SimpleMail sm = new SimpleMail();
		sm.setSubject(emailTitle);
		sm.setContent(tablevalues);
		String[] emails = emaillist.split(";");
		try {
			for (String mail : emails) {
				CfgCompany companyInfo = mailService.selectCompanyEmailById(SessionInfo.getCompanyId(request));
				SimpleMailSender sms = new SimpleMailSender(companyInfo.getCompanyEmail(),"123456abcd");
				sms.send(mail, sm);
			}
			model.addAttribute("flag", true);
		} catch (AddressException e) {
			if(logger.isErrorEnabled()){
				logger.equals(e);
			}
			model.addAttribute("flag", false);
		} catch (MessagingException e) {
			if(logger.isErrorEnabled()){
				logger.equals(e);
			}
			model.addAttribute("flag", false);
		} catch (Exception e) {
			if(logger.isErrorEnabled()){
				logger.equals(e);
			}
			model.addAttribute("flag", false);
		} 
		return "/common/CommonMail";
	}
}
