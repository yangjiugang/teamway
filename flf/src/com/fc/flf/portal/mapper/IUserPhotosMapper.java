package com.fc.flf.portal.mapper;

import java.util.List;

import com.fc.flf.common.domain.UserPhotos;

public interface IUserPhotosMapper {
	public List<UserPhotos> getUserPhotosByUserId(int userId);
}
