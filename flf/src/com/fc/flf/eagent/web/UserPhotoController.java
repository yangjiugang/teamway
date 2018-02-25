package com.fc.flf.eagent.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.DefaultFileItemFactory;
import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fc.flf.common.domain.UserInfo;
import com.fc.flf.common.domain.UserPhotoSet;
import com.fc.flf.common.domain.UserPhotos;
import com.fc.flf.eagent.mapper.IUserPhotoMapper;
import com.fc.flf.eagent.servlet.UploadPhotoServlet;
import com.sun.org.apache.regexp.internal.recompile;

@Controller
public class UserPhotoController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	private IUserPhotoMapper iUserPhotoMapper;

	@RequestMapping(value = "Y13Xiangxi")
	public String Y13Xiangxi(Model model,HttpServletRequest request, HttpServletResponse response) {
		int photoId = Integer.parseInt(request.getParameter("photoId").toString());
		UserPhotos photos = iUserPhotoMapper.thePhotoForID(photoId);
		model.addAttribute("photos", photos);
		return "/eagent/Y13xiangxi";
	}
	

	
	@RequestMapping(value = "Y13XiangxiGeren")
	public String Y13XiangxiGeren(Model model,HttpServletRequest request, HttpServletResponse response) {
		int photoId = Integer.parseInt(request.getParameter("photoId").toString());
		UserPhotos photos = iUserPhotoMapper.thePhotoForID(photoId);
		model.addAttribute("photos", photos);
		return "/eagent/Y13xiangxi-geren";
	}
	@RequestMapping(value = "Y13XiangceGeren")
	public String Y13XiangceGeren(Model model) {
		int userId = 1;
		List<UserPhotoSet> setList = iUserPhotoMapper.queryPhotoSet();
		List<UserPhotos> photosList = iUserPhotoMapper.querySixPhoto(userId);
		model.addAttribute("setList", setList);
		model.addAttribute("photosList", photosList);
		return "/eagent/Y13xiangce-geren";
	}
	
	@RequestMapping(value = "Y13Xiangce")
	public String Y13Xiangce(Model model) {
		int userId = 1;
		List<UserPhotoSet> setList = iUserPhotoMapper.queryPhotoSet();
		List<UserPhotos> photosList = iUserPhotoMapper.querySixPhoto(userId);
		model.addAttribute("setList", setList);
		model.addAttribute("photosList", photosList);
		return "/eagent/Y13xiangce";
	}

	@RequestMapping(value = "Y13XiangceLBGeren")
	public String Y13XiangceLBGeren(Model model,HttpServletRequest request, HttpServletResponse response) {
		String setName = request.getParameter("setName");
		int userId = 1;
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("setName", setName);
		map.put("userId", userId);
		List<UserPhotoSet> list = iUserPhotoMapper.queryPhotoForSet(map);
		List<UserPhotos> photosList = iUserPhotoMapper.querySixPhoto(userId);
		List<UserPhotoSet> setList = iUserPhotoMapper.queryPhotoSet();
		model.addAttribute("setList", setList);
		model.addAttribute("photos", list);
		model.addAttribute("photosList", photosList);	
		return "/eagent/Y13xiangceLB-geren";
	}

	@RequestMapping(value = "Y13XiangceLB")
	public String Y13XiangceLB(Model model,HttpServletRequest request, HttpServletResponse response) {
		String setName = request.getParameter("setName");
		int userId = 1;
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("setName", setName);
		map.put("userId", userId);
		List<UserPhotoSet> list = iUserPhotoMapper.queryPhotoForSet(map);
		List<UserPhotos> photosList = iUserPhotoMapper.querySixPhoto(userId);
		List<UserPhotoSet> setList = iUserPhotoMapper.queryPhotoSet();
		model.addAttribute("setList", setList);
		model.addAttribute("photos", list);
		model.addAttribute("photosList", photosList);		
		return "/eagent/Y13xiangceLB";
	}
	
	
	
	@RequestMapping(value = "DeletePhoto")
	public String DeletePhoto(HttpServletRequest request, HttpServletResponse response)
	{
		int photoId = Integer.parseInt(request.getParameter("photoId").toString());
		iUserPhotoMapper.DeletePhoto(photoId);
		return "redirect:Y13Xiangce";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/ChangePhoto")
	public String ChangePhoto(HttpServletRequest request,HttpServletResponse response,Model model,
			@PathVariable("filePath") String filePath){
		System.out.println("this is come?"+request.getParameter("filePath"));	
		String savePath = request.getSession().getServletContext().getRealPath("image");
		System.out.println("path =  " + request.getSession().getServletContext().getRealPath("image"));
		
//			iUserPhotoMapper.newPhoto(photos);	
//	
//			model.addAttribute("path", "//images"+name);
		return null;		
	}
	
}
