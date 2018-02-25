package com.fc.flf.eagent.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.fc.flf.common.domain.UserInfo;
import com.fc.flf.common.domain.UserPhotoSet;
import com.fc.flf.common.domain.UserPhotos;
import com.fc.flf.eagent.mapper.IUserPhotoMapper;

@Service
public class TheUserPhotoUitl {
	
	@Autowired
	private IUserPhotoMapper iUserPhotoMapper;
	
	/**
	 * 查看某张图片
	 * @param view
	 * @param photoId
	 */
	public void XiangxiPhoto(ModelAndView view,int photoId) {
		UserPhotos photos = iUserPhotoMapper.thePhotoForID(photoId);
		view.addObject("photos", photos);
	}
	
	/**
	 * 获取相册信息
	 * @param view
	 * @param userInfo
	 */
	public void PhotoSet(ModelAndView view,int cusId){
		List<UserPhotoSet> setList = iUserPhotoMapper.queryPhotoSet();
		List<UserPhotos> photosList = iUserPhotoMapper.querySixPhoto(cusId);
		view.addObject("setList", setList);
		view.addObject("photosList", photosList);
	}
	
	/**
	 * 根据相册名查看图片
	 * @param view
	 * @param userInfo
	 * @param setName
	 */
	public void PhotoAll(ModelAndView view,UserInfo userInfo,String setName){
		int userId = userInfo.getUserId();
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("setName", setName);
		map.put("userId", userId);
		List<UserPhotoSet> list = iUserPhotoMapper.queryPhotoForSet(map);
		List<UserPhotos> photosList = iUserPhotoMapper.querySixPhoto(userId);
		List<UserPhotoSet> setList = iUserPhotoMapper.queryPhotoSet();
		view.addObject("setList", setList);
		view.addObject("photos", list);
		view.addObject("photosList", photosList);	
	}
}
