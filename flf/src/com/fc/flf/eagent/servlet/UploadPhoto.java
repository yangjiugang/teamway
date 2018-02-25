package com.fc.flf.eagent.servlet;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class UploadPhoto
 */
public class UploadPhoto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadPhoto() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		 String savePath = this.getServletConfig().getServletContext()
	                .getRealPath("");
	        savePath = savePath + "/uploads/";
	        File f1 = new File(savePath);
	        System.out.println(savePath);
	        if (!f1.exists()) {
	            f1.mkdirs();
	        }
	        DiskFileItemFactory fac = new DiskFileItemFactory();
	        ServletFileUpload upload = new ServletFileUpload(fac);
	        upload.setHeaderEncoding("utf-8");
	        List fileList = null;
	        try {
	            fileList = upload.parseRequest(request);
	        } catch (FileUploadException ex) {
	            return;
	        }
	        Iterator<FileItem> it = fileList.iterator();
	        String name = "";
	        String extName = "";
	        while (it.hasNext()) {
	            FileItem item = it.next();
	            if (!item.isFormField()) {
	                name = item.getName();
	                long size = item.getSize();
	                String type = item.getContentType();
	                System.out.println(size+"字节" + " " + type);
	                if (name == null || name.trim().equals("")) {
	                    continue;
	                }
	                   
	                if (name.lastIndexOf(".") >= 0) {
	                    extName = name.substring(name.lastIndexOf("."));
	                }
	                File file = null;
	                do {
	                    name = UUID.randomUUID().toString();
	                    file = new File(savePath + name + extName);
	                } while (file.exists());
	                File saveFile = new File(savePath + name + extName);
	                try {
	                    item.write(saveFile);
	                } catch (Exception e) {
	                    e.printStackTrace();
	                }
	            }
	        }
	        response.getWriter().print(name + extName);
	    }
}
