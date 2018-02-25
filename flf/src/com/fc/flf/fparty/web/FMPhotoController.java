package com.fc.flf.fparty.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.fc.flf.common.domain.CustomerInfo;
import com.fc.flf.common.domain.UserInfo;
import com.fc.flf.common.util.SessionInfo;
import com.fc.flf.eagent.web.TheUserPhotoUitl;
import com.fc.flf.fparty.service.ICustomerInfoService;
import com.fc.flf.fparty.service.impl.CustomerInfoServiceImpl;

@Controller
public class FMPhotoController {
	@Autowired
	private TheUserPhotoUitl theUserPhotoUitl;
	@Resource
	private ICustomerInfoService customerInfoService;
	
	@RequestMapping(value ="/Y611WDFMXiangce")	
	public ModelAndView Y611WDFMXiangce(HttpServletRequest request) throws Exception{
		// 访问者ID
		int cusId = SessionInfo.getVisitorId(request);
		System.out.println("this come");
		ModelAndView view = new ModelAndView("/fparty/Y611WDFMXiangce");
		theUserPhotoUitl.PhotoSet(view, cusId);
		return view;
	} 

	@RequestMapping(value ="/Y611WDFMXiangceLB")	
	public ModelAndView Y611WDFMXiangceLB(CustomerInfo customer,String setName){
		UserInfo userInfo=customerInfoService.findUserInfo(customer);
		ModelAndView view = new ModelAndView("/fparty/Y611WDFMXiangceLB");	
		theUserPhotoUitl.PhotoAll(view, userInfo, setName);
		return view;
	}

	@RequestMapping(value ="/Y611WDFMXiangxi")
	public ModelAndView Y611WDFMXiangxi(int photoId){
		ModelAndView view = new ModelAndView("/fparty/Y611WDFMXiangxi");	
		theUserPhotoUitl.XiangxiPhoto(view, photoId);
		return view;
	}
}
