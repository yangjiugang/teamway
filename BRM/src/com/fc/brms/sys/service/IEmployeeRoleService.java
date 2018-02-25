package com.fc.brms.sys.service;

import java.util.List;

import org.springframework.ui.Model;

import com.fc.brms.common.domain.EmployeeInfo;
import com.fc.brms.common.domain.FcSysRole;
import com.fc.brms.common.domain.FcSysVisitorRole;
import com.fc.brms.common.util.Page;

public interface IEmployeeRoleService {
	public List<EmployeeInfo> findEmployeeInfoWithRoleInfo(int companyId,Page page,int orgId,String keyWord);
	
	public List<FcSysRole> findCompanyAllRoleName(int companyId);
	
	public List<FcSysVisitorRole> findCompanyEmpRole(int employeeId,int companyId);

	public void changeEmployeeRoles(int companyId, int [] employeeId,
			List<FcSysVisitorRole> fcSysVisitorRoles);
	
	public void initSearchBar(Model model,int companyId);

	public List<EmployeeInfo> findCompanyEmpName(int companyId, int[] ides);
}
