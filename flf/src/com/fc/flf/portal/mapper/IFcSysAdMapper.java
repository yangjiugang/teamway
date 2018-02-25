package com.fc.flf.portal.mapper;

import java.util.List;

import com.fc.flf.common.domain.FcSysAd;
public interface IFcSysAdMapper {
	//根据图片类型查找广告图片
	public List<FcSysAd> selectFcSysAdByType(int adType);
	//根据图片类型查找广告图片及对应house信息
	public List<FcSysAd> selectFcSysAdByTypeWithHouseInfo(int adType);
}
