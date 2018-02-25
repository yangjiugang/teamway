package com.fc.flf.account.web;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fc.flf.account.service.ILoginService;
import com.fc.flf.common.domain.FcSysVisitor;
import com.fc.flf.common.util.Codec;
import com.fc.flf.common.util.Constants;
import com.fc.flf.common.util.MD5;
import com.fc.flf.common.util.mail.SimpleMail;
import com.fc.flf.common.util.mail.SimpleMailSender;
import com.fc.flf.common.web.BaseController;

@Controller
public class FindPasswordController extends BaseController {
	
	private static Log logger = LogFactory.getLog(FindPasswordController.class);
	
	private final static String URL = "http://localhost:8080/flf/findPassword?key=";
	
	@Autowired
	private ILoginService loginService;

	@RequestMapping(value = "/forgetPassword")
	public String forgetPassword(HttpServletRequest request) {

		String login_type = request.getParameter("lt");

		if (login_type.equals("0")) {
			return "/eagent/EFindPassword";
		} else {
			return "/fparty/FFindPassword";
		}

	}
	
	/**
	 * 发送密码重置确认邮件
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/sendResetPWDEmail")
	public String sendResetPWDEmail(HttpServletRequest request, Model model) {
		
		String email = request.getParameter("email");
		model.addAttribute("email", email);
		FcSysVisitor visitor = loginService.checkEmail(email);
		if(visitor != null){
			String visitor_type = visitor.getVisitorType();
			try {
				//send email;
				String encodedEmail = Codec.encode(email);
				String link = URL+encodedEmail;
				SimpleMail sm=new SimpleMail();
				sm.setSubject("房立方--找回密码邮件");
				sm.setContent("亲爱的用户！<br> 感谢您使用密码找回服务。请点击下面链接。<br> <a href="+link+">"+link+"</a> <br>如果链接无法打开浏览器窗口，请直接复制上述地址到浏览器地址栏中打开。");
				SimpleMailSender sms=new SimpleMailSender("szfanglifang@163.com","123456abcd");
				sms.send(email, sm);
			} catch(MessagingException me){
				logger.error(me);
				addErrorMsg(model, "FLF-0705");
				if(visitor_type.equals(Constants.ROLE_FPARTY)){
					return "/fparty/FFindPassword";
				}else{
					return "/eagent/EFindPassword";
				}
			} catch (Exception e) {
				logger.error(e);
				addErrorMsg(model, "FLF-0704");
				if(visitor_type.equals(Constants.ROLE_FPARTY)){
					return "/fparty/FFindPassword";
				}else{
					return "/eagent/EFindPassword";
				}
			}
			if(visitor_type.equals(Constants.ROLE_FPARTY)){
				return "/fparty/FIdentifyChecked";
			}else{
				return "/eagent/EIdentifyChecked";
			}
			
		}else{
			addErrorMsg(model, "FLF-0703");
			return "/fparty/FFindPassword";
		}
	}

	@RequestMapping(value = "/findPassword")
	public String findPassword(HttpServletRequest request,Model model) throws Exception{
		String encodedEmail = request.getParameter("key");
		model.addAttribute("email",encodedEmail);
		String email = Codec.decode(encodedEmail);
		FcSysVisitor visitor = loginService.checkEmail(email);
		String visitor_type = visitor.getVisitorType();
		model.addAttribute("visitor_type",visitor_type);
		if(visitor_type.equals(Constants.ROLE_FPARTY)){
			return "/fparty/FResetPassword";
		}else{
			return "/eagent/EResetPassword";
		}
	}
	
	@RequestMapping(value = "/resetPassword")
	public String resetPassword(HttpServletRequest request) throws Exception{
		String encodedEmail = request.getParameter("email");
		String visitor_type = request.getParameter("visitor_type");
		String visitorPassword = request.getParameter("password");
		String email = Codec.decode(encodedEmail);
		FcSysVisitor visitor = new FcSysVisitor();
		visitor.setEmail(email);
		visitor.setVisitorPassword(MD5.MD5Encoder(visitorPassword));
		loginService.updateUserPassword(visitor);
		if(visitor_type.equals(Constants.ROLE_FPARTY)){
			return "/fparty/FResetPasswordSucceed";
		}else{
			return "/eagent/EResetPasswordSucceed";
		}
	}
}
