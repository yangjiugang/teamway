package com.fc.flf.eagent.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fc.flf.common.domain.HouseInfo;
import com.fc.flf.common.domain.UserInfo;
import com.fc.flf.common.util.Page;
import com.fc.flf.eagent.service.IUserStudySaleHouseService;

@Controller
public class UserStudySaleHouseController{ 
	
	@Resource
	private IUserStudySaleHouseService userStudySaleHouse;
	
	/**
	 * 房源认售的楼盘信息
	 * @param page
	 * @param userInfo
	 * @return
	 */
    @RequestMapping(value ="/saleHouse")
   	public ModelAndView saleHouses(Page page , UserInfo userInfo){    
     	int saleHousesCount=userStudySaleHouse.getSaleHouseInfoCount(userInfo);
     	page.setRowCount(saleHousesCount);
    	List<HouseInfo> saleHouses=userStudySaleHouse.saleHouseInfo(page, userInfo);
   		ModelAndView view = new ModelAndView("/eagent/EIndexFang");
   		view.addObject("saleHouses",saleHouses);
   		view.addObject("salePage",page);
   		view.addObject("user", userInfo);
   		view.addObject("result", "true");
   		return view;
   	}
    
    /**
	 * 首页认售的楼盘信息
	 * @param page
	 * @param userInfo
	 * @return
	 */
    @RequestMapping(value ="/shouSaleHouse")
   	public ModelAndView shouSaleHouse(Page page , UserInfo userInfo){    
     	int saleHousesCount=userStudySaleHouse.getSaleHouseInfoCount(userInfo);
     	page.setRowCount(saleHousesCount);
    	List<HouseInfo> saleHouses=userStudySaleHouse.saleHouseInfo(page, userInfo);
   		ModelAndView view = new ModelAndView("/eagent/EIndexRenShou");
   		view.addObject("saleHouses",saleHouses);
   		view.addObject("salePage",page);
   		view.addObject("user", userInfo);
   		view.addObject("result", "true");
   		return view;
   	}
    
    /**
	 * 认售的楼盘信息ajax
	 * @param page
	 * @param userInfo
	 * @return
	 */
    @RequestMapping(value ="/saleHouseAjax")
    @ResponseBody
   	public List<HouseInfo> saleHousesAjax(Page page , UserInfo userInfo){    
     	int saleHousesCount=userStudySaleHouse.getSaleHouseInfoCount(userInfo);
     	page.setRowCount(saleHousesCount);
    	List<HouseInfo> saleHouses=userStudySaleHouse.saleHouseInfo(page, userInfo);   		
   		return saleHouses;
   	}
    
    /**
     * 学习过的楼盘信息
     * @param page
     * @param userInfo
     * @return
     */
    @RequestMapping(value ="/studyHouse")
   	public ModelAndView studyHouses(Page page , UserInfo userInfo){    
     	int studyHousesCount=userStudySaleHouse.getStudyHouseInfoCount(userInfo);
     	page.setRowCount(studyHousesCount);
    	List<HouseInfo> studyHouses=userStudySaleHouse.studyHouseInfo(page, userInfo);    	    	
   		ModelAndView view = new ModelAndView("/eagent/EIndexFangA");
   		view.addObject("studyHouses",studyHouses);
   		view.addObject("studyPage",page);
   		view.addObject("user", userInfo);
   		view.addObject("result", "true");
   		return view;
   	}
    
    /**
     * 学习过的楼盘信息ajax
     * @param page
     * @param userInfo
     * @return
     */
    @RequestMapping(value ="/studyHouseAjax")
    @ResponseBody
   	public List<HouseInfo> studyHousesAjax(Page page , UserInfo userInfo){    
    	int studyHousesCount=userStudySaleHouse.getStudyHouseInfoCount(userInfo);
     	page.setRowCount(studyHousesCount);
    	List<HouseInfo> studyHouses=userStudySaleHouse.studyHouseInfo(page, userInfo);   		
   		return studyHouses;
   	}
    
    /**
     * 经纪人的客户关注的楼盘信息
     * @param page
     * @param userInfo
     * @return
     */
    @RequestMapping(value ="/customerSkimHouse")
   	public ModelAndView customerSkimHouses(Page page , UserInfo userInfo){    
     	int skimHousesCount=userStudySaleHouse.getCustomerSkimHouseInfoCount(userInfo);
     	page.setRowCount(skimHousesCount);
    	List<HouseInfo> skimHouses=userStudySaleHouse.customerSkimHouseInfo(page, userInfo);     	
   		ModelAndView view = new ModelAndView("/eagent/EIndexFangB");
   		view.addObject("skimHouses",skimHouses);
   		view.addObject("customerSkimPage",page);
   		view.addObject("user", userInfo);
   		view.addObject("result", "true");
   		return view;
   	}
    
    /**
     * 学习过的楼盘信息ajax
     * @param page
     * @param userInfo
     * @return
     */
    @RequestMapping(value ="/skimHousesAjax")
    @ResponseBody
   	public List<HouseInfo> skimHousesAjax(Page page,UserInfo userInfo){    
    	int skimHousesCount=userStudySaleHouse.getCustomerSkimHouseInfoCount(userInfo);
     	page.setRowCount(skimHousesCount);
    	List<HouseInfo> skimHouses=userStudySaleHouse.customerSkimHouseInfo(page, userInfo);  		
   		return skimHouses;
   	}
    
    /**
     * 经纪人的客户关注的楼盘信息
     * @param page
     * @param userInfo
     * @return
     */
    @RequestMapping(value ="/customerCollectHouse")
   	public ModelAndView customerCollectHouses(Page page , UserInfo userInfo){    
     	int collectHousesCount=userStudySaleHouse.getCustomerCollectHouseInfoCount(userInfo);
     	page.setRowCount(collectHousesCount);
    	List<HouseInfo> collectHouses=userStudySaleHouse.customerCollectHouseInfo(page, userInfo);     	
    	System.out.println(collectHouses.size());
   		ModelAndView view = new ModelAndView("/eagent/EIndexFangC");
   		view.addObject("collectHouses",collectHouses);
   		view.addObject("customerCollectPage",page);
   		view.addObject("user", userInfo);
   		view.addObject("result", "true");
   		return view;
   	}
    
    /**
     * 学习过的楼盘信息ajax
     * @param page
     * @param userInfo
     * @return
     */
    @RequestMapping(value ="/collectHousesAjax")
    @ResponseBody
   	public List<HouseInfo> collectHousesAjax(Page page,UserInfo userInfo){    
    	int collectHousesCount=userStudySaleHouse.getCustomerCollectHouseInfoCount(userInfo);
     	page.setRowCount(collectHousesCount);
    	List<HouseInfo> collectHouses=userStudySaleHouse.customerCollectHouseInfo(page, userInfo);   	
   		return collectHouses;
   	}
    
}
