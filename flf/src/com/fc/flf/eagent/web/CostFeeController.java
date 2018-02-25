package com.fc.flf.eagent.web;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fc.flf.common.domain.UserCostFee;
import com.fc.flf.common.util.DateTools;
import com.fc.flf.common.util.Page;
import com.fc.flf.common.util.SessionInfo;
import com.fc.flf.eagent.service.ICostFeeService;

/**
 * 记录开销控制器
 * 
 * @author qinqx
 * 
 */
@Controller
public class CostFeeController {

	@Autowired
	private ICostFeeService costFeeService;

	/**
	 * 记录开销主页面
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/costFee")
	public ModelAndView costFee(Model model, HttpServletRequest request,Page page)
			throws Exception {
		ModelAndView view = new ModelAndView("/eagent/CostFee");
		// 获取系统当前时间
		//Date curDate = DateTools.getToday();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("curDate", DateTools.getToday());
		map.put("userId", SessionInfo.getVisitorId(request));
		
		int iCount = costFeeService.getQueryListCount(map);
		
		page.setRowCount(iCount);
		map.put("strLimit", page.getLimit());
		List<UserCostFee> lstCostFee = costFeeService.getQueryList(map);
		model.addAttribute("lstCostFee", lstCostFee);
		model.addAttribute("iCount", lstCostFee.size());
		model.addAttribute("curPage", page.getCurPage());
		model.addAttribute("pageCount", page.getPageCount());
		return view;
	}

	/**
	 * 添加开销记录
	 * 
	 * @param fee
	 * @param remark
	 * @param date
	 * @param inp_txt
	 * @param model
	 * @return 添加记录 1：添加成功
	 * @throws Exception
	 */
	@RequestMapping(value = "/addCostFee")
	public String addCostFee(UserCostFee userCostFee,HttpServletRequest request, Model model)
			throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		int userId = SessionInfo.getVisitorId(request);
		map.put("date", userCostFee.getCostTime());
		map.put("inp_txt", userCostFee.getCostItem());
		map.put("remark", userCostFee.getCostRemark());
		map.put("fee", userCostFee.getCostFee());
		map.put("userId", userId);
		costFeeService.addCostFee(map);
		return "forward:costFee";
	}

	/**
	 * 查询历史开销记录
	 * 
	 * @param startDate
	 * @param endDate
	 * @param costItem
	 * @param startCostFee
	 * @param endCostFee
	 * @param costRemark
	 * @param model
	 * @return Model 结果集合
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value = "/historyCostFee")
	@ModelAttribute("lstCost")
	public List<UserCostFee> historyCostFee(String startDate, String endDate,
			String costItem, int startCostFee, int endCostFee,
			String costRemark,Page page) throws UnsupportedEncodingException {
		// 查询按天分组的数据
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startDate", DateTools.getTs(startDate));
		map.put("endDate", DateTools.getTs(endDate));
		map.put("costItem", new String(costItem.getBytes("iso8859-1"),"utf-8"));
		map.put("startCostFee", startCostFee);
		map.put("endCostFee", endCostFee);
		map.put("costRemark", costRemark);
		int count = costFeeService.getGroupHistoryCount(map);
		page.setRowCount(count);
		map.put("strLimit", page.getLimit());
		List<UserCostFee> lstCost = costFeeService.getGroupHistory(map);
		return lstCost;
	}

	/**
	 * 查询历史开销明细记录
	 * 
	 * @param startDate
	 * @param endDate
	 * @param costItem
	 * @param startCostFee
	 * @param endCostFee
	 * @param costRemark
	 * @param model
	 * @return Model 结果集合
	 * @throws Throwable
	 */
	@RequestMapping(value = "/queryHisDetail")
	@ResponseBody
	public List<UserCostFee> queryHisDetail(String costTime, String costItem,
			String startCostFee, String endCostFee, String costRemark,
			Model model, HttpServletRequest request) throws Throwable {
		// 查询分组数据明细
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("costTime", DateTools.getTs(costTime));
		map.put("costItem", costItem);
		map.put("startCostFee", startCostFee);
		map.put("endCostFee", endCostFee);
		map.put("costRemark", costRemark);
		List<UserCostFee> lstCost = costFeeService.getDetailHistory(map);
		model.addAttribute("lstCost", lstCost);
		return lstCost;
	}
	
	/**
	 * 修改开销记录
	 * 
	 * @param model
	 * @return Model 结果集合
	 * @throws Throwable
	 */
	@RequestMapping(value = "/updateCost")
	public String queryHisDetail(UserCostFee userCostFee,String costTime,
			Model model, HttpServletRequest request) throws Throwable {
		// 查询分组数据明细
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("costItem", userCostFee.getCostItem());
		map.put("costFee", userCostFee.getCostFee());
		map.put("costRemark", userCostFee.getCostRemark());
		map.put("costTime", costTime);
		map.put("costId", userCostFee.getCostId());
		costFeeService.updateCost(map);
		//model.addAttribute("lstCost", lstCost);
		return "forward:costFee";
	}
}
