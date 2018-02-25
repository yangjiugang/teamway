package com.fc.flf.fparty.web;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fc.flf.common.domain.CustomerInfo;
import com.fc.flf.common.domain.UserCostFee;
import com.fc.flf.common.domain.UserEduInfo;
import com.fc.flf.common.domain.UserInfo;
import com.fc.flf.common.domain.UserInfoDetail;
import com.fc.flf.common.domain.UserPhotos;
import com.fc.flf.common.domain.UserTrainingExperience;
import com.fc.flf.common.domain.UserWorkExperience;
import com.fc.flf.common.util.CommonUtil;
import com.fc.flf.common.util.DateTools;
import com.fc.flf.common.util.Page;
import com.fc.flf.eagent.service.ICostFeeService;
import com.fc.flf.eagent.service.IUserDailyService;
import com.fc.flf.eagent.service.IUserPhotoService;
import com.fc.flf.eagent.web.EPublicNoticeForDate;
import com.fc.flf.fparty.service.ICustomerInfoService;
import com.fc.flf.fparty.service.IHoneyInfoService;


@Controller
public class MyFengMiContoller {
	@Resource
    private EPublicNoticeForDate addDateForModel;
	private final int IS_EML=-1;
	@Autowired
	private ICostFeeService costFeeService;
	@Resource
	private IHoneyInfoService his;
	@Resource
	private IUserDailyService userDailyService;
	@Resource
	private ICustomerInfoService customerInfoService;
	@Resource
	private FPublicHouseForDate addHouseToModel;
	@Resource
	private FPublicHouseGroupForDate addHouseGroupToModel;
	@Resource
	private IUserPhotoService iUserPhotoService;

	/**
	 * 我的蜂蜜
	 * 
	 * @return
	 */
	@RequestMapping(value = "/MyFengMi")
	public ModelAndView activity(CustomerInfo customer) {	
		UserInfo userInfo=customerInfoService.findUserInfo(customer);
		if (userInfo==null) {
			userInfo=new UserInfo();
			userInfo.setUserId(IS_EML);
		} 
		
		ModelAndView view=new ModelAndView("/fparty/MyFengMi");
		int userId = userInfo.getUserId();
		List<UserPhotos> photoList = iUserPhotoService.queryFivePhoto(userId);
		addDateForModel.addSaleHouseToDate(view, userInfo);
   		addDateForModel.addUserCollentGroupToDate(view, userInfo);
   		view.addObject("photoList", photoList);
   		view.addObject("customer", customer);
   		view.addObject("user", userInfo);
   		view.addObject("result", "true");
		return view;
	}
	
	/**
	 * Ta分享给我的楼盘
	 * @param customer
	 * @return
	 */
	@RequestMapping(value = "/TaRecommendHouse")
	public ModelAndView recommendHouse(CustomerInfo customer){		
		ModelAndView view=new ModelAndView("/fparty/Y611WDFMFang");
		addHouseToModel.addUserRecommedHouseToModel(view, customer);
		view.addObject("customer", customer);
		return view;
	}
	
	/**
	 * Ta分享给我的旅游购房团
	 * @param customer
	 * @return
	 */
	@RequestMapping(value = "/TaRecommendHouseGroup")
	public ModelAndView recommendHouseGroup(CustomerInfo customer){		
		ModelAndView view=new ModelAndView("/fparty/Y611WDFMLygft");
		addHouseGroupToModel.addCustomerRecommendHouseGroupToModel(view, customer);
		view.addObject("customer", customer);
		return view;
	}
	
	
	
	/**
	 * 我的蜂蜜开销记录页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/myFengMiCostFee")
	public String myFengMiCostFee(Model model, Page page) {
		model.addAttribute("curPage", 1);
		model.addAttribute("pageCount", 1);
		return "/fparty/MyFengMiCostFee";
	}
	
	/**
	 * 查询开销记录页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/queryMyFengMiCostFee")
	public String queryMyFengMiCostFee(String startDate, String endDate,
			String costItem, String startCostFee, String endCostFee,
			String costRemark,Page page,Model model) {
		// 查询按天分组的数据
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startDate", DateTools.getTs(startDate));
		map.put("endDate", DateTools.getTs(endDate));
		map.put("costItem", costItem);
		map.put("startCostFee", startCostFee);
		map.put("endCostFee", endCostFee);
		map.put("costRemark", costRemark);
		int count=costFeeService.getGroupHistoryCount(map);
		
		page.setRowCount(count);
		map.put("strLimit", page.getLimit());
		
		List<UserCostFee> lstCost = costFeeService.getGroupHistory(map);
		
		model.addAttribute("lstCost", lstCost);
		model.addAttribute("sumSize", lstCost.size());
		// 总金额
		model.addAttribute("sumFee", calSumFee(lstCost));
		// 回传条件
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		model.addAttribute("costItem", costItem);
		model.addAttribute("startCostFee", startCostFee);
		model.addAttribute("endCostFee", endCostFee);
		model.addAttribute("costRemark", costRemark);
		// 分页
		model.addAttribute("curPage", page.getCurPage());
		model.addAttribute("pageCount", page.getPageCount());
		return "/fparty/MyFengMiCostFee";
	}
	
	/**
	 * 计算总金额
	 * @param lstCost
	 * @return
	 */
	private int calSumFee(List<UserCostFee> lstCost){
		int sumFee=0;
		// 计算总金额
		for(UserCostFee userCostFee:lstCost){
			sumFee+=userCostFee.getCostFee();
		}
		return sumFee;
	}
	
	/**
	 * 查询开销详细记录
	 * 
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value = "/queryDetailCostFee")
	@ResponseBody
	public List<UserCostFee> queryDetailCostFee(String costTime,
			String costItem, String startCostFee, String endCostFee,
			String costRemark, Model model) throws UnsupportedEncodingException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("costTime", DateTools.getTs(costTime));
		map.put("costItem", costItem);
		map.put("startCostFee", startCostFee);
		map.put("endCostFee", endCostFee);
		map.put("costRemark", new String(costRemark.getBytes("iso8859-1"),"UTF-8"));
		List<UserCostFee> lstCost = costFeeService.getDetailHistory(map);
		model.addAttribute("lstCost", lstCost);
		model.addAttribute("resultSize", lstCost.size());
		return lstCost;
	}
	
	/**
	 * 根据用户ID得到蜂蜜详情
	 * @param customerId
	 * @return
	 */
	@RequestMapping(value = "/honeyInfo")
	public String getHoneyInfo(Model model){
		UserInfo userInfo = his.getUserInfo();
		UserInfoDetail userInfoDetail = his.getUserInfoDetail();
		UserEduInfo userEduInfo = his.getUserEduInfo();
		UserTrainingExperience userTrainingExperience = his.getUserTrainingExperience();
		UserWorkExperience userWorkExperience = his.getUserWorkExperience();
		String email = his.getEmail();
		model.addAttribute("userInfo",userInfo);
		model.addAttribute("userInfoDetail",userInfoDetail);
		model.addAttribute("userEduInfo",userEduInfo);
		model.addAttribute("email",email);
		model.addAttribute("userTrainingExperience",userTrainingExperience);
		model.addAttribute("userWorkExperience",userWorkExperience);
		return "/fparty/HoneyInfo";
	}
	
	@RequestMapping(value = "/myFengMiDaily")
	public String myFengMiDaily(Model model,Page page) throws Exception {
		model.addAttribute("dailys", CommonUtil.toJson(userDailyService.findDailyByCusId(page)));
		model.addAttribute("dailyCount", userDailyService.findDailyCountByCusId());
		model.addAttribute("curPage", page.getCurPage());
		model.addAttribute("pageCount", page.getPageCount());
		return "/fparty/MyFengMiDaily";
	}
}
