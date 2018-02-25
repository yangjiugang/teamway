package com.fc.flf.eagent.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fc.flf.common.domain.UserCustomerContactRecord;
import com.fc.flf.common.util.DateTools;
import com.fc.flf.common.util.Page;
import com.fc.flf.common.util.SessionInfo;
import com.fc.flf.eagent.service.ICustomerContactService;

/**
 * 记录约会控制器
 * 
 * @author Administrator
 * 
 */
@Controller
public class CustomerContactController {

	@Autowired
	private ICustomerContactService customerContactService;

	/**
	 * 分页查询
	 * 
	 * @param startDate
	 * @param endDate
	 * @param keyWord
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/queryPageCustomerContact")
	@ResponseBody
	public List<UserCustomerContactRecord> queryPageCustomerContact(
			String startDate, String endDate, String keyWord, Page page,
			Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		page.setPageSize(10);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("keyWord", keyWord);
		// 查询约会总记录数
		int rowCount = customerContactService.getCountPageQueryCount(map);
		// 设置分页
		page.setRowCount(rowCount);
		// 分页条件
		map.put("pageStr", page.getLimit());
		// 查询分页后数据
		List<UserCustomerContactRecord> lstcus = customerContactService
				.getCountPageQueryList(map);
		return lstcus;
	}

	/**
	 * 查询约会列表
	 * 
	 * @param startDate
	 * @param endDate
	 * @param keyWord
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/queryCustomerContact")
	public ModelAndView queryList(String startDate, String endDate,
			String keyWord, Model model, Page page) {
		ModelAndView view = new ModelAndView("/eagent/CustomerContact");
		Map<String, Object> map = new HashMap<String, Object>();
		// 须在setRowCount之前设置
		page.setPageSize(10);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("keyWord", keyWord);
		// 查询约会总记录数
		int iCusContact = customerContactService.getCountPageQueryCount(map);
		page.setRowCount(iCusContact);
		map.put("pageStr", page.getLimit());

		List<UserCustomerContactRecord> lstcus = customerContactService
				.getQueryPageList(map);

		model.addAttribute("customerContact", lstcus);
		model.addAttribute("iCount", iCusContact);
		return view;
	}

	/**
	 * 约会条件查询
	 * 
	 * @param startDate
	 * @param endDate
	 * @param keyWord
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/queryCondition")
	@ResponseBody
	public List<UserCustomerContactRecord> queryCondition(String startDate,
			String endDate, String keyWord, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		if("请输入关键词".equals(keyWord)){
			map.put("keyWord", "");
		}else{
			map.put("keyWord", keyWord);
		}
		List<UserCustomerContactRecord> lstcusContact = customerContactService
				.getQueryCondition(map);
		return lstcusContact;
	}

	/**
	 * 添加约会记录
	 * 
	 * @param customerName
	 * @param cusId
	 * @param address
	 * @param talkUser
	 * @param communicationMethod
	 * @param content
	 * @param intentionHouse
	 * @param takeinGroupIntention
	 * @param takeinClubIntention
	 * @param recordCreateDate
	 * @param recordStartDate
	 * @param recordEndDate
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/insertContact")
	public String insertContact(String customerName, String cusId,
			String address, String talkUser, String communicationMethod,
			int content, String intentionHouse, String takeinGroupIntention,
			String takeinClubIntention, String recordCreateDate,
			String recordStartDate, String recordEndDate,
			HttpServletRequest request, Page page, Model model)
			throws Exception {
		String createDate = subStringDate(recordCreateDate);
		String startDate = subStringDate(recordStartDate);
		String endDate = subStringDate(recordEndDate);
		int userId = SessionInfo.getVisitorId(request);
		String userName = SessionInfo.getVisitorName(request);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("userName", userName);
		map.put("customerName", customerName);
		map.put("cusId", cusId);
		map.put("address", address);
		map.put("talkUser", talkUser);
		map.put("communicationMethod", Integer.valueOf(communicationMethod));
		map.put("content", content);
		map.put("takeinGroupIntention", Integer.valueOf(takeinGroupIntention));
		map.put("takeinClubIntention", Integer.valueOf(takeinClubIntention));
		map.put("recordCreateDate", DateTools.getTs(createDate));
		map.put("recordStartDate", DateTools.getTs(startDate));
		map.put("recordEndDate", DateTools.getTs(endDate));
		customerContactService.insertContact(map);
		return "forward:queryCustomerContact";
	}
	
	public String subStringDate(String str){
		String strbefor = str.substring(1, str.length());
		return strbefor;
	}

	/**
	 * 删除约会
	 * 
	 * @param recordId
	 *            主键
	 * @return 删除是否成功
	 */
	@RequestMapping(value = "/deleteOrder")
	public String deleteOrder(int recordId, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("recordId", recordId);
		customerContactService.deleteOrder(map);
		return "forward:queryCustomerContact";
	}
}
