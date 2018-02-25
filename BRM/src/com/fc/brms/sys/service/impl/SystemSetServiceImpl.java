package com.fc.brms.sys.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fc.brms.common.domain.CfgJobGrade;
import com.fc.brms.common.domain.CfgJobLevel;
import com.fc.brms.common.domain.CfgPost;
import com.fc.brms.common.domain.CfgPostJoblevel;
import com.fc.brms.common.util.CommonUtil;
import com.fc.brms.common.util.Page;
import com.fc.brms.sys.mapper.ISystemSetMapper;
import com.fc.brms.sys.service.ISystemSetService;
@Service
public class SystemSetServiceImpl implements ISystemSetService {

	@Resource
	private ISystemSetMapper systemSetMapper;
	
	@Override
	public List<CfgPost> selectJobGrade(CfgPost cjg,Page page) {
		page.setRecords(selectJobGradeCount());
		page.setSidx(CommonUtil.changeDBColName(page.getSidx()));
		return  systemSetMapper.selectJobGrade(cjg, page);
	}

	@Override
	public int selectJobGradeCount() {
		return systemSetMapper.selectJobGradeCount();
	}

	@Override
	public void insertJobGrade(CfgJobGrade cjg) {
		systemSetMapper.insertJobGrade(cjg);
	}

	@Override
	public void deleteJobGrade(int id) {
		systemSetMapper.deleteJobGrade(id);
	}

	@Override
	public void updataJobGrade(CfgJobGrade cjg) {
		systemSetMapper.updataJobGrade(cjg);
	}
	@Override
	public CfgJobGrade selectJobGradeById(int jobGradeId) {
		return systemSetMapper.selectJobGradeById(jobGradeId);
	}
	/*-------------职等职级设置----------*/
	@Override
	public List<CfgPost> selectJobLevel(CfgPost cjg, Page page) {
		page.setRecords(selectJobLevelCount());
		page.setSidx(CommonUtil.changeDBColName(page.getSidx()));
		return systemSetMapper.selectJobLevel(cjg, page);
	}
	@Override
	public int selectJobLevelCount() {
		return systemSetMapper.selectJobLevelCount();
	}
	@Override
	public void insertPostJoblevel(CfgPostJoblevel pjl) {
		systemSetMapper.insertPostJoblevel(pjl);
	}
	
	@Override
	public void insertJobLevel(CfgJobLevel cjl) {
		systemSetMapper.insertJobLevel(cjl);
	}

	@Override
	public void deleteJobLevel(int jobLevelId) {
		systemSetMapper.deleteJobLevel(jobLevelId);
	}

	@Override
	public void updataJobLevel(CfgJobLevel cjl) {
		systemSetMapper.updataJobLevel(cjl);
	}

	@Override
	public CfgJobLevel selectJobLevelById(int jobLevelId) {
		return systemSetMapper.selectJobLevelById(jobLevelId);
	}

	@Override
	public List<CfgJobGrade> selectJobGradeName() {
		return systemSetMapper.selectJobGradeName();
	}
	@Override
	public void updataPostJoblevel(CfgPostJoblevel pjl) {
		systemSetMapper.updataPostJoblevel(pjl);
	}
}
