package com.fc.flf.fparty.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fc.flf.common.domain.CustomerInfo;
import com.fc.flf.common.domain.FcSysVisitor;
import com.fc.flf.common.exception.FLFBizException;
import com.fc.flf.common.util.IDCardVerify;
import com.fc.flf.fparty.service.impl.CustomerInfoServiceImpl;

@Controller
public class CustomerInfoController {
	@Resource
	private CustomerInfoServiceImpl customerInfoServiceImpl;
	
	@RequestMapping(value="/updateCustomerInfoPartOne")
	@ResponseBody
	public CustomerInfo updateCustomerInfoPartOne (Model model,CustomerInfo customerInfo)throws Exception{
		if(customerInfo.getName()==null){
			throw new FLFBizException("姓名必须填写");
		}
		if(customerInfo.getName().length()>8){
			throw new FLFBizException("姓名长度不能大于八个字符");
		}
		if(customerInfo.getFcSysVisitor().getSex()!=1 & customerInfo.getFcSysVisitor().getSex()!=0){
			throw new FLFBizException("请选择正确的性别");
		}
		customerInfoServiceImpl.updateCustomerInfoPartOne(customerInfo);
		return customerInfoServiceImpl.findCustomerInfo(customerInfo.getCustomerId());
	}
	
	@RequestMapping(value="/updateCustomerInfoPartTwo")
	@ResponseBody
	public CustomerInfo updateCustomerInfoPartTwo(CustomerInfo customerInfo)throws Exception{
		String regexPostNum="/^(P\\d{7})|(G\\d{8})$/";
		if(customerInfo.getIdType()!=1 & customerInfo.getIdType()!=0){
			throw new FLFBizException("请选择正确的证件类型");
		}
		if(customerInfo.getIdNum()==null){
			throw new FLFBizException("证件号码必须填写");
		}
		if(customerInfo.getIdType()==1){
			if(!IDCardVerify.isValid(customerInfo.getIdNum())){
				throw new FLFBizException("请输入正确的身份证号码");
			}
		}
		if(customerInfo.getIdType()==0){
			if(!customerInfo.getIdNum().matches(regexPostNum)){
				throw new FLFBizException("请输入正确的护照号码");
			}
		}
		customerInfoServiceImpl.updateCustomerInfoPartTwo(customerInfo);
		return customerInfoServiceImpl.findCustomerInfo(customerInfo.getCustomerId());
	}
	
	@RequestMapping(value="/updateVisitorInfo")
	@ResponseBody
	public CustomerInfo updateVisitorInfo(FcSysVisitor fcSysVisitor)throws Exception{
		String regexEmail="/^([a-zA-Z0-9]+[_|\\_|\\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\\_|\\.]?)*[a-zA-Z0-9]+\\.[a-zA-Z]{2,3}$/";
		String regexPhone="/^0?(13[0-9]|15[012356789]|18[0236789]|14[57])[0-9]{8}$/";
		if(fcSysVisitor.getEmail()==null){
			throw new FLFBizException("邮箱必须填写");
		};
		if(fcSysVisitor.getEmail().matches(regexEmail)){
			throw new FLFBizException("请填定正确的邮箱");
		};
		if(fcSysVisitor.getPhone()==null){
			throw new FLFBizException("手机号必须填写");
		};
		if(fcSysVisitor.getEmail().matches(regexPhone)){
			throw new FLFBizException("请填定正确的手机号");
		};
		customerInfoServiceImpl.updateFcSysVisitorInfo(fcSysVisitor);
		return  customerInfoServiceImpl.findCustomerInfo(fcSysVisitor.getVisitorId());
	}
}
