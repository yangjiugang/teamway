package com.fc.brms.homepage.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fc.brms.broker.service.IEmployeeInfoService;
import com.fc.brms.common.domain.CfgOrganization;
import com.fc.brms.common.domain.CfgPost;
import com.fc.brms.common.domain.EmployeeInfo;
import com.fc.brms.common.service.IOrgStructureService;
import com.fc.brms.common.util.CommonUtil;
import com.fc.brms.common.util.Page;
import com.fc.brms.common.util.SessionInfo;

@Controller
public class CommonController {
	
	@Resource
	private IEmployeeInfoService employeeInfoService;
	@Resource
	private IOrgStructureService orgStructureService;
	
	private void setModels(Model model, HttpServletRequest request) {
		int single = CommonUtil.getInt(request.getParameter("single"));
		model.addAttribute("single", single);
		String idx = request.getParameter("idx");
		if(StringUtils.isNotBlank(idx)) {
			model.addAttribute("idx", idx);
		}
	}
	
	@RequestMapping(value = "/personSelector")
	public String personSelector(Model model, HttpServletRequest request) {
		setModels(model, request);
		return "/common/PersonSelector";
	}
	
	@RequestMapping(value = "/orgSelector")
	public String orgSelector(Model model, HttpServletRequest request) {
		setModels(model, request);
		return "/common/OrgSelector";
	}
	
	@RequestMapping(value = "/postSelector")
	public String postSelector(Model model, HttpServletRequest request) {
		setModels(model, request);
		return "/common/PostSelector";
	}
	
	/**
	 * 组织架构树
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "/orgStructure")
	public void orgStructure(HttpServletRequest request, HttpServletResponse response, String type) throws Exception{
		int id = 0;
		String strId = request.getParameter("id");
		String flag = null;
		if(StringUtils.isNotBlank(strId)) {
			String[] strIds = strId.split("_");
			flag = strIds[0];
			id = Integer.parseInt(strIds[1]);
		}
		int single = CommonUtil.getInt(request.getParameter("single")); // 单选
		int cId = SessionInfo.getCompanyId(request);
		StringBuilder sb = new StringBuilder();
		sb.append("[");
		if(id == 0) { // 一级部门
			sb.append("{id:0, pId:0, name:\"" + SessionInfo.getCompanyName(request) + "\", open:true"+(single==1?",nocheck:true":"")+"}");
			List<CfgOrganization> list = orgStructureService.getOrgLever1ByCompanyId(cId);
			for(CfgOrganization org : list) {
				sb.append(",{id:'org_"+org.getOrganizationId()+"', pId:0, isParent:true, name:\""+org.getOrganizationName()+"\""+(single==1?",nocheck:true":"")+"}");
			}
		} else { // 下级部门
			List<CfgOrganization> list = orgStructureService.getChildOrg(cId, id);
			if(list != null && list.size() > 0) {
				for(int i = 0; i < list.size(); i++) {
					CfgOrganization org = list.get(i);
					if(i == 0)
						sb.append("{id:'org_"+org.getOrganizationId()+"', pId:'org_"+id+"', isParent:true, name:\""+org.getOrganizationName()+"\""+(single==1?",nocheck:true":"")+"}");
					else
						sb.append(",{id:'org_"+org.getOrganizationId()+"', pId:'org_"+id+"', isParent:true, name:\""+org.getOrganizationName()+"\""+(single==1?",nocheck:true":"")+"}");
				}
			} else {
				if("org".equals(flag) && ("post".equals(type) || "emp".equals(type))) { // 岗位
					List<CfgPost> postList = orgStructureService.findPostForOrganization(id);
					for(int i = 0; i < postList.size(); i++) {
						CfgPost post = postList.get(i);
						if(i == 0)
							sb.append("{id:'post_"+post.getPostId()+"', pId:'org_"+id+"', isParent:"+("post".equals(type)?false:true)+", name:\""+post.getPostName()+"\""+(single==1?",nocheck:true":"")+"}");
						else
							sb.append(",{id:'post_"+post.getPostId()+"', pId:'org_"+id+"', isParent:"+("post".equals(type)?false:true)+", name:\""+post.getPostName()+"\""+(single==1?",nocheck:true":"")+"}");
					}
				}
				if("post".equals(flag) && "emp".equals(type)) { // 员工
					List<EmployeeInfo> empList = employeeInfoService.getEmployeeInfoByPostId(id);
					for(int i = 0; i < empList.size(); i++) {
						EmployeeInfo employeeInfo = empList.get(i);
						if(i == 0)
							sb.append("{id:'emp_"+employeeInfo.getEmployeeId()+"', pId:'post_"+id+"', name:\""+employeeInfo.getUserName()+"\"}");
						else
							sb.append(",{id:'emp_"+employeeInfo.getEmployeeId()+"', pId:'org_"+id+"', name:\""+employeeInfo.getUserName()+"\"}");
					}
				}
			}
		}
		sb.append("]");
		CommonUtil.output(sb.toString(), response);
	}
	
	@RequestMapping(value = "/searchEmployeeInfo")
	@ModelAttribute(value="rows")
	public List<EmployeeInfo> searchEmployeeInfo(HttpServletRequest request) throws Exception {
		int id = 0;
		String strId = request.getParameter("id");
		String flag = null;
		if(StringUtils.isNotBlank(strId) && !"0".equals(strId)) {
			String[] strIds = strId.split("_");
			flag = strIds[0];
			id = Integer.parseInt(strIds[1]);
		}
		
		int cId = SessionInfo.getCompanyId(request);
		
		if(id == 0) {  // 查询公司所有员工
			return employeeInfoService.getEmployeeInfoByCompanyId(cId);
		} else {
			if("org".equals(flag)) { // 按部门查询员工
				return employeeInfoService.getEmployeeInfoByOrgId(id);
			} else if("post".equals(flag)) { // 按职位查询员工
				return employeeInfoService.getEmployeeInfoByPostId(id);
			} else { // 员工
				List<EmployeeInfo> list = new ArrayList<EmployeeInfo>();
				list.add(employeeInfoService.getEmployeeInfoById(id));
				return list;
			}
		}
	}
	
	@RequestMapping(value = "/searchPersonSelector")
	@ModelAttribute(value="rows")
	public List<EmployeeInfo> searchPersonSelector(Page page, String keyword) {
		return employeeInfoService.getEmployeeInfoByKeyword(page, keyword);
	}
	
	@RequestMapping(value = "/searchPost")
	@ModelAttribute(value="rows")
	public List<CfgPost> searchPost(HttpServletRequest request) throws Exception {
		int id = 0;
		String strId = request.getParameter("id");
		String flag = null;
		if(StringUtils.isNotBlank(strId) && !"0".equals(strId)) {
			String[] strIds = strId.split("_");
			flag = strIds[0];
			id = Integer.parseInt(strIds[1]);
		}
		
		int cId = SessionInfo.getCompanyId(request);
		
		if(id == 0) {  // 查询公司所有岗位
			return orgStructureService.getPostByCompanyId(cId);
		} else {
			if("org".equals(flag)) { // 按部门查询岗位
				return orgStructureService.getPostByOrgId(id);
			} else { // 岗位
				List<CfgPost> list = new ArrayList<CfgPost>();
				list.add(orgStructureService.getPostById(id));
				return list;
			}
		}
	}
	
	@RequestMapping(value = "/searchPostSelector")
	@ModelAttribute(value="rows")
	public List<CfgPost> searchPostSelector(Page page, String keyword) {
		return orgStructureService.getPostByKeyword(keyword);
	}
	
	@RequestMapping(value = "/searchOrg")
	@ModelAttribute(value="rows")
	public List<CfgOrganization> searchOrg(HttpServletRequest request) throws Exception {
		int id = 0;
		String strId = request.getParameter("id");
		if(StringUtils.isNotBlank(strId) && !"0".equals(strId)) {
			String[] strIds = strId.split("_");
			id = Integer.parseInt(strIds[1]);
		}
		
		int cId = SessionInfo.getCompanyId(request);
		
		if(id == 0) {  // 查询公司所有子部门
			return orgStructureService.getFinalChildOrgByCompanyId(cId);
		} else {
			return orgStructureService.getFinalChildOrgById(id);
		}
	}
}
