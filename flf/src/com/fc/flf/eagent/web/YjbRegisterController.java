package com.fc.flf.eagent.web;
import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fc.flf.common.domain.FcSysVisitor;
import com.fc.flf.common.util.CommonUtil;
import com.fc.flf.common.util.MD5;
import com.fc.flf.common.util.StringUtils;
import com.fc.flf.common.util.mail.MailActivateYjb;
import com.fc.flf.eagent.service.IYjbRegisterService;

@Controller
public class YjbRegisterController {

	@Resource
	private IYjbRegisterService yjbregisterService;
	
	@RequestMapping(value = "/yjbregister")
	public String register() {
		return "/eagent/YjbRegister";
	}
	@RequestMapping(value = "/yjbregisterAdd")
	public String registerAdd(Model model,FcSysVisitor fcSysVisitor) {
		MailActivateYjb ma = new MailActivateYjb();
		fcSysVisitor.setLoginTime(new Date());
		fcSysVisitor.setLoginIp(CommonUtil.getRequest().getRemoteHost());
		System.out.println(CommonUtil.getRequest().getRemoteHost());
		fcSysVisitor.setVisitorType("ROLE_0");
		fcSysVisitor.setVisitorStatus(0);
		fcSysVisitor.setRegisterTime(new Date());
		fcSysVisitor.setExpriedDate(new Date());
		boolean result = validationRegister(model,fcSysVisitor);
		if(result){
			fcSysVisitor.setVisitorPassword(MD5.MD5Encoder(fcSysVisitor.getVisitorPassword())); //密码加密
			int temp = yjbregisterService.insert(fcSysVisitor);
			if(temp>0){
				ma.SingleSend(StringUtils.encrypt(fcSysVisitor.getEmail())); //发送邮件激活账户
				model.addAttribute("mail",fcSysVisitor.getEmail());
				return "/eagent/Register-YouXiang";			
			}else{
				return "/eagent/error";
			}			
		}else{
			return "/eagent/YjbRegister";
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
	
	@RequestMapping(value = "/yjbmailverify")
	public String findPassword(String key){
		yjbregisterService.updateVisitorStatus(StringUtils.decrypt(key));
		return "/eagent/Register-Wancheng";
	}
	@RequestMapping(value = "/yjbverify")
	@ResponseBody
	public int verify(String visitorName){
		return yjbregisterService.verify(visitorName) > 0 ? 1 : 0;		
	}
	
	@RequestMapping(value = "/yjbverifyEmail")
	@ResponseBody
	public int verifyEmail(String email){
		return yjbregisterService.verifyEmail(email) > 0 ? 1 : 0;		
	}
	
	@RequestMapping(value = "/yjbverifyPhone")
	@ResponseBody
	public int verifyPhone(String phone){
		return yjbregisterService.verifyPhone(phone) > 0 ? 1 : 0;		
	}
}
