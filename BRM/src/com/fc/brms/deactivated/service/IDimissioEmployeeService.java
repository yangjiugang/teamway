package com.fc.brms.deactivated.service;

import java.util.Date;
import java.util.List;

import com.fc.brms.common.domain.DimissionEmployeeInfo;
import com.fc.brms.common.util.Page;

public interface IDimissioEmployeeService {
	public List<DimissionEmployeeInfo> findIDimissionUserResumeInfo(Page page,int companyId,int [] black);

	public List<DimissionEmployeeInfo> findDimissionUserInfoWithFactor(Page page, Date startDate, Date endDate, int education, String keyWord,int companyId,int talkNum,int [] black);

	public void updateDimissionUserToBlack(int[] ids1, int companyId,int redBlack);
	
	public String sendHolidayRegards(int userId,int companyId,String mailContent,String mailSubject);

}
