package com.fc.brms.external.web;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.http.NameValuePair;
import org.apache.http.ParseException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.message.BasicNameValuePair;
import org.apache.log4j.Logger;
import org.htmlcleaner.XPatherException;
import org.jdom.JDOMException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fc.brms.common.domain.CfgResumeAccount;
import com.fc.brms.common.domain.ResumeParameter;
import com.fc.brms.common.util.CommonUtil;
import com.fc.brms.common.util.HttpclientUnit;
import com.fc.brms.common.util.SessionInfo;
import com.fc.brms.external.resolveHtml.Resolve58Html;
import com.fc.brms.external.resolveHtml.ResolveCjolHtml;
import com.fc.brms.external.service.ICfgResumeAccountService;

/**
 * 
 * @author 邓祥
 * 在线抓取简历
 * @version 2012-3-21
 */
@Controller
public class HentResume {

	private static Logger logger = Logger.getLogger(HentResume.class);
	
	@Resource
	private ICfgResumeAccountService cfgResumeAccountService;
	
	
	/**
	 * 登陆人才热线和初始化搜索页面
	 * @return
	 * @throws ClientProtocolException
	 * @throws IOException
	 */
	@RequestMapping(value = "/intoCjol")
	public String intoCjol(Model model) {
		HttpclientUnit httpclientUnit = new HttpclientUnit();
		List<NameValuePair> cjolParams = new ArrayList<NameValuePair>();
		String cjolUrl = "http://rms.cjol.com/Login.aspx";
		cjolParams.add(new BasicNameValuePair("UserID", "xiao111"));
		cjolParams.add(new BasicNameValuePair("rod", "kunding123"));
		cjolParams.add(new BasicNameValuePair("btnLogin", "登 录"));
//		List<NameValuePair> cjolParams1 = new ArrayList<NameValuePair>();
//		cjolParams1.add(new BasicNameValuePair("username", "dwlf743"));
//		cjolParams1.add(new BasicNameValuePair("password", "hrmima2011"));
//		httpclientUnit.login("http://passport.58.com/dologin?path=http://my.58.com/?pts=1333527244657",cjolParams1,"3");
		boolean loginBl =  true;
		try {
			int companyId = SessionInfo.getCompanyId(CommonUtil.getRequest());
			List<CfgResumeAccount> cfgResumeAccount = cfgResumeAccountService.cfgResumeAccountList(companyId,0);
			//loginBl =  httpclientUnit.login(cjolUrl,cjolParams,"1");
			model.addAttribute("cfgResumeAccount", cfgResumeAccount);
		} catch (Exception e) {
			logger.error("初始化搜索页面出错", e);
		}
		
		if(loginBl){//成功
			 return "/external/IntoSearchResume";
		}else{//失败
			return "/external/IntoSearchResume";
		}
       
    }
	
	/**
	 * 初始化全部在线简历
	 * @return
	 */
	@RequestMapping(value = "/allResumeList")
	public String allResumeList(Model model,ResumeParameter parameter) {
		model.addAttribute("parameter", parameter);
        return "/external/AllResumeList";
    }
	
	
	/**
	 * 查询人才热线上的列表
	 * @param model
	 * @param parameter
	 * @return
	 * @throws XPatherException
	 * @throws ParseException
	 * @throws UnsupportedEncodingException
	 * @throws IOException
	 */
	@RequestMapping(value = "/searchCjol")
	public String searchCjol(Model model,ResumeParameter parameter) 
		throws XPatherException, ParseException, UnsupportedEncodingException, IOException {//得到查询的列表
		
		ResolveCjolHtml resolveCjol = new ResolveCjolHtml();
	
		try {
			List detailList = resolveCjol.resolveList("", parameter);
			model.addAttribute("parameter", parameter);
			model.addAttribute("userResume", detailList.get(0));
			model.addAttribute("sAll", detailList.get(1));
			model.addAttribute("upPage", detailList.get(2));
			model.addAttribute("toPage", detailList.get(3));
			model.addAttribute("validation", detailList.get(4));
			model.addAttribute("cjolstateid", detailList.get(5));
			model.addAttribute("labMessage", detailList.get(7));
		} catch (Exception e) {
			logger.error("查询人才热线上的列表出错", e);
			
		}
		
        return "/external/listCjol";
    }
	
	/**
	 * 查询58同城上的列表
	 * @param model
	 * @param parameter
	 * @return
	 * @throws XPatherException
	 * @throws ParseException
	 * @throws UnsupportedEncodingException
	 * @throws IOException
	 */
	@RequestMapping(value = "/search58")
	public String search58(Model model,ResumeParameter parameter) 
		throws XPatherException, ParseException, UnsupportedEncodingException, IOException {//得到查询的列表
		
		Resolve58Html resolve58Html = new Resolve58Html();
	
		try {
			List detailList = resolve58Html.resolve58List("", parameter);
			model.addAttribute("parameter", parameter);
			model.addAttribute("userResume", detailList.get(0));
			model.addAttribute("sAll", detailList.get(1));
		} catch (Exception e) {
			logger.error("查询58同城上的列表出错", e);
			
		}
		
        return "/external/List58";
    }
	
	
	
	/**
	 * 根据id查看人才热线的个人详细
	 * @param model
	 * @param id
	 * @return
	 * @throws XPatherException
	 */
	@RequestMapping(value = "/particular")
	public String particular(Model model,String resumeId) {//根据ID 查询详细
		ResolveCjolHtml resolveCjol = new ResolveCjolHtml();
		String userURL = "http://rms.cjol.com/ResumeBank/Resume.aspx";//根据得到的ID 查看具体的信息
		 
		try {
			Map userResumeMap = resolveCjol.downloadResume(userURL, resumeId);
			model.addAttribute("basic", userResumeMap.get(1));//基本信息
			model.addAttribute("works", userResumeMap.get(2));//工作经验
			model.addAttribute("pro", userResumeMap.get(3));//项目经验
			model.addAttribute("skill", userResumeMap.get(4));//技能专长
			model.addAttribute("edus", userResumeMap.get(5));//教育
		} catch (XPatherException e) {
			logger.error("根据id查询人才热线的个人详细出错", e);
		} catch (JDOMException e) {
			logger.error("根据id查询人才热线的个人详细出错", e);
		} 
        return "/external/ResumeCk";
    }
	
	
	
	
	
}
