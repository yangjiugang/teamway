package com.fc.brms.common.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fc.brms.common.domain.CfgJobGrade;
import com.fc.brms.common.domain.CfgJobLevel;
import com.fc.brms.common.domain.CfgOrganization;
import com.fc.brms.common.domain.CfgPost;
import com.fc.brms.common.mapper.IOrgStructureMapper;
import com.fc.brms.common.service.IOrgStructureService;

@Service
public class OrgStructureServiceImpl implements IOrgStructureService {
	
	@Resource
	private IOrgStructureMapper orgStructureMapper;
	
	public List<CfgPost> findPostForOrganization(int organizationId) {
		List<CfgPost> cfgPosts = orgStructureMapper.findPostForOrganization(organizationId);
		return cfgPosts;
	}
	
	public List<CfgOrganization> getOrgLever1ByCompanyId(int companyId) {
		return orgStructureMapper.getOrgLever1ByCompanyId(companyId);
	}
	
	public List<CfgOrganization> getChildOrg(int companyId, int higherOrganizationId) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("companyId", companyId);
		param.put("higherOrganizationId", higherOrganizationId);
		return orgStructureMapper.getChildOrg(param);
	}
	
	public List<CfgOrganization> getFinalChildOrgByCompanyId(int companyId) {
		return orgStructureMapper.getFinalChildOrgByCompanyId(companyId);
	}
	
	public List<CfgOrganization> getFinalChildOrgById(int organizationId) {
		return orgStructureMapper.getFinalChildOrgById(organizationId);
	}
	
	@Override
	public List<CfgOrganization> findOrganization() {
		
		return orgStructureMapper.findOrganization();
	}

	@Override
	public List<CfgJobGrade> findJobGrade() {
		return orgStructureMapper.findJobGrade();
	}

	@Override
	public List<CfgJobLevel> findJobLevelForGrade(int jobGradeId) {
		return orgStructureMapper.findJobLevelForGrade(jobGradeId);
	}
	
	public CfgPost getPostById(int postId) {
		return orgStructureMapper.getPostById(postId);
	}
	
	public List<CfgPost> getPostByOrgId(int organizationId) {
		return orgStructureMapper.getPostByOrgId(organizationId);
	}
	
	public List<CfgPost> getPostByCompanyId(int companyId) {
		return orgStructureMapper.getPostByCompanyId(companyId);
	}
	
	public List<CfgPost> getPostByKeyword(String keyword) {
		return orgStructureMapper.getPostByKeyword(keyword);
	}
}
