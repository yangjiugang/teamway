package com.fc.brms.deactivated.mapper;

import org.apache.ibatis.annotations.Param;

public interface IUserResumeBelongtoMapper {
	/**
	 * 更新经济人为黑名单成员
	 * @return int
	 */
	public void updateDimissionUserToBlack(@Param("userIds")int[] userIds, @Param("companyId")int companyId, @Param("redBlack")int redBlack);
}
