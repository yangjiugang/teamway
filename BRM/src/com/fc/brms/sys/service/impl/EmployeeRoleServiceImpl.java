package com.fc.brms.sys.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.fc.brms.broker.mapper.IEmployeeInfoMapper;
import com.fc.brms.common.domain.CfgOrganization;
import com.fc.brms.common.domain.EmployeeInfo;
import com.fc.brms.common.domain.FcSysRole;
import com.fc.brms.common.domain.FcSysVisitorRole;
import com.fc.brms.common.mapper.IOrgStructureMapper;
import com.fc.brms.common.util.Page;
import com.fc.brms.sys.mapper.ISystemRoleAndFuncMapper;
import com.fc.brms.sys.service.IEmployeeRoleService;

@Service
public class EmployeeRoleServiceImpl implements IEmployeeRoleService {
	@Resource
	private IEmployeeInfoMapper employeeInfoMapper;
	
	@Resource
	private IOrgStructureMapper orgStructureMapper;
	
	@Resource
	private ISystemRoleAndFuncMapper systemRoleAndFuncMapper;
	
	/*查询employee信息及相相角色*/
	@Transactional(readOnly=true)
	public List<EmployeeInfo> findEmployeeInfoWithRoleInfo(int companyId,
			Page page,int orgId,String keyWord) {
		page.setRecords(employeeInfoMapper.selectEmployeeInfoWithRoleInfoCount(companyId,orgId,keyWord));
		List<EmployeeInfo> employees = employeeInfoMapper.selectEmployeeInfoWithRoleInfo(companyId, page.getLimit(),orgId,keyWord);
		for (EmployeeInfo e : employees) {
			List<FcSysRole> roles = e.getFcSysRole();
			StringBuffer sb=new StringBuffer();
			if(roles.size()>0){
				for (FcSysRole role : roles) {
					sb.append(role.getRoleName()).append("，");
				}
				String str=sb.toString();
				str=str.substring(0, str.length()-1);
				e.setFcSysRoleNames(str);
			}
		}
		 return employees;
	}

	/*查询公司所有角色名*/
	@Transactional(readOnly=true)
	public List<FcSysRole> findCompanyAllRoleName(int companyId) {
		List<FcSysRole> sysRoleName = systemRoleAndFuncMapper.selectFcSysRoleName(companyId);
		return sysRoleName;
	}
	
	/*查询公司员工所拥有角色*/
	@Transactional(readOnly=true)
	public List<FcSysVisitorRole> findCompanyEmpRole(int employeeId,int companyId) {
		List<FcSysVisitorRole> visitorRoles = systemRoleAndFuncMapper.selectFcSysVisitorRole(employeeId, companyId);
		return visitorRoles;
	}

	/*更改公司员工所拥有角色*/
	@Transactional
	public void changeEmployeeRoles(int companyId, int [] employeeId,
			List<FcSysVisitorRole> fcSysVisitorRoles) {
		systemRoleAndFuncMapper.deleteCompanyEmpRoleByEmpId(companyId,employeeId);
		if(fcSysVisitorRoles.size()>0){
			systemRoleAndFuncMapper.insertFcSysVisitorRole(fcSysVisitorRoles);
		}
	}

	/*初始化“人员管理”页面搜索条"*/
	@Transactional(readOnly=true)
	public void initSearchBar(Model model, int companyId) {
		/*List<FcSysRole> allRoles = systemRoleAndFuncMapper.selectFcSysRole(companyId, null, null);*/
		List<CfgOrganization> allOrges = orgStructureMapper.selectOrganizationByCompanyId(companyId);
		/*model.addAttribute("allRoles", allRoles);*/
		model.addAttribute("allOrges", allOrges);
		
	}

	/*查找员工姓名*/
	@Transactional(readOnly=true)
	public List<EmployeeInfo> findCompanyEmpName(int companyId, int[] ides) {
		return employeeInfoMapper.selectEmployeeName(companyId, ides);
	}

}
