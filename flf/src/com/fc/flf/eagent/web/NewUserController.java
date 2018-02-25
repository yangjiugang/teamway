package com.fc.flf.eagent.web;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.fc.flf.common.domain.CustomerEduInfo;
import com.fc.flf.common.domain.CustomerFamilyInfo;
import com.fc.flf.common.domain.CustomerInfoDetail;
import com.fc.flf.common.domain.CustomerInterests;
import com.fc.flf.common.util.ChangeTouXiang;
import com.fc.flf.common.util.SessionInfo;
import com.fc.flf.eagent.service.ICustomerFunService;
import com.sun.org.apache.regexp.internal.recompile;

/**
 * 添加客户控制器
 * 
 * @author 冯鹄
 * 
 */
@Controller
public class NewUserController {

	@Autowired
	private ICustomerFunService iCustomerFunService;
	

	@SuppressWarnings("deprecation")
	@RequestMapping(value = "newCustomer")
	public String  NewUser(CustomerInfoDetail customerInfoDetail,HttpServletRequest request) {
		customerInfoDetail.setCustomerId(0);//设置一个缺省值
		customerInfoDetail.setIsExchange(1);
		customerInfoDetail.setCustomerType(1);
		customerInfoDetail.setUserPoints(0);
		customerInfoDetail.setCreatedUser(1);
		iCustomerFunService.insertCusInfo(customerInfoDetail);//添加一个新客户
		int cusId = iCustomerFunService.queryCusId(customerInfoDetail);//获得新客户的cusId
		CustomerFamilyInfo customerFamilyInfo = new CustomerFamilyInfo();
		CustomerEduInfo customerEduInfo = new CustomerEduInfo();
		CustomerInterests customerInterests = new CustomerInterests();
		System.out.println(".,,.,."+request.getParameter("customerFamilyInfosList[0].memberName"));
		int s = customerInfoDetail.getCustomerFamilyInfosList().size();
		System.out.println("[][]=="+s);
		customerEduInfo.setBeginDate(new Date());
		customerEduInfo.setEndDate(new Date());
		customerEduInfo.setCusId(cusId);
		customerEduInfo.setDegree(customerInfoDetail.getCustomerEduInfo().getDegree());
		customerEduInfo.setCertifier("null");
		customerEduInfo.setGraduate(customerInfoDetail.getCustomerEduInfo().getGraduate());
		customerEduInfo.setSchool(customerInfoDetail.getCustomerEduInfo().getSchool());
		iCustomerFunService.insertEduInfo(customerEduInfo);//添加客户的受教育情况
		customerInterests.setCusId(cusId);
		customerInterests.setInterests(customerInfoDetail.getCustomerInterests().getInterests());
		iCustomerFunService.insertCusIntere(customerInterests);//添加客户的兴趣爱好
		
		for (int i = 0; i < s ; i ++) {
			String name = customerInfoDetail.getCustomerFamilyInfosList().get(i).getMemberName();
//			System.out.println(name);
			if(null != name && "" != name){
				System.out.println("i="+i);
				Date date = new Date();
				int year = date.getYear();
				int age = customerInfoDetail.getCustomerFamilyInfosList().get(i).getAge();
				Date date1 = new Date();
				date1.setYear(year-age);
				date1.setMonth(01);
				date1.setDate(01);
				customerFamilyInfo.setCusId(cusId);
				customerFamilyInfo.setMemberName(name);
				customerFamilyInfo.setJobDuty(customerInfoDetail.getCustomerFamilyInfosList().get(i).getJobDuty());
				customerFamilyInfo.setRelationship(customerInfoDetail.getCustomerFamilyInfosList().get(i).getRelationship());	
				customerFamilyInfo.setWorkPlace(customerInfoDetail.getCustomerFamilyInfosList().get(i).getWorkPlace());
				customerFamilyInfo.setContactphone(customerInfoDetail.getCustomerFamilyInfosList().get(i).getContactphone());
				customerFamilyInfo.setBirthday(date1);
				System.out.println(i);
				customerInfoDetail.getCustomerFamilyInfosList().add(customerFamilyInfo);
				iCustomerFunService.insertFamInfo(customerFamilyInfo);//添加客户的家庭信息
			}
		}
		return "redirect:IndexBA";
	}

	@RequestMapping(value = "changeTou")
	public String changeTou() {
		return "/eagent/NewFile";
	}

	@RequestMapping(value = "KehuTianjiaZhuce")
	public String KehuTianjiaZhuce(){
		return "/eagent/Kehu-tianjia-zhuce";
		}
	
	@RequestMapping(value = "KehuZhuece")
	public String KehuZhuece(CustomerInfoDetail customerInfoDetail,Model model){
		model.addAttribute("customerInfoDetail", customerInfoDetail);
		return "/eagent/Index-a-tianjia";
		}
}
