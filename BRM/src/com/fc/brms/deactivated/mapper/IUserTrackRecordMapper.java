package com.fc.brms.deactivated.mapper;

import org.apache.ibatis.annotations.Param;

import com.fc.brms.common.domain.UserTrackRecord;

public interface IUserTrackRecordMapper {
	public UserTrackRecord selectLastUserTrackRecord(@Param("userId")int userId,@Param("companyId")int companyId);
}
