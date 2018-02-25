package com.fc.brms.sys.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fc.brms.common.domain.FcSysFunc;
import com.fc.brms.common.domain.FcSysRole;
import com.fc.brms.common.domain.FcSysRoleFunc;
import com.fc.brms.common.util.Page;
import com.fc.brms.common.util.SessionInfo;
import com.fc.brms.sys.service.ISystemRoleAndFuncService;


@Controller
public class SystemRoleController {
	@Resource
	private ISystemRoleAndFuncService sysRoleAndFuncService;
	
	@RequestMapping(value="/getCompanySysRoleByPage")
	@ModelAttribute("roles")
	public List<FcSysRole> getCompanySysRoleByPage(HttpServletRequest request, Page page,String keyWord)throws Exception{
		int companyId=SessionInfo.getCompanyId(request);
		List<FcSysRole> roles = sysRoleAndFuncService.findCompanySysRole(page, companyId,keyWord);
		return roles;
	}

	@RequestMapping(value = "/addSysRole")
	public String addSysRole(){
		return "/systemsetting/AddNewSysRole";
	}
	
	@RequestMapping(value = "/modifySysRole")
	public String modifySysRole(Model model,FcSysRole role){
		model.addAttribute("companyRole", role);
		return "/systemsetting/ModifySysRoleNameAndDesc";
	}
	
	@RequestMapping(value="/addCompanySystemRole")
	@ResponseBody
	public String addCompanySystemRole(HttpServletRequest request, FcSysRole role) throws Exception{
		int userId=SessionInfo.getVisitorId(request);
		int companyId=SessionInfo.getCompanyId(request);
		Date createTime=new Date(System.currentTimeMillis());
		role.setCompanyId(companyId);
		role.setCreateTime(createTime);
		role.setCreateUser(userId);
		sysRoleAndFuncService.addCompanyRole(role);
		return "SUCCESS";
	}
	
	@RequestMapping(value="/modifyCompanySystemRole")
	@ResponseBody
	public String modifyCompanySystemRole(HttpServletRequest request, FcSysRole role)throws Exception{
		int userId=SessionInfo.getVisitorId(request);
		Date createTime=new Date(System.currentTimeMillis());
		role.setCreateTime(createTime);
		role.setCreateUser(userId);
		sysRoleAndFuncService.modifyCompanyRole(role);
		return "SUCCESS";
	}
	
	
	@RequestMapping(value="/deleteCompanySysRole")
	@ResponseBody
	public String deleteCompanySysRole(HttpServletRequest request,String roleIds)throws Exception{
		int companyId=SessionInfo.getCompanyId(request);
		String[] ids = roleIds.split(",");
		int [] ids1=new int[ids.length];
		for (int i=0; i<ids.length ; i++) {
			ids1[i]=Integer.parseInt(ids[i]);
		}
		sysRoleAndFuncService.deleteCompanyRole(ids1,companyId);
		return "SUCCESS";
	}
	
	@RequestMapping(value="/findFuncByRoleId")
	public String  findFuncByRoleId(HttpServletRequest request,Model model,int roleId)throws Exception{
		int companyId=SessionInfo.getCompanyId(request);
		FcSysRole funces = sysRoleAndFuncService.findCompanySysRoleWithFunc(roleId, companyId);
		List<FcSysFunc> allFunces = sysRoleAndFuncService.findAllFunc();
		/*List<FcSysFunc> fun=funces.getFcSysFunces();
		for (FcSysFunc f : fun) {
			if(f.getFuncCode().length()==13){
				fun.add(f);
			}
		}
		for(int i=0;i<fun.size();i++){
			for (FcSysFunc f : allFunces) {
				if(f.getFuncCode().length()>13 && 
						f.getFuncCode().length()<=16 && 
						f.getFuncCode().substring(0, 13).equals(fun.get(i).getFuncCode())){
					fun.get(i).a;
				}
			}
		}*/
		model.addAttribute("funces", funces);
		model.addAttribute("allFunces", allFunces);
		return "/systemsetting/RoleFunc";
	}
	
	@RequestMapping(value="/changeRoleFunc")
	@ResponseBody
	public String changeRoleFunc(HttpServletRequest request, int roleId,String funcIds)throws Exception{
		int companyId=SessionInfo.getCompanyId(request);
		FcSysRole fcSysRole=new FcSysRole();
		fcSysRole.setRoleId(roleId);
		fcSysRole.setCompanyId(companyId);
		List<FcSysRoleFunc> roleFuncs=new ArrayList<FcSysRoleFunc>();
		if(funcIds !=null && funcIds !=""){
			String[] ids = funcIds.split(",");
			for (int i=0; i<ids.length ; i++) {
				FcSysRoleFunc roleFunc=new FcSysRoleFunc();
				roleFunc.setRoleId(roleId);
				roleFunc.setCompanyId(companyId);
				roleFunc.setFuncId(Integer.parseInt(ids[i]));
				roleFuncs.add(roleFunc);
			}
		}
		sysRoleAndFuncService.changeRoleFunc(roleFuncs, fcSysRole);
			
		/*fcSysRoleService.deleteCompanyRole(ids1);*/
		return "SUCCESS";
	}
	
}
