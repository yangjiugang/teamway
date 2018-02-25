package com.fc.flf.common.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ChangeTouXiang{
	private static final int WIDE_PHOTO = 103;
	private static final int HEIGHT_PHOTO = 104;
	public String changeTouXiang(HttpServletRequest request , HttpServletResponse response)
	{
		String filePath = request.getParameter("fileUp");
		File file = new File(filePath);
		Date date = new Date();
		SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd-hh-mm-ss");
		String name = file.getName();
		String savaType = name.substring(name.lastIndexOf("."));
		String saveName = sim.format(date)+savaType;
		String outPath = request.getSession().getServletContext().getRealPath("images")+"\\"+saveName;
		ChangePhotoSize changeSize= new ChangePhotoSize();
		try {
			changeSize.imageGet(filePath, outPath, WIDE_PHOTO, HEIGHT_PHOTO, false);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return saveName;
		
	}
}
