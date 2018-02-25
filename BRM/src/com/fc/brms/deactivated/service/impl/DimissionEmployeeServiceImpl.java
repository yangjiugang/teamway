package com.fc.brms.deactivated.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fc.brms.broker.mapper.IEmployeeInfoMapper;
import com.fc.brms.common.domain.CfgCompany;
import com.fc.brms.common.domain.DimissionEmployeeInfo;
import com.fc.brms.common.domain.EmployeeInfo;
import com.fc.brms.common.domain.UserTrackRecord;
import com.fc.brms.common.mapper.IOrgStructureMapper;
import com.fc.brms.common.util.Page;
import com.fc.brms.common.util.mail.SimpleMail;
import com.fc.brms.common.util.mail.SimpleMailSender;
import com.fc.brms.deactivated.mapper.IUserResumeBelongtoMapper;
import com.fc.brms.deactivated.mapper.IUserTrackRecordMapper;
import com.fc.brms.deactivated.service.IDimissioEmployeeService;

@Service
public class DimissionEmployeeServiceImpl implements IDimissioEmployeeService {
	@Resource
	private IEmployeeInfoMapper employeeInfoMapper;
	
	@Resource
	private IOrgStructureMapper orgStructureMapper;
	
	@Resource
	private IUserResumeBelongtoMapper userResumeBelongtoMapper;
	
	@Resource
	private IUserTrackRecordMapper userTrackRecordMapper;
	
	/*查找停用经济人的信息，包括最近的约谈信息*/
	@Transactional(readOnly=true)
	public List<DimissionEmployeeInfo> findIDimissionUserResumeInfo(Page page,int companyId,int [] black){
		page.setRecords(employeeInfoMapper.selectDimissionEmployeeCount(companyId,black));
		List<EmployeeInfo> employees = employeeInfoMapper.selectDimissionEmployeeList(companyId, page.getLimit(),black);//停用经济人的信息
		List<DimissionEmployeeInfo>  dimissionUserResumeInfos=new ArrayList<DimissionEmployeeInfo>();
		for (EmployeeInfo employeeInfo : employees) {
			UserTrackRecord userTrackRecord = userTrackRecordMapper.selectLastUserTrackRecord(employeeInfo.getUserId(),companyId);//给每个停用经济人添加交流信息
			DimissionEmployeeInfo	dimissionUserResumeInfo=new DimissionEmployeeInfo();
			dimissionUserResumeInfo.setEmployeeInfo(employeeInfo);
			dimissionUserResumeInfo.setUserTrackRecord(userTrackRecord);
			dimissionUserResumeInfos.add(dimissionUserResumeInfo);
		}
		return dimissionUserResumeInfos;
	}
	
	/*根据条件查找停用经济人的信息，包括最近的约谈信息*/
	@Transactional(readOnly=true)
	public List<DimissionEmployeeInfo> findDimissionUserInfoWithFactor(
			Page page, Date startDate, Date endDate, int education,
			String keyWord,int companyId,int talkNum,int [] black) {
		page.setRecords(employeeInfoMapper.selectDimissionEmployeeCountWithFactor(startDate, endDate, education, keyWord, companyId,talkNum,black));
		List<EmployeeInfo> employees = employeeInfoMapper.selectDimissionEmployeeWithFactor(page.getLimit(), startDate, endDate, education, keyWord, companyId,talkNum,black);//停用经济人的信息
		List<DimissionEmployeeInfo>  dimissionUserResumeInfos=new ArrayList<DimissionEmployeeInfo>();
		for (EmployeeInfo employeeInfo : employees) {
			UserTrackRecord userTrackRecord = userTrackRecordMapper.selectLastUserTrackRecord(employeeInfo.getUserId(),companyId);//给每个停用经济人添加交流信息
			DimissionEmployeeInfo	dimissionUserResumeInfo=new DimissionEmployeeInfo();
			dimissionUserResumeInfo.setEmployeeInfo(employeeInfo);
			dimissionUserResumeInfo.setUserTrackRecord(userTrackRecord);
			dimissionUserResumeInfos.add(dimissionUserResumeInfo);
		}
		return dimissionUserResumeInfos;
	}

	/*设置经济人为黑名单成员*/
	@Transactional
	public void updateDimissionUserToBlack(int[] ids1, int companyId,int redBlack) {
		userResumeBelongtoMapper.updateDimissionUserToBlack(ids1,companyId,redBlack);
		
	}
	/*给经济人发送节日问候*/
	@Override
	public String sendHolidayRegards(int employeeId,int companyId,String mailContent,String mailSubject) {
		EmployeeInfo empInfo = employeeInfoMapper.selectEmployeeById(employeeId);
		CfgCompany compayInfo = orgStructureMapper.selectCompanyInfoById(companyId);
		if(empInfo.getEmployeeInfoDetail()!=null){
			if(empInfo.getEmployeeInfoDetail().getEmail() !=null && compayInfo.getCompanyEmail()!=null){
				try{
					SimpleMail sm=new SimpleMail();
					sm.setSubject(mailSubject);
					sm.setContent(mailContent);
					SimpleMailSender sms=new SimpleMailSender(compayInfo.getCompanyEmail(),"123456abcd");
					sms.send(empInfo.getEmployeeInfoDetail().getEmail(), sm);
					return "SUCCESS";
				}catch (Exception e) {
					return "FAIL";
				}
			}
		}
		return "FAIL";
	}
}
