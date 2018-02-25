package com.fc.flf.eagent.web;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fc.flf.common.domain.HouseGroupInfo;
import com.fc.flf.common.domain.HouseInfo;
import com.fc.flf.common.domain.UserEduInfo;
import com.fc.flf.common.domain.UserFamilyInfo;
import com.fc.flf.common.domain.UserFriends;
import com.fc.flf.common.domain.UserInfo;
import com.fc.flf.common.domain.UserInfoDetail;
import com.fc.flf.common.domain.UserTrainingExperience;
import com.fc.flf.common.domain.UserWorkExperience;
import com.fc.flf.common.util.CommonUtil;
import com.fc.flf.common.util.Page;
import com.fc.flf.eagent.service.IMyInformationService;
import com.fc.flf.eagent.service.IUserFriendsService;
import com.fc.flf.eagent.service.IUserStudySaleHouseService;
import com.fc.flf.fparty.service.IVisitorHouseGroupService;

/**
 * 易介宝的个人主页controller
 * @author Administrator
 *
 */
@Controller
public class UserIndexGerenController {
	@Resource
    private EPublicNoticeForDate addDateForModel;
	@Resource
	private IUserStudySaleHouseService userService;  
	@Resource
	private IVisitorHouseGroupService houseGroupService;
	@Resource
	private IMyInformationService mis;
	@Resource
	private IUserFriendsService userFriendsService;
	
	@RequestMapping(value ="/eagent_home_EIndexGeren")
   	public ModelAndView indexGeren(UserInfo userInfo){    
		//好友
		Map<String, Object> map=new HashMap<String, Object>();
		Page page = new Page();
		page.setCurPage(1);
		page.setPageSize(5);
		map.put("userId", userInfo.getUserId());
		List<UserFriends> userFriends = userFriendsService.selectFriendsByUserIdBeforeSum(page,map);		

   		ModelAndView view = new ModelAndView("/eagent/EIndexGeren");
   		addDateForModel.addSaleHouseToDate(view, userInfo);
   		addDateForModel.addUserCollentGroupToDate(view, userInfo);
   		view.addObject("user", userInfo);
   		view.addObject("result", "true");
   		view.addObject("userFriends", userFriends);
   		return view;
   	}
	
	/**
	 * 个人主页到得经纪人认售的房源分页ajax
	 * @param page
	 * @param userInfo
	 * @return
	 */
	@RequestMapping(value ="/gerenSaleHouse")
	@ResponseBody
	public List<HouseInfo> saleHouse(Page page,UserInfo userInfo){	
		page.setPageSize(5);   //设置分页的条数为5条	
		int saleCount=userService.getSaleHouseInfoCount(userInfo);
		page.setRowCount(saleCount);
		List<HouseInfo> saleHouses=userService.saleHouseInfo(page, userInfo); //到得认售房源
		return saleHouses;
	}
	/**
	 * 个人主页到得经纪人收藏房团分页ajax
	 * @param page
	 * @param userInfo
	 * @return
	 */
	@RequestMapping(value ="/gerenUserCollectHouseGroup")
	@ResponseBody
	public List<HouseGroupInfo> gerenUserCollectHouseGroup(Page page,UserInfo userInfo){	
		page.setPageSize(5);  //设置分页的条数为5条
		int userCollectCount=houseGroupService.getUserCollectHouseGroupCount(userInfo); //根据经纪人到得经纪人收藏的房团总条数 （分页用）
		page.setRowCount(userCollectCount);
		List<HouseGroupInfo> userCollectHouseGroupInfo=houseGroupService.listUserCollectHouseGroupInfo(page, userInfo); //得到经纪人收藏的房团
		return userCollectHouseGroupInfo;
	}
	
	/**
	 * 易介宝个人首页资料
	 * @param model
	 * @return
	 */
	@RequestMapping(value ="/eagent_geren_info")
	public String MyInfo(Model model){
		UserInfo userInfo = mis.getUserInfo();
		UserInfoDetail userInfoDetail = mis.getUserInfoDetail();
		UserEduInfo userEduInfo = mis.getUserEduInfo();
		String email = mis.getEmail();
		UserTrainingExperience userTrainingExperience = mis.getUserTrainingExperience();
		UserWorkExperience userWorkExperience = mis.getUserWorkExperience();
		List<UserFamilyInfo> userFamilyInfoList = mis.getUserFamilyInfo();
		model.addAttribute("userInfo",userInfo);
		model.addAttribute("userInfoDetail",userInfoDetail);
		model.addAttribute("userEduInfo",userEduInfo);
		model.addAttribute("email",email);
		model.addAttribute("userTrainingExperience",userTrainingExperience);
		model.addAttribute("userWorkExperience",userWorkExperience);
		model.addAttribute("userFamilyInfoList",userFamilyInfoList);
		return"/eagent/IndexGerenZiliao";
	}
	
	/**
	 * 资料--基本资料提交按钮
	 * @param userInfoDetail
	 * @param userInfo
	 * @return
	 */
	@RequestMapping(value ="/updateuserInfoDetailPartOne")
	@ResponseBody
	public int updateUserInfoPartOne(UserInfoDetail userInfoDetail,UserInfo userInfo){

		mis.updateUserInfoPartOneUserInfoDetail(userInfoDetail);
		mis.updateUserInfoPartOneUserInfo(userInfo);
		return 1;
	}
	
	/**
	 * 资料--证件及照片提交按钮
	 * @param userInfoDetail
	 * @return
	 */
	@RequestMapping(value ="/updateuserInfoDetailPartTwo")
	@ResponseBody
	public int updateUserInfoPartTwo(UserInfoDetail userInfoDetail){
		mis.updateUserInfoPartTwoUserInfoDetail(userInfoDetail);
		return 1;
	}
	
	/**
	 * 资料--联系方式提交按钮
	 * @param userInfoDetail
	 * @return
	 */
	@RequestMapping(value ="/updateUserInfoPartThree")
	@ResponseBody
	public int updateUserInfoPartThree(UserInfoDetail userInfoDetail,UserInfo userInfo){
		mis.updateUserInfoPartThreeUserInfoDetail(userInfoDetail);
		mis.updateUserInfoPartThreeUserInfo(userInfo);
		return 1;
	}
	
	/**
	 * 资料--教育提交按钮
	 * @param userInfoDetail
	 * @return
	 */
	@RequestMapping(value ="/updateUserInfoPartFour")
	@ResponseBody
	public int updateUserInfoPartFour(UserEduInfo userEduInfo){
		mis.updateUserInfoPartFourUserEduInfo(userEduInfo);
		return 1;
	}
	
	/**
	 * 资料--培训经历提交按钮
	 * @param userInfoDetail
	 * @return
	 */
	@RequestMapping(value ="/updateUserInfoPartFive")
	@ResponseBody
	public int updateUserInfoPartFive(UserTrainingExperience userTrainingExperience){
		mis.updateUserInfoPartFiveUserTrainingExperience(userTrainingExperience);
		return 1;
	}
	
	/**
	 * 资料--工作经历提交按钮
	 * @param userInfoDetail
	 * @return
	 */
	@RequestMapping(value ="/updateUserInfoPartSix")
	@ResponseBody
	public int updateUserInfoPartSix(UserWorkExperience userWorkExperience){
		mis.updateUserInfoPartSixUserWorkExperience(userWorkExperience);
		return 1;
	}
	
	/**
	 *新增家庭关系
	 * @param userFamilyInfo
	 * @return
	 */
	@RequestMapping(value ="/insertUserFamilyInfo")
	@ResponseBody
	public List<UserFamilyInfo> insertUserFamilyInfo(UserFamilyInfo userFamilyInfo){
			mis.insertUserFamilyInfo(userFamilyInfo);
			List<UserFamilyInfo> list = mis.getUserFamilyInfo();
		return list;
	}
	
	/**
	 * 更新兴趣爱好
	 * @param userInfoDetail
	 * @return
	 */
	@RequestMapping(value ="/updateHobbies")
	@ResponseBody
	public int updateHobbies(UserInfoDetail userInfoDetail){
		mis.updateHobbies(userInfoDetail);
		return 1;
	}
}
