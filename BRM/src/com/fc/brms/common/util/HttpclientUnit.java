package com.fc.brms.common.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.ParseException;
import org.apache.log4j.Logger;


/**
 * 
 * @author 邓祥
 * 仿浏览器执行招聘网站
 * @version 2012-2-27
 */
public class HttpclientUnit {

	private static Logger logger = Logger.getLogger(HttpclientUnit.class);
	private static HttpClient hc1 = new DefaultHttpClient();//人才热线		
	private static HttpClient hc2 = new DefaultHttpClient();//51job
	private static HttpClient hc3 = new DefaultHttpClient();//58同城
	private static HttpClient hc4 = new DefaultHttpClient();//
	
	/**
	 * 招聘网站登录
	 * @return
	 * @throws ClientProtocolException
	 * @throws IOException
	 */
	public static boolean login(String url,List<NameValuePair> params, String type){
		
        HttpPost httppost = new HttpPost(url);
       
       
        // 设置参数
        try {
			httppost.setEntity(new UrlEncodedFormEntity(params,HTTP.UTF_8));
			 // 发送请求
	        HttpResponse httpresponse = null ;
	        if("1".equals(type)){
	        	httpresponse = hc1.execute(httppost);
	        }else if("2".equals(type)){
	        	httpresponse = hc2.execute(httppost);
	        }else if("3".equals(type)){
	        	httpresponse = hc3.execute(httppost);
	        }else if("3".equals(type)){
	        	httpresponse = hc4.execute(httppost);
	        }
	        // 获取返回数据
	        HttpEntity entity = httpresponse.getEntity();
	        System.out.println("-服务器返回状态"+httpresponse.getStatusLine());
	        System.out.println("------------"+EntityUtils.toString(entity));
	        entity.getContent().close();
	        EntityUtils.consume(entity);
		} catch (UnsupportedEncodingException e) {
			
			 return false;  
		} catch (ClientProtocolException e) {
			 logger.error("Post 协议错误", e);
			 return false; 
		} catch (IOException e) {
			 logger.error("Post 网络请求出错", e);
			 return false;  
		}finally {  
			httppost.abort();  
        }  
       
	   return true;
	}
	
	 /**
	  * // Post请求
	  * @param url
	  * @param params
	  * @return
	 */

    public static String postRefer(String url , List<NameValuePair> params, String type) {

    	 HttpClient hc= new DefaultHttpClient();
         if("1".equals(type)){
         	hc = hc1;
         }else if("2".equals(type)){
         	hc = hc2;
         }else if("3".equals(type)){
         	hc = hc3;
         }else if("3".equals(type)){
         	hc = hc4;
         }	
        String body = "";
        HttpPost httppost = new HttpPost(url);

        try {
            // 设置参数
            httppost.setEntity(new UrlEncodedFormEntity(params,HTTP.UTF_8));
            // 发送请求
            HttpResponse httpresponse = hc.execute(httppost);
            // 获取返回数据
            HttpEntity entity = httpresponse.getEntity();
            body = EntityUtils.toString(entity);
            entity.getContent().close();
            if (entity != null) {
                entity.consumeContent();	
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            logger.error("Httpclient Post请求出错", e);
        } catch (ClientProtocolException e) {
            e.printStackTrace();
            logger.error("Post 协议错误", e);
        } catch (ParseException e) {
            e.printStackTrace();
            logger.error("Httpclient Post请求出错", e);
        } catch (IOException e) {
            e.printStackTrace();
            logger.error("Post 网络请求出错", e);
        }finally {  
        	httppost.abort();  
        } 
        
        return body;
    }

    /**
     * Get请求
     * @param url
     * @param params
     * @return
     */
    public static String getRefer(String url,List<NameValuePair> searchParams,String type) {
    	
    	 HttpClient hc= new DefaultHttpClient();
         if("1".equals(type)){
         	hc = hc1;
         }else if("2".equals(type)){
         	hc = hc2;
         }else if("3".equals(type)){
         	hc = hc3;
         }else if("3".equals(type)){
         	hc = hc4;
         }
    	
        String body = "";
        HttpGet httpget = new HttpGet(url);
        try {
        	//login();
//        	 String searchURL = "http://rms.cjol.com/SearchEngine/KeywordSearch.aspx";//搜索 
//        	 String userURL = "http://rms.cjol.com/ResumeBank/Resume.aspx";//根据得到的ID 查看具体的信息
            // Get请求
            
            
			//searchParams.add(new BasicNameValuePair("JobSeekerID", "4956804")); //s详细
            String str = EntityUtils.toString(new UrlEncodedFormEntity(searchParams,HTTP.UTF_8));
            httpget.setURI(new URI(httpget.getURI().toString() + "?" + str));
            HttpResponse httpresponse =  hc.execute(httpget);//执行
            HttpEntity entity = httpresponse.getEntity();//返回结果
            body = EntityUtils.toString(entity);
            if (entity != null) {
                entity.consumeContent();
            }
        } catch (ParseException e) {
            e.printStackTrace();
            logger.error("Httpclient GET请求出错", e);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            logger.error("Httpclient GET请求出错", e);
        } catch (IOException e) {
            e.printStackTrace();
            logger.error("Httpclient GET请求出错", e);
        } catch (URISyntaxException e) {
            e.printStackTrace();
            logger.error("Httpclient GET请求出错", e);
        }finally {  
        	httpget.abort();  
        } 
        return body;
    }
    
    
    /**
     * Get请求
     * @param url
     * @param params
     * @return
     */
    public static String getRefer(String url,String type) {
    	 HttpClient hc= new DefaultHttpClient();
         if("1".equals(type)){
         	hc = hc1;
         }else if("2".equals(type)){
         	hc = hc2;
         }else if("3".equals(type)){
         	hc = hc3;
         }else if("3".equals(type)){
         	hc = hc4;
         }
    	String body = "";
        
        try {

            // Get请求
            HttpGet httpget = new HttpGet(url);
           
            httpget.setURI(new URI(httpget.getURI().toString()));
            HttpResponse httpresponse =  hc.execute(httpget);//执行
            HttpEntity entity = httpresponse.getEntity();//返回结果
            body = EntityUtils.toString(entity);
            if (entity != null) {
                entity.consumeContent();
            }
        } catch (ParseException e) {
            e.printStackTrace();
            logger.error("Httpclient GET请求出错", e);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            logger.error("Httpclient GET请求出错", e);
        } catch (IOException e) {
            e.printStackTrace();
            logger.error("Httpclient GET请求出错", e);
        } catch (URISyntaxException e) {
            e.printStackTrace();
            logger.error("Httpclient GET请求出错", e);
        }
        return body;
    }

    
    
}
