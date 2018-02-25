package com.fc.flf.portal.service;

import java.util.List;

import com.fc.flf.common.domain.UserPhotos;

public interface IUserPhotosService {
	public List<UserPhotos> getUserPhotosByUserId(int userId);
}
