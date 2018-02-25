package com.fc.flf.fparty.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fc.flf.common.domain.CustomerInfo;
import com.fc.flf.common.domain.EventInfo;
import com.fc.flf.common.util.Page;
import com.fc.flf.fparty.service.IEventInfoService;

@Controller
public class ActivityContoller {
	@Resource
	private FPublicActivityForDate addActivityToModel;
	@Resource
	private IEventInfoService eventInfoService;
	@Resource
	private FPublicNoticeForData fPublicNoticeForData;	
	@Resource
	private UserInfoAndMsgCountForData userInfoAndMsgCountForData;
   
	/**
	 * 我的活动
	 * @return
	 * @throws Exception 
	 */
    @RequestMapping(value="/activity")
	public ModelAndView activity(HttpServletRequest request,Model model,CustomerInfo customer) throws Exception{
    	ModelAndView view=new ModelAndView("/fparty/Activity");
    	addActivityToModel.addCustomerApplyActivityToModel(view, customer);
    	addActivityToModel.addCustomerJoinActivityToModel(view, customer);
    	addActivityToModel.addCustomerSkimActivityToModel(view, customer);
    	addActivityToModel.addUserRecommendActivityToModel(view, customer);
    	fPublicNoticeForData.addDataToModel(model);
    	userInfoAndMsgCountForData.addDataToModel(model, request);
    	view.addObject("customerInfoDetail",customer);
		view.addObject("result", "true");
		return view;
	}
	
    /**
     * 我关注的活动
     * @param page
     * @param customer
     * @return
     */
    @RequestMapping(value="/attentionActivity")
    @ResponseBody
    public List<EventInfo> attentionActivityEventInfo(Page page , CustomerInfo customer){
    	int count=eventInfoService.getAttenActivityCount(customer);
    	page.setRowCount(count);    	
    	return eventInfoService.attentionActivity(page, customer); 
    }
    
   
    
    /**
     * 我报名的活动
     * @param page
     * @param customer
     * @return
     */
    @RequestMapping(value="/applyActivity")
    public List<EventInfo> applyActivityEventInfo(Page page , CustomerInfo customer){
    	int count=eventInfoService.getApplyActivityCount(customer);
    	page.setRowCount(count);
    	List<EventInfo> list=eventInfoService.applyActivity(page, customer);
    	return list;
    }
    
    /**
     * 我已经参加的活动
     * @param page
     * @param customer
     * @return
     */
    @RequestMapping(value="/joinActivity")
    public List<EventInfo> joinActivityEventInfo(Page page , CustomerInfo customer){
    	int count=eventInfoService.getJoinActivityCount(customer);
    	page.setRowCount(count);
    	List<EventInfo> list=eventInfoService.joinActivity(page, customer);
    	return list;
    }
    
    /**
     * 经济人推荐的活动
     * @param page
     * @param customer
     * @return
     */
    @RequestMapping(value="/recommendActivity")
    public List<EventInfo> recommendActivityEventInfo(Page page , CustomerInfo customer){
    	int count=eventInfoService.getRecommendActivityCount(customer);
    	page.setRowCount(count);
    	List<EventInfo> list=eventInfoService.recommendActivity(page, customer);
    	return list;
    }
}
