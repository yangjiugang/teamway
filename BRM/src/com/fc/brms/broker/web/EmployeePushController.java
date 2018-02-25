package com.fc.brms.broker.web;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fc.brms.account.web.LoginController;
import com.fc.brms.broker.service.IEmployeePushService;
import com.fc.brms.common.domain.CfgOrganization;
import com.fc.brms.common.domain.CfgPost;
import com.fc.brms.common.domain.DateProperty;
import com.fc.brms.common.domain.EmployeeInfo;
import com.fc.brms.common.domain.EmployeePushCash;
import com.fc.brms.common.domain.StatisticsDomain;
import com.fc.brms.common.service.IOrgStructureService;
import com.fc.brms.common.util.Page;
import com.fc.brms.common.util.SessionInfo;
import com.fc.brms.common.util.WriteExcel;

/**
 * 提成管理controller
 * @author 冯鹄
 *
 */
@Controller
public class EmployeePushController {
	@Resource
	private IEmployeePushService employeePushService;
	@Resource
	private IOrgStructureService iOrgStructureService;

	private static Log logger = LogFactory.getLog(LoginController.class);
	
	@RequestMapping(value="/pushIndex")
	public String pushIndex(){
		return "/broker/YGAdministrationTCGL";
	}
	@RequestMapping(value="/pushLineTC")
	public String pushLine(HttpServletRequest request,DateProperty dateProperty,Model model){
		model.addAttribute("dateProperty", dateProperty);
		return "/broker/TC";
	}
	@RequestMapping(value="/pushExcel")
	public String pushExcel(){
		return "/broker/YGAdministrationDYXCFLSC1";
	}

	@RequestMapping(value="/pushAdjust")
	public String pushAdjust(HttpServletRequest request,Model model,EmployeePushCash pushCash){
		EmployeePushCash cash = employeePushService.findPushForPushId(pushCash);
		model.addAttribute("cash", cash);
		return  "/broker/TCTZ";
	}
	
	@RequestMapping(value="/pushNewly")
	public String pushNewly(HttpServletRequest request,Model model,EmployeePushCash pushCash){
		EmployeePushCash cash = employeePushService.findPushForPushId(pushCash);
		model.addAttribute("cash", cash);
		return  "/broker/TCXZ";
	}
	
	@RequestMapping(value="/historyPush")
	public String historyPush(HttpServletRequest request,Model model){
		List<CfgOrganization> cfgOrganizations = iOrgStructureService.findOrganization(); 
		if(cfgOrganizations!=null){
			int firstId = cfgOrganizations.get(0).getOrganizationId();
			model.addAttribute("firstId", firstId);
		}
		model.addAttribute("cfgOrganizations", cfgOrganizations);
		return "/broker/HistoryPush";
	}
	
	@RequestMapping(value="/findPostAjax")
	@ModelAttribute("datas")
	public List<CfgPost> findPostAjax(int organizationId){
		List<CfgPost> cfgPosts = iOrgStructureService.findPostForOrganization(organizationId);
		return cfgPosts;
	}
	 
	/**
	 * 添加提成
	 * @param pushDate
	 * @param pushMoney
	 * @param employeeId
	 * @return
	 */
	@RequestMapping(value="/pushNewlyAjax")
	@ResponseBody
	public String pushNewlyAjax(HttpServletRequest request,int year,int month,int pushMoney,int employeeId,String type) throws Exception
	{	
//		int createUser = SessionInfo.getVisitorId(request);
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String beginTime="",endTime="",success="添加成功";
		if("thisMonth"==type||"thisMonth".equals(type)){
			//当前月的第一天      
			calendar.set(GregorianCalendar.DAY_OF_MONTH, 1); 
			beginTime =dateFormat.format(calendar.getTime());
		        
	        //当前月的最后一天   
		    calendar.set( Calendar.DATE, 1 );
		    calendar.roll(Calendar.DATE, - 1 );
		    endTime = dateFormat.format(calendar.getTime());
		}else{
			calendar.set(year, (month-1), 1);
			calendar.set(GregorianCalendar.DAY_OF_MONTH, 1); 
			beginTime =dateFormat.format(calendar.getTime());
		        
		    calendar.set( Calendar.DATE, 1 );
		    calendar.roll(Calendar.DATE, - 1 );
		    endTime = dateFormat.format(calendar.getTime());
		}
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("pushStartDate", beginTime);
		map.put("pushEndDate", endTime);
		map.put("employeeId", employeeId);
		boolean flag = employeePushService.findEmployeePushIsTrue(map);
		if(flag){
			map.put("pushMoney", pushMoney);
			map.put("companyId", 1);
			map.put("createDate", new Date());
			map.put("createUser", 1);
			employeePushService.insertPushCash(map);		
		}else{
			success = "该提成记录已存在！如需修改，请前往修改提成记录";
		}	
		return success;		
	}	
	
	/**
	 * 提成管理默认显示页面
	 * @param request
	 * @param model
	 * @param item
	 * @return
	 */
	@RequestMapping(value="/pushLook")
	public String pushLook(HttpServletRequest request,Model model,String item){
		String[] pu = item.split(",");
		int size = pu.length;
		int employee = 0;
		int employeeId = 0;
		StringBuffer items = new StringBuffer();
		for(int i  = 0 ; i < size ; i++){
			employee=Integer.parseInt(pu[i].toString());
			if(employeeId != employee){
				employeeId = employee;
				items.append(employeeId);
				if(i!=(size-1)){
					items.append(",");					
				}
			}			
		}
		List<EmployeeInfo> employeeInfos  = employeePushService.findEmployeeForEployeeId(items.toString());
		int firstId = 0;
		if(employeeInfos!=null){
			firstId = employeeInfos.get(0).getEmployeeId();	
		}
		model.addAttribute("employeeInfos", employeeInfos);
		model.addAttribute("firstId", firstId);
		return  "/broker/TCCX";		
	}

	/**
	 * 根据employeeId查询提成信息
	 * @param request
	 * @param employeeId
	 * @return List<EmployeePushCash>
	 */
	@RequestMapping(value="/findPushCashForEmployeeId")
	@ModelAttribute("rows")
	public List<EmployeePushCash> findPushCashForEmployeeId(HttpServletRequest request,int employeeId){
		List<EmployeePushCash> cashs = employeePushService.findPushForEmployeeId(employeeId);
		return cashs;
	}
	
	/**
	 * 提成调整
	 * @param request
	 * @param cash
	 * @return EmployeePushCash
	 */
	@SuppressWarnings("deprecation")
	@RequestMapping(value="/TCTZAdjust")
	@ResponseBody
	public void TCTZAdjust(HttpServletRequest request,int employeeId,String pushStartDate,String pushEndDate,int pushMoney){
		System.out.println("pushStartDate  =  "+pushStartDate);
		Map<String, Object> map = new HashMap<String, Object>();
		Date startDate = new Date(pushStartDate);
		Date endDate = new Date(pushEndDate);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		map.put("employeeId", employeeId);
		map.put("pushStartDate", dateFormat.format(startDate));
		map.put("pushEndDate", dateFormat.format(endDate));
		map.put("pushMoney", pushMoney);
		employeePushService.updatePush(map);
	}
	
	/**
	 * 查询当月的提成信息
	 * @param request
	 * @param page
	 * @return
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value="/pushThisYear")
	@ModelAttribute("rows")
	public List<EmployeePushCash> pushThisYear(HttpServletRequest request,Page page,DateProperty dateProperty)throws Exception {
		String year = dateProperty.getYear();
		String month = dateProperty.getMonth();
		String theYear = "";
		Map<String, Object> map = new HashMap<String, Object>();	
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		int organizationId = employeePushService.findOrganizationId(2);
//		int employeeId = SessionInfo.getVisitorId(request);
		map.put("organizationId", organizationId);
		if(year==null&&month==null){
			//当前月的第一天      
			calendar.set(GregorianCalendar.DAY_OF_MONTH, 1); 
		    String beginTime=dateFormat.format(calendar.getTime());
		        
	        //当前月的最后一天   
		    calendar.set( Calendar.DATE, 1 );
		    calendar.roll(Calendar.DATE, - 1 );
	        String endTime=dateFormat.format(calendar.getTime());
			map.put("startDate", beginTime);
			map.put("endDate", endTime);
		}else if(month.equals("13")||month=="13"){
			map.put("pushDate", year);		
		}else{
			calendar.set(Integer.parseInt(dateProperty.getYear()), Integer.parseInt(dateProperty.getMonth()), 1);
			//当前月的第一天      
			calendar.set(GregorianCalendar.DAY_OF_MONTH, 1); 
		    String beginTime=dateFormat.format(calendar.getTime());
		        
	        //当前月的最后一天   
		    calendar.set( Calendar.DATE, 1 );
		    calendar.roll(Calendar.DATE, - 1 );
	        String endTime=dateFormat.format(calendar.getTime());
			map.put("startDate", beginTime);
			map.put("endDate", endTime);
			}
		List<EmployeePushCash> cashs = employeePushService.findPushForDate(map);
		return cashs;
	}	
	
	/**
	 * 条件搜索
	 * @param employeeInfo
	 * @param trem 关键字
	 * @return List<EmployeePushCash>
	 */
	@RequestMapping(value="/findPushForTrem")
	@ModelAttribute("rows")
	public List<EmployeePushCash> findPushForTrem(EmployeeInfo employeeInfo,String trem){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("organizationId", employeeInfo.getOrganizationId());
//		map.put("organizationName", employeeInfo.getOrganizationName());
		map.put("postId", employeeInfo.getPostId());
//		map.put("postName", employeeInfo.getPostName());
		map.put("jobGradeId", employeeInfo.getJobGradeId());
//		map.put("jobGradeName", employeeInfo.getJobGradeName());
		map.put("jobLevelId", employeeInfo.getJobLevelId());
//		map.put("jobLevelName", employeeInfo.getJobLevelName());
		map.put("trem", trem);
		List<EmployeePushCash> cashs = employeePushService.findPushForDate(map);
		return cashs;		
	}
	
	/**
	 * 默认历史提成结构分析
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/historyPushJqGrid")
	@ModelAttribute("rows")
	public List<EmployeePushCash> historyPush(HttpServletRequest request)throws Exception{
//		int employeeId = SessionInfo.getVisitorId(request);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM");
		String date = dateFormat.format(new Date());
		int organizationId = employeePushService.findOrganizationId(2);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("organizationId", organizationId);
		map.put("date", date);
		List<EmployeePushCash> cashs = employeePushService.historyPushAnalyse(map);
		return cashs;
	}

	@RequestMapping(value="/historyPushSumAvg")
	@ResponseBody
	public StatisticsDomain FindAvgAndSum(int organizationId,String startDate,String endDate,int postId){
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM");
		String date = dateFormat.format(new Date());
		Map<String, Object> map = new HashMap<String, Object>();
		Double avg; 
		int sum;
		StatisticsDomain domain = new StatisticsDomain();
		if(organizationId==0&&startDate==""&&endDate==""&&postId==0){
			organizationId = employeePushService.findOrganizationId(2);
			map.put("organizationId", organizationId);
			map.put("date", date);
			avg = employeePushService.historyPushAnalyseAvg(map);
		    sum = employeePushService.historyPushAnalyseSum(map);
			domain.setAvg(avg);
			domain.setSum(sum);
			System.out.println("avg = "+avg +" sum = "+sum);
		}else{
			if(startDate!=""&&endDate!=null){
				map.put("startDate", startDate);
				map.put("endDate", endDate);			
			}
			if(organizationId!=0){
				map.put("organizationId", organizationId);
//				map.put("organizationName", organizationName.trim());			
			}
			if(postId!=0){
				map.put("postId", postId);
//				map.put("postName", postName.trim());
			}
			avg = employeePushService.historyPushAnalyseAvg(map);
		    sum = employeePushService.historyPushAnalyseSum(map);
			domain.setAvg(avg);
			domain.setSum(sum);
			System.out.println("avg = "+avg +" sum = "+sum);
		}
		return domain;
	}
	
	/**
	 * 条件搜索历史提成结构分析
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/historyPushTerm")
	@ModelAttribute("rows")
	public List<EmployeePushCash> historyPushTerm(HttpServletRequest request,String startDate,String endDate,
		   int organizationId,String organizationName,int postId,String postName){
		Map<String, Object> map = new HashMap<String, Object>();
		if(startDate!=""&&endDate!=null){
			map.put("startDate", startDate);
			map.put("endDate", endDate);			
		}
		if(organizationId!=0&&organizationName!=""){
			map.put("organizationId", organizationId);
			map.put("organizationName", organizationName.trim());			
		}
		if(postId!=0&&postName!=""){
			map.put("postId", postId);
			map.put("postName", postName.trim());
		}
		List<EmployeePushCash> cashs = employeePushService.historyPushAnalyse(map);
		return cashs;
	}
	
	@RequestMapping(value="/produceExcel")
	@ResponseBody
	public String produceExcel(String excelType,String filePath){		
		String[] type = excelType.split(",");
		int length = type.length;
		Map<String, Object> map = new HashMap<String, Object>();
		String path = "D:/"+(new SimpleDateFormat("yyyy-MM-dd_hh_mm_ss").format(new Date()))+".xls";
		String success = "文件生成成功";
		for(int i = 0 ; i < length ; i++){
			switch (Integer.parseInt(type[i])) {
			case 0:
				break;
			case 1:
				
				break;
			case 2:
				
				break;
			case 3:
				
				break;
			case 4:
				List<EmployeePushCash> cashs = employeePushService.findPushForDate(map);
				new WriteExcel(cashs, new File(path));				
				break;
			}
		}
	return success;
	}
	
	@RequestMapping(value="/PushisNullOrNotNull")
	@ResponseBody
	public boolean PushisNullOrNotNull(int employeeId){
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String beginTime="",endTime="";
		//当前月的第一天      
		calendar.set(GregorianCalendar.DAY_OF_MONTH, 1); 
		beginTime =dateFormat.format(calendar.getTime());
	        
        //当前月的最后一天   
	    calendar.set( Calendar.DATE, 1 );
	    calendar.roll(Calendar.DATE, - 1 );
	    endTime = dateFormat.format(calendar.getTime());
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("pushStartDate", beginTime);
		map.put("pushEndDate", endTime);
		map.put("employeeId", employeeId);
		boolean flag = employeePushService.findEmployeePushIsTrue(map);
		return flag;
	}
}
