package com.fc.brms.external.resolveHtml;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.NameValuePair;
import org.apache.http.ParseException;
import org.apache.http.message.BasicNameValuePair;
import org.apache.log4j.Logger;
import org.htmlcleaner.HtmlCleaner;
import org.htmlcleaner.TagNode;
import org.htmlcleaner.XPatherException;

import com.fc.brms.common.domain.ResumeParameter;
import com.fc.brms.common.domain.UserResume;
import com.fc.brms.common.util.HttpclientUnit;


/**
 * 
 * @author 邓祥
 * 解析58同城招聘网站
 * @version 2012-2-27
 */
public class Resolve58Html {

	private static Logger logger = Logger.getLogger(Resolve58Html.class);
	
	
	/**
	 * 解析58同城招聘网站上 列表
	 * @return
	 * @throws XPatherException 
	 * @throws IOException 
	 * @throws UnsupportedEncodingException 
	 * @throws ParseException 
	 */
	public static List<Object> resolve58List(String url ,ResumeParameter parameter) {
		
		HtmlCleaner cleaner = new HtmlCleaner();  
		List<UserResume> strList = new ArrayList<UserResume>();
		List objList = new ArrayList();
		HttpclientUnit httpclient = new HttpclientUnit();
		String searchURL = "http://jianli.58.com/4/t1/pn1/";//搜索 
		String key = parameter.getKey();
		
		// 设置参数
        List<NameValuePair> searchParams = new ArrayList<NameValuePair>();
        searchParams.add(new BasicNameValuePair("key", key));
		searchParams.add(new BasicNameValuePair("complex", "1"));
		searchParams.add(new BasicNameValuePair("eduabove","0"));
		searchParams.add(new BasicNameValuePair("expabove", "0"));
		searchParams.add(new BasicNameValuePair("exp","0"));//工作经验
		searchParams.add(new BasicNameValuePair("addtime","0"));//发布时间
//		searchParams.add(new BasicNameValuePair("MaxExpectedSalary","-1"));
		TagNode node = cleaner.clean(httpclient.getRefer(searchURL,searchParams,"3"));//默认
		List nameList = new ArrayList();
		Map strMap = new HashMap();  
		try {
			Object[] ns = node.evaluateXPath("//div[@id='main']//td");//列表
			Object[] nsA = node.evaluateXPath("//div[@id='main']//td//a");//ID
			Object[] nsAll = node.evaluateXPath("//b[@class='df']");//得到搜索的总条数
			
			TagNode ti = (TagNode) nsAll[0];
			String names = ti.getText().toString();//得到搜索的总条数
			//System.out.println(names); 
			int  iSiz = ns.length;
			
			 int y = 0;
			 for (int i = 1; i <iSiz+1 ; i++) {
		            TagNode n = (TagNode) ns[i-1];
		            String name = n.getText().toString();
		            name = name.replaceAll("\r", "");
					name = name.replaceAll("\n", "");
					name = name.replaceAll("\t", "");
					name = name.replaceAll(" ", "");
		            //System.out.println(name);
		            nameList.add(name);
		            int s = i%8;
		            if(s==0){
		            	strMap.put(y++, nameList);
		            	nameList = new ArrayList();
		            }
				 
		        }
			
			 for (int e = 1; e < strMap.size(); e++) {
				 List listV =  (List) strMap.get(e);
				 UserResume userResume = new UserResume();
				 TagNode strhref = (TagNode) nsA[e-1];
				 String  strId = strhref.getAttributeByName("href");
				 strId = strId.substring(strId.indexOf("=")+1, strId.length());
				 userResume.setResumeUserId(strId);
				 userResume.setUserName(listV.get(2).toString());//姓名
				 userResume.setPresentPost(listV.get(1).toString());//目前岗位
				 String strSex = listV.get(3).toString();
	        	 if("男".equals(strSex)){
	        		 userResume.setUserSex(0);//性别
	        	 }else{
	        		 userResume.setUserSex(1);//性别
	        	 }
				 userResume.setYear(listV.get(4).toString());//年龄
				 userResume.setHighestEducationName(listV.get(5).toString());//学历
				 userResume.setWorkYears(listV.get(6).toString());//工作年限 
				 userResume.setUpdateDate(listV.get(7).toString());//更新时间
				 strList.add(userResume);
			 }
			 objList.add(strList);//列表
			 objList.add(names);
			 
		} catch (XPatherException e) {
			logger.error("解析58同城简历列表出错", e);
			e.printStackTrace();
		}
		 
		return objList;
		
	}
	
	public static void main(String[] args) {
//		ResumeParameter s = new ResumeParameter();
//		s.setKey("java");
//		resolve58List("",s);
		HttpclientUnit httpclientUnit = new HttpclientUnit();
		List<NameValuePair> cjolParams1 = new ArrayList<NameValuePair>();
		cjolParams1.add(new BasicNameValuePair("cd", "2359"));
		cjolParams1.add(new BasicNameValuePair("isweak", "0"));
		cjolParams1.add(new BasicNameValuePair("mobile", "手机号"));
		cjolParams1.add(new BasicNameValuePair("path", "http://my.58.com?pts=1333626042129"));
		cjolParams1.add(new BasicNameValuePair("p1", "eca2acfe14f50f19bb5dc23bde16da66"));
		cjolParams1.add(new BasicNameValuePair("p2", "90871eb3d4ffd0593e438d3a374a8388"));
		cjolParams1.add(new BasicNameValuePair("ptk", "15b2a903b49147588a04af052fe17f3c"));
		cjolParams1.add(new BasicNameValuePair("timesign", "1333618787070"));
		cjolParams1.add(new BasicNameValuePair("username", "dwlf743"));
		cjolParams1.add(new BasicNameValuePair("password", "hrmima2011"));
		
		httpclientUnit.login("http://passport.58.com/dologin?path=http://my.58.com?pts=1333626042129",cjolParams1,"3");
		String  s = httpclientUnit.getRefer("http://my.58.com/index/", "3");
		System.out.print(s);
		
	}
	
}
