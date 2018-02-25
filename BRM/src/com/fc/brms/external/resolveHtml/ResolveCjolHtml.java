package com.fc.brms.external.resolveHtml;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.NameValuePair;
import org.apache.http.ParseException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;
import org.htmlcleaner.CleanerProperties;
import org.htmlcleaner.HtmlCleaner;
import org.htmlcleaner.JDomSerializer;
import org.htmlcleaner.TagNode;
import org.htmlcleaner.XPatherException;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.xpath.XPath;

import com.fc.brms.common.domain.UserProjectExperience;
import com.fc.brms.common.domain.UserResume;
import com.fc.brms.common.domain.ResumeParameter;
import com.fc.brms.common.domain.UserSkills;
import com.fc.brms.common.util.DateTools;
import com.fc.brms.common.util.HttpclientUnit;

/**
 * 
 * @author 邓祥
 * 解析人才热线招聘网站
 * @version 2012-2-27
 */
public class ResolveCjolHtml {
	
	
	private static Logger logger = Logger.getLogger(ResolveCjolHtml.class);
	
	/**
	 * 解析人才热线招聘网站上 列表
	 * @return
	 * @throws XPatherException 
	 * @throws IOException 
	 * @throws UnsupportedEncodingException 
	 * @throws ParseException 
	 */
	public static List<Object> resolveList(String url ,ResumeParameter parameter) 
		throws Exception	{
		
		HtmlCleaner cleaner = new HtmlCleaner();  
		List<UserResume> strList = new ArrayList<UserResume>();
		List objList = new ArrayList();
		HttpclientUnit httpclient = new HttpclientUnit();
		String searchURL = "http://rms.cjol.com/SearchEngine/KeywordSearch.aspx";//搜索 
		
		String key = parameter.getKey();//关键字
		String location = parameter.getLocation();//地区
		String updateTime = parameter.getUpdateTime();//更新时间
		String eventTarget = parameter.getEventTarget();
		
		// 设置参数
        List<NameValuePair> searchParams = new ArrayList<NameValuePair>();
        searchParams.add(new BasicNameValuePair("Keyword", key));
		searchParams.add(new BasicNameValuePair("Gender", "-1"));
		searchParams.add(new BasicNameValuePair("JobFunction","-1"));
		searchParams.add(new BasicNameValuePair("Location", location));//地区
		searchParams.add(new BasicNameValuePair("MaxAge","-1"));
		searchParams.add(new BasicNameValuePair("MaxEducation","-1"));
		searchParams.add(new BasicNameValuePair("MaxExpectedSalary","-1"));
		searchParams.add(new BasicNameValuePair("MaxWorkExperience","-1"));
		searchParams.add(new BasicNameValuePair("MinAge","-1"));
		searchParams.add(new BasicNameValuePair("MinEducation","-1"));
		searchParams.add(new BasicNameValuePair("MinExpectedSalary","-1"));
		searchParams.add(new BasicNameValuePair("MinWorkExperience","-1"));
		searchParams.add(new BasicNameValuePair("Photo","-1"));
		searchParams.add(new BasicNameValuePair("UpdateTime",updateTime));//更新日期
		 
		TagNode node;
		if("".equals(eventTarget)||eventTarget==null){
			node = cleaner.clean(httpclient.getRefer(searchURL,searchParams,"1"));//默认
		}else{
			String fenye = "";
			try {
				fenye = postBack(searchURL,searchParams,parameter);
			} catch (ParseException e) {
				logger.error("",e);
			} catch (UnsupportedEncodingException e) {
				logger.error("", e);
			} catch (IOException e) {
				logger.error("",e);
			}//分页 
			node = cleaner.clean(fenye);
			
			//newFile("F://test.html",fenye);//登陆后得到的页面
		}
		
	
		try {
		Object[] nsId = node.evaluateXPath("//table[@class='ListTableBody']//td//input");//简历列表ID
		Object[] ns = node.evaluateXPath("//table[@class='ListTableBody']//td");//简历列表
		Object[] strA  = node.evaluateXPath("//table[@class='ListTableFoot']//a"); //分页号码里的函数
		Object[] strSpan  = node.evaluateXPath("//table[@class='ListTableFoot']//span"); //分页总页数和当前页数
		Object[] strHidden = node.evaluateXPath("//input[@type='hidden']");//得到隐藏表单域的值 分页有用
		Object[] labMessage = node.evaluateXPath("//span[@id='ctl00_labMessage']");//操作下载后得到的提示
		
		int labMessageSiz = labMessage.length;
		String strLabMessage = "";
		if(labMessageSiz>0){
			strLabMessage = ((TagNode)labMessage[0]).getText().toString();
		}
		
		List nameList = new ArrayList();
		Map strMap = new HashMap(); 
		
		String sNonce = ((TagNode)strSpan[1]).getText().toString();//当前页码号
		String sAll = ((TagNode)strSpan[0]).getText().toString();//共多少数据
		int iNonce = Integer.valueOf(sNonce);
		
		String  upPage = "";
		TagNode toStrye;
		String  toPage = "";
		
		//得到分页 按钮
		if(iNonce!=1){
			TagNode upStrye = (TagNode) strA[iNonce-1];
			upPage = upStrye.getAttributeByName("href");//上页按钮 值
			toStrye = (TagNode) strA[iNonce];
	    	toPage = toStrye.getAttributeByName("href");//下页按钮 值
		}
		if(iNonce==1){
			toStrye = (TagNode) strA[iNonce-1];
			toPage = toStrye.getAttributeByName("href");//下页按钮 值
		}
		
    	
		 
    	String  strCjolstateid = ((TagNode)strHidden[0]).getAttributeByName("value");//隐藏表单域
    	String  strValidation = ((TagNode)strHidden[2]).getAttributeByName("value");//隐藏表单域
		
		int  iSiz = ns.length;
		 //System.out.println("元素ttext="+iSiz); 
		 int y = 0;
		 for (int i = 1; i <iSiz+1 ; i++) {
	            TagNode n = (TagNode) ns[i-1];
	            String name = n.getText().toString();
	            nameList.add(name);
	            int s = i%11;
	            if(s==0){
	            	strMap.put(y++, nameList);
	            	nameList = new ArrayList();
	            }
			 
	        }
		 for (int e = 0; e < strMap.size(); e++) {
			 List listV =  (List) strMap.get(e);
			 UserResume userResume = new UserResume();
			 TagNode strId = (TagNode) nsId[e];
			 TagNode strCheckboxs = (TagNode) nsId[e];
        	 String  resumeUserId = strId.getAttributeByName("Value");
        	 String  checkboxId = strCheckboxs.getAttributeByName("name");
        	 userResume.setResumeUserId(resumeUserId);//外部简历ID
        	 userResume.setCheckboxId(checkboxId);
        	 userResume.setUserName(listV.get(1).toString());//姓名
        	 userResume.setPresentPost(listV.get(2).toString());//目前岗位
        	 String strSex = listV.get(3).toString();
        	 strSex = strSex.replaceAll("\r\n", "");
        	 strSex = strSex.replaceAll(" ", "");
        	 if("男".equals(strSex)){
        		 userResume.setUserSex(0);//性别
        	 }else{
        		 userResume.setUserSex(1);//性别
        	 }
        	 userResume.setYear(listV.get(4).toString());//年龄
        	 userResume.setHighestEducationName(listV.get(5).toString());//学历
        	 String workYears = listV.get(6).toString();
        	 //workYears = workYears.replaceAll("\r\n", "");
        	// workYears = workYears.replaceAll(" ", "");
        	// workYears = workYears.substring(0, workYears.indexOf("."));
        	 userResume.setWorkYears(workYears);//工作经验
        	 userResume.setUserAddress(listV.get(7).toString());//当前地区
        	 String presentSalaryMonth = listV.get(8).toString();
        	 presentSalaryMonth = presentSalaryMonth.replaceAll("\r\n", "");
        	 presentSalaryMonth = presentSalaryMonth.replaceAll(" ", "");
        	 userResume.setPresentSalaryMonth(Integer.valueOf(presentSalaryMonth));//期望月薪
        	 userResume.setUpdateDate(listV.get(9).toString());//更新日期
        	 userResume.setResumeDepict(listV.get(10).toString());//简历概述
			 strList.add(userResume);
			      
			objList.add(strList);
			objList.add(sAll);
			objList.add(upPage);
			objList.add(toPage);
			objList.add(strValidation);
			objList.add(strCjolstateid);
			objList.add(parameter);
			objList.add(strLabMessage);
		}
		
		} catch (XPatherException e) {
			logger.error("解析人才热线招聘网站上 列表出错",e);
		} 
		
		return objList;
	}
	


	/**
	 * 根据id查看未下载的人才热线的个人详细
	 * @return
	 * @throws XPatherException 
	 * @throws JDOMException 
	 * @throws IOException 
	 */
	public static Map downloadResume(String url ,String id) throws XPatherException, JDOMException{
		
		
		HtmlCleaner cleaner = new HtmlCleaner();  
		CleanerProperties props = cleaner.getProperties();  
		HttpclientUnit httpclient = new HttpclientUnit();
		Map downloadResumeMap = new HashMap();
		
		List basic = new ArrayList();//基本信息
		List affiliation = new ArrayList();//联系方式
		List experience = new ArrayList();//工作经验
		List undergo = new ArrayList();//工作经历详细介绍
		List skill = new ArrayList();//技能专长
		List educate = new ArrayList();//教育背景
		
		
		// 设置参数
        List<NameValuePair> searchParams = new ArrayList<NameValuePair>();
        searchParams.add(new BasicNameValuePair("JobSeekerID", id)); 
		
        String strHtml = httpclient.getRefer(url,searchParams,"1");
       // newFile("F://test.html",strHtml);
		TagNode node = cleaner.clean(strHtml);
		//TagNode node = cleaner.clean(new File("F://test.html"),"UTF-8");
		
		//删除标签为script
		Object[] nscript = node.evaluateXPath("//script");
		for (Object script : nscript) {
			((TagNode) script).removeFromTree();
		}
		JDomSerializer jdomSerializer = new JDomSerializer(props,true);  
		Document doc = jdomSerializer.createJDom(node);
		Element root = doc.getRootElement();   
		 
		List reslist = XPath.selectNodes(root, "/html/body/form/table[4]//table//*");  
		
		 int np = 0; 
		 for (int i = 0; i < reslist.size(); i++) {
			 Element e = (Element)reslist.get(i);
			 String name = e.getText();
			 name = name.replaceAll("\r", "");
			 name = name.replace("\t", "");
			 name = name.replaceAll("\n", "");
			 //name = name.replaceAll("  ", "");
			if(!"".equals(name)){
				if(name.indexOf("【 基本信息】")!=-1){
					 np= 1;
				 }else if(name.indexOf("【联系方式】")!=-1){
					 np= 2;
				 }else if(name.indexOf("【工作经验】")!=-1){
					 np= 3;
				 }else if(name.indexOf("【工作经历详细介绍】")!=-1){
					 np= 4;
				 }else if(name.indexOf("【技能专长】")!=-1){
					 np= 5;
				 }else if(name.indexOf("【教育背景】")!=-1){
					 np= 6;
				 }
				 if(np==1){//基本信息
					 name = name.replaceAll(" ", "");
					 basic.add(name);
				 }else if(np==2){//联系方式
					 name = name.replaceAll(" ", "");
					 affiliation.add(name);
				 }else if(np==3){//工作经验
					 name = name.replaceAll(" ", "");
					 experience.add(name);
				 }else if(np==4){//工作经历详细介绍
					 name = name.replaceAll(" ", "");
					 undergo.add(name);
				 }else if(np==5){//技能专长
					 name = name.replaceAll(" ", "");
					 skill.add(name);
				 }else if(np==6){//教育背景
					 educate.add(name);
				 }
				 //System.out.println(name);
			}
		}
		Encapsulation encapsulation = new Encapsulation();
		
		UserResume  userResume = encapsulation.getUserResume(basic);//基本信息
		 int affiliationSize = affiliation.size();
		 for (int y = 0; y < affiliationSize; y++) {
			 String tr = affiliation.get(y).toString();
			 if("手机号码：".equals(tr)){
				 userResume.setUserTelphone(affiliation.get(y+1).toString());
			 }else if("Email：".equals(tr)){
				 userResume.setEmail(affiliation.get(y+1).toString());
			 }
		 }
		 
		 
		 int undergoSize =  undergo.size();
		 if(undergoSize>0){
			 UserProjectExperience projectExperience = new UserProjectExperience();
			 projectExperience.setProjectDesc(undergo.get(1).toString());//项目经验
			 downloadResumeMap.put(3,projectExperience);
		 }
		 int skillSize = skill.size();
		 if(skillSize>0){
			 UserSkills userSkills = new  UserSkills();
			 userSkills.setSkillDesc(skill.get(1).toString());//技能专长
			 downloadResumeMap.put(4,userSkills);
		 }
		
		         	
		 downloadResumeMap. put(1,userResume);
		 List experienceList = encapsulation.getExperience(experience);//工作经验
		 downloadResumeMap.put(2,experienceList);
		 List educateList = encapsulation.getEducate(educate);//教育
		 downloadResumeMap.put(5,educateList);
		
		 
		return downloadResumeMap;
	}
		
	
	/**
	 * 分页 和 下载
	 * @return
	 * @throws IOException 
	 * @throws UnsupportedEncodingException 
	 * @throws ParseException 
	 */
	public static String postBack(String url ,List<NameValuePair> params,ResumeParameter parameter) 
			throws ParseException, UnsupportedEncodingException, IOException{
		String str = "" ;
		HttpclientUnit httpclient = new HttpclientUnit();
		
		String keyS = parameter.getKey();//关键字
		String locationS = parameter.getLocation();//地区
		String updateTimeS = parameter.getUpdateTime();//更新时间
		String eventTargetS = parameter.getEventTarget();//分页
		String validationS = parameter.getValidation();
		String cjolstateidS = parameter.getCjolstateid();
		String eventargumens = parameter.getEventargument();//下载需要的参数
		String checkboxId = parameter.getCheckboxId();
		String[] strId = parameter.getIdList();
		String[] checkboxIdS = checkboxId.split(",");
		
		String strUrl = EntityUtils.toString(new UrlEncodedFormEntity(params,HTTP.UTF_8));
		strUrl = url+"?"+strUrl;
		// 设置参数
        List<NameValuePair> fenyeParams = new ArrayList<NameValuePair>();
        fenyeParams.add(new BasicNameValuePair("__EVENTTARGET",eventTargetS));
        fenyeParams.add(new BasicNameValuePair("__EVENTARGUMENT", eventargumens));
        fenyeParams.add(new BasicNameValuePair("__CJOLSTATEID", cjolstateidS));
        fenyeParams.add(new BasicNameValuePair("__EVENTVALIDATION", validationS));
        fenyeParams.add(new BasicNameValuePair("__LASTFOCUS", ""));
		fenyeParams.add(new BasicNameValuePair("__VIEWSTATE", ""));
		fenyeParams.add(new BasicNameValuePair("ctl00$M$ddlAge", "-1"));
		fenyeParams.add(new BasicNameValuePair("ctl00$M$ddlEducation", "-1"));
		fenyeParams.add(new BasicNameValuePair("ctl00$M$ddlExpectedSalary", "-1"));
		fenyeParams.add(new BasicNameValuePair("ctl00$M$ddlGender", "-1"));
		fenyeParams.add(new BasicNameValuePair("ctl00$M$ddlJobFunction", "-1"));
		fenyeParams.add(new BasicNameValuePair("ctl00$M$ddlLocation", locationS));//地区
		fenyeParams.add(new BasicNameValuePair("ctl00$M$ddlPhoto", "-1"));
		fenyeParams.add(new BasicNameValuePair("ctl00$M$ddlUpdateTime", updateTimeS));//更新时间
		int idSiz = strId.length;
		for (int i = 0; i < idSiz; i++) {
			fenyeParams.add(new BasicNameValuePair(checkboxIdS[i].replaceAll(" ", ""),strId[i].replaceAll(" ", "")));
		}
		fenyeParams.add(new BasicNameValuePair("ctl00$M$ddlWorkExperience", "-1"));
		fenyeParams.add(new BasicNameValuePair("ctl00$M$dtgResumeList$ctl52$ctl15", "50"));
		fenyeParams.add(new BasicNameValuePair("ctl00$M$txtKey", keyS));
		str = httpclient.postRefer(strUrl, fenyeParams,"1");
		
		return str;
		
	}
	
	/** 
	   * 新建文件 
	   * @param filePathAndName String 文件路径及名称 如c:/fqf.txt 
	   * @param fileContent String 文件内容 
	   * @return boolean 
	   */  
	  public static void newFile(String filePathAndName, String fileContent) {  
	  
	    try {  
	      String filePath = filePathAndName;  
	      filePath = filePath.toString();  
	      File myFilePath = new File(filePath);  
	      if (!myFilePath.exists()) {  
	        myFilePath.createNewFile();  
	      }  
	      FileWriter resultFile = new FileWriter(myFilePath);  
	      PrintWriter myFile = new PrintWriter(resultFile);  
	      String strContent = fileContent;  
	      myFile.println(strContent);  
	      resultFile.close();  
	  
	    }  
	    catch (Exception e) {  
	      System.out.println("新建目录操作出错");  
	      e.printStackTrace();  
	  
	    }  
	  
	  }  
	
	
}
