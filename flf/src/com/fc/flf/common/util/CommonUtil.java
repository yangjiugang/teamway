package com.fc.flf.common.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 * @author huangshan
 * 2010-1-10 13:37
 */
public class CommonUtil {
	
	protected final static Logger logger = Logger.getLogger(CommonUtil.class);
	
	/**
	 * 获取request对象
	 * @return
	 */
	public static HttpServletRequest getRequest() {
		ServletRequestAttributes servletRequestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
		return servletRequestAttributes.getRequest();
	}
	
	/**
	 * ajax response输出
	 * @param str
	 * @param response
	 */
	public static void output(String str, HttpServletResponse response) {
		try {
			response.getOutputStream().write(str.getBytes("UTF-8"));
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	
	/**
	 * 对象转换成json格式
	 * @param o
	 * @return
	 */
	public static String toJson(Object o) {
		String s = null;
		try {
			s = new ObjectMapper().writeValueAsString(o);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return s;
	}
	
	public static String saveFile(InputStream is,String fileName) throws IOException{
		ClassLoader loader = CommonUtil.class.getClassLoader();
		String clsName = CommonUtil.class.getName().replaceAll("\\.", "/") + ".class";
		java.net.URL url = loader.getResource(clsName);
		String realPath = url.getPath().split("classes")[0];
		String path = (new File(realPath).getParentFile().getPath() + File.separator + "upload");;
		File file = new File(path.replace("%20", " "));
		if(!file.exists()){
			file.mkdirs();
		}
		String newFileName = String.valueOf(System.currentTimeMillis());
		String format = fileName.substring(fileName.indexOf('.'),fileName.length());
		OutputStream os = new FileOutputStream(new File(URLDecoder.decode(path,"UTF-8") + File.separator + newFileName + format));
		int bytesRead = 0;
			byte[] buffer = new byte[1024];
			while ((bytesRead = is.read(buffer, 0, 1024)) != -1) {
				os.write(buffer, 0, bytesRead);
		}
		return newFileName + format;
	}
	
	public static void delFile(String fileName) {
		ClassLoader loader = CommonUtil.class.getClassLoader();
		String clsName = CommonUtil.class.getName().replaceAll("\\.", "/") + ".class";
		java.net.URL url = loader.getResource(clsName);
		String realPath = url.getPath().split("classes")[0];
		String path = (new File(realPath).getParentFile().getPath() + File.separator + "upload" + File.separator + fileName);
		File file = new File(path.replace("%20", " "));
		if(file.exists())
			file.delete();
	}
	
}
