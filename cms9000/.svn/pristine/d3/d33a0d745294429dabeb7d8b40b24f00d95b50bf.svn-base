package com.teamway.cms.utils;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.Properties;

public class PropertiesUtils {

	
	public static String GetStringByKey(String key) {
		String file_path=  System.getProperty("user.dir").concat(File.separator).concat("src").concat(File.separator).concat("main").concat(File.separator).concat("resources").concat(File.separator).concat("conf.properties");
		//URL url = PropertiesUtils.class.getClassLoader().getResource("conf.properties");
		//System.out.println(url.getPath());
		Properties pps = new Properties();
		try {
			InputStream in = new BufferedInputStream(new FileInputStream(file_path));  
			pps.load(in);
			String value = pps.getProperty(key);
			in.close();
			return value;
		}catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	public static int GetIntByKey(String key) {
		String file_path=  System.getProperty("user.dir")+"/src/main/resources/conf.properties";
		Properties pps = new Properties();
		try {
			InputStream in = new BufferedInputStream(new FileInputStream(file_path));  
			pps.load(in);
			String value =  pps.getProperty(key);
			int ret = 0;
			if(value == null){
				ret = -1;
			}else{
				ret = Integer.parseInt(value);
			}
			in.close();
			return ret;
		}catch (IOException e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	
	
	public static String GetStringByKey(String filePath, String key) {
		Properties pps = new Properties();
		try {
			InputStream in = new BufferedInputStream(new FileInputStream(filePath));  
			pps.load(in);
			String value = pps.getProperty(key);
			
			in.close();
			return value;
		}catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static String GetStringByKey(String filePath, String key, String def) {
		Properties pps = new Properties();
		try {
			InputStream in = new BufferedInputStream(new FileInputStream(filePath));  
			pps.load(in);
			String value = pps.getProperty(key);
			if(value == null)
				value = def;
			
			in.close();
			return value;
		}catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	public static int GetIntByKey(String filePath, String key, int def) {
		Properties pps = new Properties();
		try {
			InputStream in = new BufferedInputStream(new FileInputStream(filePath));  
			pps.load(in);
			String value =  pps.getProperty(key);
			int ret = 0;
			if(value == null){
				ret = def;
			}else{
				ret = Integer.parseInt(value);
			}
			in.close();
			return ret;
		}catch (IOException e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public static int GetIntByKey(String filePath, String key) {
		Properties pps = new Properties();
		try {
			InputStream in = new BufferedInputStream(new FileInputStream(filePath));  
			pps.load(in);
			String value =  pps.getProperty(key);
			int ret = 0;
			if(value == null){
				ret = -1;
			}else{
				ret = Integer.parseInt(value);
			}
			in.close();
			return ret;
		}catch (IOException e) {
			e.printStackTrace();
			return -1;
		}
	}
	
}
