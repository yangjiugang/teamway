package com.fc.flf.eagent.mapper;

import java.util.List;
import java.util.Map;

import com.fc.flf.common.domain.UserPhotoSet;
import com.fc.flf.common.domain.UserPhotos;

public interface IUserPhotoMapper {
	/**
	 * 新增相册信息
	 * @param photoSet
	 */
	public void newPhotoSet(UserPhotoSet photoSet);
	
	/**
	 * 新增图片
	 * @param photos
	 */
	public void newPhoto(UserPhotos photos);
	
	/**
	 * 查询相册信息
	 * @return
	 */
	public List<UserPhotoSet> queryPhotoSet();
	
	/**
	 * 根据相册名查询相册ID
	 * @param setName
	 * @return int ID
	 */
	public int querySetId(String setName);
	/**
	 * 查询图片信息
	 * @param map
	 * @return
	 */
	public List<UserPhotoSet> queryPhotoForSet(Map<String, Object> map);
	
	/**
	 * 查询最新的6张图片
	 * @return
	 */
	public List<UserPhotos> querySixPhoto(int userId);
	
	/**
	 * 查询最新的5张图片
	 * @return
	 */
	public List<UserPhotos> queryFivePhoto(int userId);
	
	/**
	 * 查询具体的某张图片
	 * @param photoId
	 * @return
	 */
	public UserPhotos thePhotoForID(int photoId);
	
	/**
	 * 根据图片ID删除图片
	 * @param photoId
	 */
	public void DeletePhoto(int photoId);
	/**
	 * 查询数据库中是否存在
	 * @return
	 */
	public List<UserPhotoSet> queryTrue();
}
