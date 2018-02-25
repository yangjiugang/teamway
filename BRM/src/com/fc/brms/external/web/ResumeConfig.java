package com.fc.brms.external.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fc.brms.common.domain.CfgResumeAccount;
import com.fc.brms.common.util.CommonUtil;
import com.fc.brms.common.util.SessionInfo;
import com.fc.brms.external.service.ICfgResumeAccountService;

/**
 * 
 * @author 邓祥
 * 在线简历设置
 * @version 2012-4-6
 */

@Controller
public class ResumeConfig {

	private static Logger logger = Logger.getLogger(ResumeConfig.class);
	
	@Resource
	private ICfgResumeAccountService cfgResumeAccountService;
	
	
	/**
	 * 初始化在线简历设置
	 * @return
	 */
	@RequestMapping(value = "/intoResumeConfig")
	public String intoResumeConfig() {
		
        return "/external/ResumeConfig";
    }
	
	/**
	 * 在线简历列表
	 * @return
	 */
	@RequestMapping(value = "/resumeConfigList")
	@ModelAttribute("rows")
	public List<CfgResumeAccount> resumeConfigList() {
		int companyId = 0;
		try {
			companyId = SessionInfo.getCompanyId(CommonUtil.getRequest());
		} catch (Exception e) {
			logger.error("在线简历列表出错",e);
		}
        return cfgResumeAccountService.cfgResumeAccountList(companyId,3);
    }
	
	/**
	 * 初始化添加在线简历设置
	 * @return
	 */
	@RequestMapping(value = "/intoAddResumeConfig")
	public String intoAddResumeConfig(Model model,String type) {
		CfgResumeAccount cfgResumeAccount = new CfgResumeAccount();
		//1:人才热线2:前程无忧3:58同城4:中华英才网
		cfgResumeAccount.setAccountName(type);
		model.addAttribute("cfgResumeAccount", cfgResumeAccount);
        return "/external/ResumeConfigEdit";
    }
	
	/**
	 * 添加在线简历设置
	 * @return
	 */
	@RequestMapping(value = "/addResumeConfig")
	public String addResumeConfig(Model model,CfgResumeAccount cfgResumeAccount) {
		try {
			int companyId = SessionInfo.getCompanyId(CommonUtil.getRequest());
			cfgResumeAccount.setCompanyId(companyId);
			cfgResumeAccountService.insertCfgResumeAccount(cfgResumeAccount);
		} catch (Exception e) {
			logger.error("添加在线简历设置出错", e);
		}
		
        return "redirect:intoResumeConfig";
    }
	
	/**
	 * 根据ID查看在线简历设置
	 * @return
	 */
	@RequestMapping(value = "/cfgResumeAccountById")
	public String cfgResumeAccountById(Model model,int accountId) {
		
		CfgResumeAccount cfgResumeAccount = cfgResumeAccountService.cfgResumeAccountById(accountId);
		
		model.addAttribute("cfgResumeAccount", cfgResumeAccount);
        return "/external/ResumeConfigEdit";
    }
	
	/**
	 * 修改在线简历设置
	 * @return
	 */
	@RequestMapping(value = "/updateCfgResumeAccount")
	public String updateCfgResumeAccount(Model model,CfgResumeAccount cfgResumeAccount) {
		
		cfgResumeAccountService.updateCfgResumeAccount(cfgResumeAccount);
        return "redirect:intoResumeConfig";
    }
	
	/**
	 * 根据ID修改在线简历用户状态
	 * @return
	 */
	@RequestMapping(value = "/closeCfgResumeAccount")
	public String closeCfgResumeAccount(Model model,int accountId,int accountStatus) {
		Map strMap = new HashMap();
		strMap.put("accountId", accountId);
		strMap.put("accountStatus", accountStatus);
		cfgResumeAccountService.closeCfgResumeAccount(strMap);
        return "redirect:intoResumeConfig";
    }
	
	
	
}
