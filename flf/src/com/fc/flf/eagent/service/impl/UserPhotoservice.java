package com.fc.flf.eagent.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fc.flf.common.domain.UserPhotoSet;
import com.fc.flf.common.domain.UserPhotos;
import com.fc.flf.eagent.mapper.IUserPhotoMapper;
import com.fc.flf.eagent.service.IUserPhotoService;

@Service
public class UserPhotoservice implements IUserPhotoService{
	
	@Autowired
	private IUserPhotoMapper iUserPhotoMapper;
	@Override
	public void newPhotoSet(UserPhotoSet photoSet) {
		iUserPhotoMapper.newPhotoSet(photoSet);
	}

	@Override
	public void newPhoto(UserPhotos photos) {
		iUserPhotoMapper.newPhoto(photos);
	}

	@Override
	public List<UserPhotoSet> queryPhotoSet() {
		List<UserPhotoSet> list = iUserPhotoMapper.queryPhotoSet();
		return list;
	}

	@Override
	public List<UserPhotoSet> queryPhotoForSet(Map<String, Object> map) {
		List<UserPhotoSet> list = iUserPhotoMapper.queryPhotoForSet(map);
		return list;
	}

	@Override
	public List<UserPhotos> querySixPhoto(int userId) {
		List<UserPhotos> list = iUserPhotoMapper.querySixPhoto(userId);
		return list;
	}

	@Override
	public UserPhotos thePhotoForID(int photoId) {
		UserPhotos photos = iUserPhotoMapper.thePhotoForID(photoId);
		return photos;
	}

	@Override
	public void DeletePhoto(int photoId) {
		iUserPhotoMapper.DeletePhoto(photoId);
	}

	@Override
	public int querySetId(String setName) {
		int setId = iUserPhotoMapper.querySetId(setName);
		return setId;
	}

	public Boolean queryTrue(String setName) {	
		boolean flag = false;
		List<UserPhotoSet> photoSet = iUserPhotoMapper.queryTrue();
		for(int i = 0 ; i < photoSet.size(); i++){
			String name = photoSet.get(i).getSetName();
			if(name == setName || name.equals(setName)){
				flag = true;
			}
		}
		return flag;
	}

	@Override
	public List<UserPhotos> queryFivePhoto(int userId) {
		List<UserPhotos> list = iUserPhotoMapper.queryFivePhoto(userId);
		return list;
	}

}
