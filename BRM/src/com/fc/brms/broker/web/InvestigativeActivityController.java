package com.fc.brms.broker.web;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.jfree.data.general.DefaultPieDataset;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fc.brms.broker.service.IExamPapersService;
import com.fc.brms.broker.service.IQuestionLibraryService;
import com.fc.brms.broker.service.IQuestionTestService;
import com.fc.brms.common.domain.QuestionLibrary;
import com.fc.brms.common.domain.QuestionPaperEmployeeAnswer;
import com.fc.brms.common.domain.QuestionPapersDetail;
import com.fc.brms.common.domain.QuestionPapersEmployees;
import com.fc.brms.common.domain.QuestionTest;
import com.fc.brms.common.util.Page;
import com.fc.brms.common.util.SessionInfo;

/**
 * 参与调查活动
 * @author Administrator
 *
 */
@Controller
public class InvestigativeActivityController {
	@Resource
	private IQuestionTestService questionTestService;
	@Resource
	private IQuestionLibraryService questionLibraryService;
	@Resource
	private IExamPapersService examPapersService;
	
	//private Date employeeStartTime;  //考生的开考时间！！
	
	@RequestMapping(value="/broker_questionnaireTest")
	public String questionnaireTest(String[] rows,Page page,Model model,HttpServletRequest request){
		int testId=Integer.parseInt(rows[0]);  //得到调查活动的id号
		/*int visitorId=0;  //用户id
		try {
		  visitorId=SessionInfo.getVisitorId(request);
		} catch (Exception e) {
			e.printStackTrace();
		}*/
		QuestionTest questionTest=questionTestService.getQuestionTestByTestId(testId); //活动的基本情况
		int paperId=questionTest.getPaperId();
		/*Date endTime=questionTest.getTestEndTime();
		Date date=new Date();
		int time =(int)(endTime.getTime()-date.getTime())/(1000*60);
		if(time < questionTest.getTestDuration()){
			questionTest.setTestDuration(time);
		}*/
		//employeeStartTime = new Date();
		int subjectCount=examPapersService.findQuestionTypeCount(paperId,1);   //单选题总题数
		int subjectPointCount=examPapersService.findQuestionPointsCount(paperId,1); //单选题总分数
		
		int subjectCount2=examPapersService.findQuestionTypeCount(paperId,2);   //多选题总题数
		int subjectPointCount2=examPapersService.findQuestionPointsCount(paperId,2); //多选题总分数
		
		int subjectCount3=examPapersService.findQuestionTypeCount(paperId,3);   //问答题总题数
		int subjectPointCount3=examPapersService.findQuestionPointsCount(paperId,3); //问答题总分数 
		/*int testAnswer=questionTest.getTestAnswer();  //显示的方式
		page.setPage(1);
		if (testAnswer==0) {   //等于0 每页显示一题
			page.setRows(1);
		}else if(testAnswer==1){  //等于1 每页显示十题
			page.setRows(5);
		}
		int paperId=questionTest.getPaperId();
		int questionLibraryCount=questionLibraryService.findQuestionLibraryByPaperIdCount(paperId); //总条数
		page.setRecords(questionLibraryCount);  //设置总页数
		List<QuestionLibrary> questionLibraryList=questionLibraryService.findQuestionLibraryByPaperId(paperId, page); //得到问卷题目的集合
*/		model.addAttribute("questionTest", questionTest);
        model.addAttribute("subjectCount", subjectCount);
        model.addAttribute("subjectPointCount", subjectPointCount);
        model.addAttribute("subjectCount2", subjectCount2);
        model.addAttribute("subjectPointCount2", subjectPointCount2);
        model.addAttribute("subjectCount3", subjectCount3);
        model.addAttribute("subjectPointCount3", subjectPointCount3);
     //   model.addAttribute("employeeStartTime", employeeStartTime);
	//	model.addAttribute("questionLibraryList", questionLibraryList);
		return "/broker/DT";
	}
	
	/**
	 * ajax取得活动的基本情况
	 * @param rows
	 * @return
	 */
	@RequestMapping(value="/broker_surveyActivityDetails")
	@ResponseBody
	public QuestionTest surveyActivityDetails(String[] rows,HttpServletRequest request){
		int testId=Integer.parseInt(rows[0]);  //得到调查活动的id号
		QuestionPapersEmployees qpe=null;
		try {
			int visitorId=SessionInfo.getVisitorId(request);
			qpe=examPapersService.findQuestionPapersEmployees(testId,visitorId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		QuestionTest questionTest=questionTestService.getQuestionTestByTestId(testId); //活动的基本情况
		questionTest.setQpe(qpe);
		return questionTest;
	}
	
	/**
	 * 得到试卷的题目
	 * @param testId
	 * @param paperPage
	 * @return
	 */
	@RequestMapping(value="/broker_getPaper")
	@ModelAttribute("datas")
	public List<QuestionLibrary> getPaper(int testId,int paperId,Page paperPage,HttpServletRequest request){
		int visitorId=0;  //用户id
		try {
			visitorId=SessionInfo.getVisitorId(request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		int questionLibraryCount=questionLibraryService.findPapersIdCount(paperId); //总条数
		paperPage.setRecords(questionLibraryCount);  //设置总页数
		List<QuestionLibrary> questionLibraryList=questionLibraryService.findPapersId(paperId, paperPage); //得到问卷题目的集合
		for (QuestionLibrary ql : questionLibraryList) {
			QuestionPaperEmployeeAnswer qpea=new QuestionPaperEmployeeAnswer();
			qpea.setTestId(testId);
			qpea.setVisitorId(visitorId);
			int questionId=ql.getQuestionId();
			qpea.setQuestionId(questionId);
			qpea=examPapersService.findQuestionPaperEmployeeAnswer(qpea);
			String ac=null;
			try {
				ac=qpea.getAnswerContent();	
			} catch (Exception e) {
				ac=null;
			}
			if(ac!=null){
				ql.setCorrectAnswer(ac);	
			}
		}
		return questionLibraryList;
	}
	
	@RequestMapping(value="/broker_handExamPaper")
	@ResponseBody
	public List<Integer> handExamPaper(HttpServletRequest request,int testId) throws Exception{ 
		int totalScore=0;
		QuestionPaperEmployeeAnswer qpea=new QuestionPaperEmployeeAnswer(); 
		qpea.setTestId(testId);
		int visitorId=0;  //用户id
		try {
			visitorId=SessionInfo.getVisitorId(request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		qpea.setVisitorId(visitorId);
		QuestionTest questionTest=questionTestService.getQuestionTestByTestId(testId); //活动的基本情况
		int paperId=questionTest.getPaperId();
		int testEC=questionTest.getTestEnableCnt();  //调查的有效数
		List<QuestionPaperEmployeeAnswer> listQpea=examPapersService.findQuestionPaperEmployeeAnswerCon(qpea);  //考试记录questionId  visitorId testId
		for (QuestionPaperEmployeeAnswer qp : listQpea) {
			QuestionPapersDetail qpd=new QuestionPapersDetail();
			int qId=qp.getQuestionId();
			QuestionLibrary ql=questionLibraryService.findQuestionLibraryById(qId);   // 得到问题的详细
			int qt=ql.getQuestionType();
			if(qt==1||qt==2){
				String ans=getQuestion(ql);
				String qpAns=qp.getAnswerContent();
				if(ans.equals(qpAns)){
					qpd.setPaperId(paperId);
					qpd.setQuestionId(qId);
					qpd=examPapersService.findQuestionPapersDetail(qpd);
				//	QuestionPaperEmployeeAnswer qpea2=new QuestionPaperEmployeeAnswer();
					qp.setIsRight(1);     
					qp.setScore(qpd.getQuestionPoints());
					examPapersService.updateQuestionPaperEmployeeAnswer(qp);
				}
			}
			totalScore=totalScore+qp.getScore();
		}
		QuestionPapersEmployees qpe=new QuestionPapersEmployees();
		qpe.setIsSubmit(1);
		qpe.setScore(totalScore);
		qpe.setTestId(testId);
		qpe.setVisitorId(visitorId);
		if(testEC > listQpea.size()){
			qpe.setIsAvailabe(0);
		}
		examPapersService.updateQuestionPapersEmployees(qpe);
		
		int qlCount=questionLibraryService.findPapersIdCount(paperId); //总条数
		int qlCount2=listQpea.size();
		List<Integer> list=new ArrayList<Integer>();
		list.add(qlCount);
		list.add(qlCount2);
		return list;
	}
	
	/**
	 * 提交成功
	 * @param qlCount
	 * @param qlCount2
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/broker_success")
	public String brokerSuccess(int qlCount,int qlCount2,Model model){
		model.addAttribute("qlCount", qlCount);
		model.addAttribute("qlCount2", qlCount2);
		return "/broker/DT3";
	}
	
	
	/**
	 * 得到正确答案！
	 * @param ql
	 * @return
	 */
	public static String getQuestion(QuestionLibrary ql){
		String ans="";
		int isRight=ql.getIsRight();
		int isRight2=ql.getIsRight2();
		int isRight3=ql.getIsRight3();
		int isRight4=ql.getIsRight4();
		int isRight5=ql.getIsRight5();
		int isRight6=ql.getIsRight6();
		int isRight7=ql.getIsRight7();
		int isRight8=ql.getIsRight8();
		int isRight9=ql.getIsRight9();
		if(isRight==1){
			ans=ans+","+ql.getAnswer();
		}
		if(isRight2==1){
			ans=ans+","+ql.getAnswer2();
		}
		if(isRight3==1){
			ans=ans+","+ql.getAnswer3();
		}
		if(isRight4==1){
			ans=ans+","+ql.getAnswer4();
		}
		if(isRight5==1){
			ans=ans+","+ql.getAnswer5();
		}
		if(isRight6==1){
			ans=ans+","+ql.getAnswer6();
		}
		if(isRight7==1){
			ans=ans+","+ql.getAnswer7();
		}
		if(isRight8==1){
			ans=ans+","+ql.getAnswer8();
		}
		
		if(isRight9==1){
			ans=ans+","+ql.getAnswer9();
		}
		if(ans.startsWith(",")){
			ans=ans.substring(1);
		}
		return ans;
	}
	
	/**
	 * 调查对象提交所做问题
	 * @param request
	 * @param answer
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/broker_saveExamPaper")
	@ResponseBody
	public boolean saveExamPaper(HttpServletRequest request,QuestionPaperEmployeeAnswer answer) throws Exception{
		boolean ok=false;
		int visitorId=SessionInfo.getVisitorId(request);
		answer.setVisitorId(visitorId);   //问卷调查对象
		//int hostIp=Integer.parseInt(SessionInfo.getLoginIP(request));
		answer.setHostIp(123456);    //对象的ip地址
		answer.setAnswerTime(new Date());
		answer.setCompanyId(1);
		answer.setIsRight(0);
		answer.setScore(0);
		QuestionPaperEmployeeAnswer questionPaperEmploueeAnswer=examPapersService.findQuestionPaperEmployeeAnswer(answer);
		if(questionPaperEmploueeAnswer!=null){
			examPapersService.updateQuestionPaperEmployeeAnswer(answer);
			ok=true;
		}else{
			examPapersService.saveQuestionPaperEmployeeAnswer(answer);
			ok=true;
		}
		return ok;
	}
	
	@RequestMapping(value="/chartImage")
	public String chartImage(Model model){
		model.addAttribute("date",getDefaultPieDataset());
		return "/broker/test";
	}
	
	/**
	 * 获取用户IP
	 * @return
	 * @throws SocketException
	 */
	public static String getRealIp() throws SocketException {
		String localip = null;// 本地IP，如果没有配置外网IP则返回它
		String netip = null;// 外网IP
		Enumeration<NetworkInterface> netInterfaces = NetworkInterface
				.getNetworkInterfaces();
		InetAddress ip = null;
		boolean finded = false;// 是否找到外网IP
		while (netInterfaces.hasMoreElements() && !finded) {
			NetworkInterface ni = netInterfaces.nextElement();
			Enumeration<InetAddress> address = ni.getInetAddresses();
			while (address.hasMoreElements()) {
				ip = address.nextElement();
				if (!ip.isSiteLocalAddress() && !ip.isLoopbackAddress()
						&& ip.getHostAddress().indexOf(":") == -1) {// 外网IP
					netip = ip.getHostAddress();
					finded = true;
					break;
				} else if (ip.isSiteLocalAddress() && !ip.isLoopbackAddress()
						&& ip.getHostAddress().indexOf(":") == -1) {// 内网IP
					localip = ip.getHostAddress();
				}
			}
		}

		if (netip != null && !"".equals(netip)) {
			return netip;
		} else {
			return localip;
		}
	}
	
	/**
	 * 饼状图数据方法
	 * @return
	 */
	public static DefaultPieDataset getDefaultPieDataset() {
		// create a dataset...
		DefaultPieDataset data = new DefaultPieDataset();
		data.setValue("one", 100);
		data.setValue("Two", 200);
		data.setValue("Three", 300);
		data.setValue("Four", 400);
		data.setValue("Five", 500);
		data.setValue("Six",600);
		return data;
	}
}
