package com.fc.flf.fparty.web;
import java.io.UnsupportedEncodingException;
import java.util.Date;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fc.flf.common.domain.FcSysVisitor;
import com.fc.flf.common.util.CommonUtil;
import com.fc.flf.common.util.MD5;
import com.fc.flf.common.util.StringUtils;
import com.fc.flf.common.util.mail.MailActivate;
import com.fc.flf.fparty.service.IRegisterService;

@Controller
public class RegisterController {

	private static Log logger = LogFactory.getLog(FPaytyController.class);
	@Resource
	private IRegisterService registerService;
	
	@RequestMapping(value = "/register")
	public String register() {
		return "/fparty/Register";
	}
	@RequestMapping(value = "/registerAdd")
	public String registerAdd(Model model,FcSysVisitor fcSysVisitor) throws UnsupportedEncodingException {
		MailActivate ma = new MailActivate();
		fcSysVisitor.setLoginTime(new Date());
		fcSysVisitor.setLoginIp(CommonUtil.getRequest().getRemoteHost());
		System.out.println(CommonUtil.getRequest().getRemoteHost());
		fcSysVisitor.setVisitorType("ROLE_1");
		fcSysVisitor.setVisitorStatus(0);
		fcSysVisitor.setRegisterTime(new Date());
		fcSysVisitor.setExpriedDate(new Date());
		boolean result = validationRegister(model,fcSysVisitor);
		if(result){
			fcSysVisitor.setVisitorPassword(MD5.MD5Encoder(fcSysVisitor.getVisitorPassword())); //密码加密
			int temp = registerService.insert(fcSysVisitor);			
			if(temp>0){				
				ma.SingleSend(StringUtils.encrypt(fcSysVisitor.getEmail())); //发送邮件激活账户
				model.addAttribute("mail",fcSysVisitor.getEmail());
				return "/fparty/Register-YouXiang";			
			}else{
				return "/fparty/error";
			}
		}else{
			model.addAttribute("fcSysVisitor",fcSysVisitor);
			return "/fparty/Register";
		}
	}
	
	/**
	 * 注册信息验证
	 * @param model
	 * @param fcSysVisitor
	 * @return
	 */
	public boolean validationRegister(Model model,FcSysVisitor fcSysVisitor){
		boolean result = true;
		//用户名验证
		if(fcSysVisitor.getVisitorName()==null||fcSysVisitor.getVisitorName()==""){
			result = false;
			model.addAttribute("verifyName","用户名不能为空");
			return result;
		}else{
			result = true;
			model.addAttribute("verifyName","");
		}
		if(verify(fcSysVisitor.getVisitorName())==1){
			result = false;
			model.addAttribute("verifyName","用户名已存在");
			return result;
		}else{
			result = true;
			model.addAttribute("verifyName","");
		}
		//密码验证
		if(fcSysVisitor.getVisitorPassword()==null || fcSysVisitor.getVisitorPassword()==""){
			result = false;
			model.addAttribute("verifyPassword","密码不能为空");
			return result;
		}else{
			result = true;
			model.addAttribute("verifyPassword","");
		}
		if(fcSysVisitor.getVisitorPassword().length()<6){
			result = false;
			model.addAttribute("verifyPassword","密码最少6个字符，最长不得超过14个字符");
			return result;
		}else{
			result = true;
			model.addAttribute("verifyPassword","");
		}
		//firstName验证
		if(fcSysVisitor.getFirstName()==""||fcSysVisitor.getFirstName()==null){
			result = false;
			model.addAttribute("verifyFirstName","请输入姓氏");
			return result;
		}else{
			result = true;
			model.addAttribute("verifyFirstName","");
		}
		//email验证
		if(fcSysVisitor.getEmail()==null||fcSysVisitor.getEmail()==""){
			result = false;
			model.addAttribute("verifyEmail","请输入有效的邮件地址");
			return result;
		}else{
			result = false;
			model.addAttribute("verifyEmail","");
		}
		String regexpEmail ="/^([a-zA-Z0-9]+[_|\\_|\\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\\_|\\.]?)*[a-zA-Z0-9]+\\.[a-zA-Z]{2,3}$/"; 
		if((fcSysVisitor.getEmail().matches(regexpEmail))){
			result = false;
			model.addAttribute("verifyEmail","邮件格式不正确");
			return result;
		}else{
			result = true;
			model.addAttribute("verifyEmail","");
		}
		if(verifyEmail(fcSysVisitor.getEmail())==1){
			result = false;
			model.addAttribute("verifyEmail","此邮箱已被注册");
			return result;
		}else{
			result = true;
			model.addAttribute("verifyEmail","");
		}
		//手机验证
		if(fcSysVisitor.getPhone()=="" ||fcSysVisitor.getPhone()==null){
			result = false;
			model.addAttribute("verifyPhone","手机号码不能为空");
			return result;
		}else{
			result = true;
			model.addAttribute("verifyPhone","");
		}
		String regexPhone = "/^0{0,1}(13[0-9]|15[7-9]|153|156|18[7-9])[0-9]{8}$/";
		if((fcSysVisitor.getPhone().matches(regexPhone))){
			result = false;
			model.addAttribute("verifyPhone","手机号码格式不正确");
			return result;
		}else{
			result = true;
			model.addAttribute("verifyPhone","");
		}
		if(verifyPhone(fcSysVisitor.getPhone())==1){
			result = false;
			model.addAttribute("verifyPhone","此手机号码已被注册");
			return result;
		}else{
			result = true;
			model.addAttribute("verifyPhone","");
		}
		return result;
	}
	
	@RequestMapping(value = "/mailverify")
	public String mailVerify(String key){		
		registerService.updateVisitorStatus(StringUtils.decrypt(key));
		return "/fparty/Register-Wancheng";
	}
	@RequestMapping(value = "/verify")
	@ResponseBody
	public int verify(String visitorName){
		return registerService.verify(visitorName) > 0 ? 1 : 0;		
	}
	
	@RequestMapping(value = "/verifyEmail")
	@ResponseBody
	public int verifyEmail(String email){
		return registerService.verifyEmail(email) > 0 ? 1 : 0;		
	}
	
	@RequestMapping(value = "/verifyPhone")
	@ResponseBody
	public int verifyPhone(String phone){
		return registerService.verifyPhone(phone) > 0 ? 1 : 0;		
	}
}
