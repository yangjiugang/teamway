package com.fc.flf.portal.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.flf.common.domain.UserPhotos;
import com.fc.flf.portal.mapper.IUserPhotosMapper;
import com.fc.flf.portal.service.IUserPhotosService;

@Service
public class UserPhotosServiceImpl implements IUserPhotosService {

	@Resource
	private IUserPhotosMapper userPhotosMapper;
	
	@Transactional(readOnly=true)
	public List<UserPhotos> getUserPhotosByUserId(int userId) {
		List<UserPhotos> userPhotos = userPhotosMapper.getUserPhotosByUserId(userId);
		return userPhotos;
	}

}
