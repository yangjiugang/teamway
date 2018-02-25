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

import com.fc.brms.common.domain.EmployeeInfo;
import com.fc.brms.common.domain.FcSysRole;
import com.fc.brms.common.domain.FcSysVisitorRole;
import com.fc.brms.common.util.Page;
import com.fc.brms.common.util.SessionInfo;
import com.fc.brms.sys.service.IEmployeeRoleService;

@Controller
public class EmployeeRoleController {
	@Resource
	private IEmployeeRoleService employeeRoleService;
	
	@RequestMapping(value="/companyEmployeeRoleInfo")
	public String companyEmployeeRoleInfo(HttpServletRequest request,Model model)throws Exception{
		int companyId=SessionInfo.getCompanyId(request);
		employeeRoleService.initSearchBar(model, companyId);
		return "/systemsetting/EmployeeRoleInfo";
	}
	
	@RequestMapping(value="/findAllCompanyEmployeeRoleInfo")
	@ModelAttribute("empRoleInfoes")
	public List<EmployeeInfo> findAllCompanyEmployeeRoleInfo(HttpServletRequest request,Page page,
			int organizationId,String keyWord)throws Exception{
		int companyId=SessionInfo.getCompanyId(request);
		List<EmployeeInfo> empRoleInfoes = employeeRoleService.findEmployeeInfoWithRoleInfo(companyId, page,organizationId,keyWord);
		return empRoleInfoes;
	}
	
	@RequestMapping(value="/modifyEmpRoles")
	public String modifyEmpRoles(HttpServletRequest request,Model model, String employeeIdes)throws Exception{
		int companyId=SessionInfo.getCompanyId(request);
		String [] empIdes=employeeIdes.split(",");
		int [] ides=new int [empIdes.length];
		for(int i=0;i<ides.length;i++){
			ides[i]=Integer.parseInt(empIdes[i]);
		}
		List<EmployeeInfo> employees=employeeRoleService.findCompanyEmpName(companyId,ides);
		model.addAttribute("employees", employees);
		return "/systemsetting/ModifyEmpRoles";
	}
	
	@RequestMapping(value="/singleEmpAssociateRole")
	public String empAssociateRolet(HttpServletRequest request,Model model,int employeeId)throws Exception{
		int companyId=SessionInfo.getCompanyId(request);
		List<FcSysRole> allRoles = employeeRoleService.findCompanyAllRoleName(companyId);
		List<FcSysVisitorRole> empRoles = employeeRoleService.findCompanyEmpRole(employeeId, companyId);
		model.addAttribute("employeeId", employeeId);
		model.addAttribute("allRoles", allRoles);
		model.addAttribute("empRoles", empRoles);
		return "/systemsetting/SingleEmployeeRoleSetting";
	}
	
	@RequestMapping(value="/batchEmpAssociateRole")
	public String batchAssociateRole(HttpServletRequest request,Model model,String employeeIdes,String empNames)throws Exception{
		int companyId=SessionInfo.getCompanyId(request);
		List<FcSysRole> allRoles = employeeRoleService.findCompanyAllRoleName(companyId);
		model.addAttribute("employeeIdes", employeeIdes);
		model.addAttribute("allRoles", allRoles);
		model.addAttribute("empNames", empNames);
		return "/systemsetting/BatchEmployeeRoleSetting";
	}
	
	@RequestMapping(value="/changeEmployeeRole")
	@ResponseBody
	public String changeEmployeeRole(HttpServletRequest request,String employeeIdes,String roleIds)throws Exception{
		int visitorId=SessionInfo.getVisitorId(request);
		int companyId=SessionInfo.getCompanyId(request);
		String [] empIds=employeeIdes.split(",");
		int [] empIdes=new int [empIds.length];
		String[] ids = roleIds.split(",");
		List<FcSysVisitorRole> fcSysVisitorRoles=new ArrayList<FcSysVisitorRole>();
		for(int e=0;e<empIds.length;e++){
			empIdes[e]=Integer.parseInt(empIds[e]);
			for (int i=0; i<ids.length ; i++) {
				FcSysVisitorRole role=new FcSysVisitorRole();
				role.setCompanyId(companyId);
				role.setVisitorId(Integer.parseInt(empIds[e]));
				role.setRoleId(Integer.parseInt(ids[i]));
				role.setCreateTime(new Date(System.currentTimeMillis()));
				role.setCreateUser(visitorId);
				fcSysVisitorRoles.add(role);
			}
		}
		employeeRoleService.changeEmployeeRoles(companyId,empIdes,fcSysVisitorRoles);
		return "SUCCESS";
	}
	
	@RequestMapping(value="/empAssociateRoleBySelect")
	public String empAssociateRoleBySelect(HttpServletRequest request,Model model)throws Exception{
		int companyId=SessionInfo.getCompanyId(request);
		List<FcSysRole> allRoles = employeeRoleService.findCompanyAllRoleName(companyId);
		model.addAttribute("allRoles", allRoles);
		return "/systemsetting/OrgEmployeeRoleSetting";
	}
}
