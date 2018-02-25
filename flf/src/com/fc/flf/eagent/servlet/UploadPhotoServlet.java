package com.fc.flf.eagent.servlet;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.fc.flf.common.domain.UserPhotoSet;
import com.fc.flf.common.domain.UserPhotos;
import com.fc.flf.common.util.ContextUtil;
import com.fc.flf.eagent.service.IUserPhotoService;
/**
 * Servlet implementation class UploadPhotoServlet
 */
public class UploadPhotoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private IUserPhotoService iUserPhotoService = ContextUtil.getBean("userPhotoservice", IUserPhotoService.class);

	/**
     * @see HttpServlet#HttpServlet()
     */
    public UploadPhotoServlet() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("...........................................");
		DiskFileItemFactory factory = new DiskFileItemFactory();
		UserPhotoSet photoSet = new UserPhotoSet();
		UserPhotos photos = new UserPhotos();
		// 设置内存缓冲区，超过后写入临时文件
		factory.setSizeThreshold(10240000);
		// 设置临时文件存储位置
		String base = "d:/upload";
		File file = new File(base);
		if(!file.exists())
			file.mkdirs();
		factory.setRepository(file);
		ServletFileUpload upload = new ServletFileUpload(factory);
		// 设置单个文件的最大上传值
		upload.setFileSizeMax(10002400000l);
		// 设置整个request的最大值
		upload.setSizeMax(10002400000l);
		upload.setHeaderEncoding("UTF-8");
		try {
			List<?> items = upload.parseRequest(request);
			FileItem item = null;
			String fileName = null;
			for (int i = 0 ;i < items.size(); i++){
				item = (FileItem) items.get(i);
				fileName = base + "/" + item.getName();
				// 保存文件
				if (!item.isFormField() && item.getName().length() > 0) {
					item.write(new File(fileName));
					String s = request.getParameter("setId");
					String setXin = request.getParameter("setxin");
					String setName = URLDecoder.decode(setXin,"Utf-8");
					int setId = Integer.parseInt(s.toString());
					int userId = 1;
						if(setId > 0){
							System.out.println("come here");
							photos.setSetId(setId);
							photos.setUserId(userId);
							photos.setPhotoPath(fileName);
							photos.setHostIp(00000);
							iUserPhotoService.newPhoto(photos);
						}else if(setId == 0 && "".equals(setName)){
							setName = "默认相册";
								boolean flag = iUserPhotoService.queryTrue(setName);
								if(flag == false){
									photoSet.setSetDesc("没有描述！请以后添加");
									photoSet.setSetName(setName);
									photoSet.setUserId(userId);
									iUserPhotoService.newPhotoSet(photoSet);
										int setID = iUserPhotoService.querySetId(setName);
										photos.setSetId(setID);
										photos.setUserId(userId);
										photos.setPhotoPath(fileName);
										photos.setHostIp(00000);
										iUserPhotoService.newPhoto(photos);
								}else{
									int setID = iUserPhotoService.querySetId(setName);
									photos.setSetId(setID);
									photos.setUserId(userId);
									photos.setPhotoPath(fileName);
									photos.setHostIp(00000);
									iUserPhotoService.newPhoto(photos);
								}								
							}else{
								boolean flag = iUserPhotoService.queryTrue(setName);
								if(flag == false){
									photoSet.setSetDesc("没有描述！请以后添加");
									photoSet.setSetName(setName);
									photoSet.setUserId(userId);
									iUserPhotoService.newPhotoSet(photoSet);
									int setID = iUserPhotoService.querySetId(setName);
										photos.setSetId(setID);
										photos.setUserId(userId);
										photos.setPhotoPath(fileName);
										photos.setHostIp(00000);
										iUserPhotoService.newPhoto(photos);
								}else{
									int setID = iUserPhotoService.querySetId(setName);
									photos.setSetId(setID);
									photos.setUserId(userId);
									photos.setPhotoPath(fileName);
									photos.setHostIp(00000);
									iUserPhotoService.newPhoto(photos);
							}
								}
						}
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	
}		
}
