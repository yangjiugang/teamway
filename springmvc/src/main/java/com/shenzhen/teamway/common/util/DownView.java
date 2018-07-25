package com.shenzhen.teamway.common.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.AbstractView;
/**
 * 下载附件
 * @author huangsan
 *
 */
public class DownView extends AbstractView{

	private String fileName;
	
	public DownView(String fileName) {
		this.fileName = fileName;
	}
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> map,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html;charset=UTF-8");  
        request.setCharacterEncoding("UTF-8");  
        java.io.BufferedInputStream bis = null;  
        java.io.BufferedOutputStream bos = null;  
        
        String ctxPath = FileUtil.getPath();
        String downLoadPath = ctxPath + File.separator + fileName;
        response.setContentType("application/x-msdownload;");  
        response.setHeader("Content-disposition", "attachment; filename="  
                + new String(fileName.getBytes("utf-8"), "ISO8859-1"));  
        
        try {  
            long fileLength = new File(downLoadPath).length();  
            response.setContentType("application/x-msdownload;");  
            response.setHeader("Content-disposition", "attachment; filename="+
            					new String(fileName.getBytes("utf-8"), "ISO8859-1"));  
            response.setHeader("Content-Length", String.valueOf(fileLength));  
            bis = new BufferedInputStream(new FileInputStream(downLoadPath));  
            bos = new BufferedOutputStream(response.getOutputStream());  
            byte[] buff = new byte[2048];  
            int bytesRead;  
            while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {  
                bos.write(buff, 0, bytesRead);  
            }  
        } catch (Exception e) {  
            throw new RuntimeException(e);  
        } finally {  
            if (bis != null)  
                bis.close();  
            if (bos != null)  
                bos.close();  
        }  
	}
	
}
