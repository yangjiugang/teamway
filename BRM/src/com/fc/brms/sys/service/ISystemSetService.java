package com.fc.brms.sys.service;

import java.util.List;

import com.fc.brms.common.domain.CfgJobGrade;
import com.fc.brms.common.domain.CfgJobLevel;
import com.fc.brms.common.domain.CfgPost;
import com.fc.brms.common.domain.CfgPostJoblevel;
import com.fc.brms.common.util.Page;

public interface ISystemSetService {
	/**
	 * 查询职系
	 * @param cjg
	 * @param page
	 * @return
	 */
	public List<CfgPost> selectJobGrade(CfgPost cjg,Page page);
	/**
	 * 查询所有记录
	 * @param cjg
	 * @return
	 */
	public int selectJobGradeCount();
	/**
	 * 添加职系
	 * @param cjg
	 */
	public void insertJobGrade(CfgJobGrade cjg);
	/**
	 * 删除职系
	 * @param Id
	 */
	public void deleteJobGrade(int id);
	/**
	 * 修改职系
	 * @param cjg
	 */
	public void updataJobGrade(CfgJobGrade cjg);
	/**
	 * 根据id查询职系信息
	 * @param jobGradeId
	 * @return
	 */
	public CfgJobGrade selectJobGradeById(int jobGradeId);
	/*-------职等职级设置------------*/
	/**
	 * 查询职级对应岗位信息
	 * @param cjg
	 * @param page
	 * @return
	 */
	public List<CfgPost> selectJobLevel(CfgPost cjg,Page page);
	/**
	 * 查询职级设置所有记录
	 * @return
	 */
	public int selectJobLevelCount();
	/**
	 * 添加职等职级
	 * @param cjg
	 */
	public void insertJobLevel(CfgJobLevel cjl);
	/**
	 * 删除职等职级
	 * @param Id
	 */
	public void deleteJobLevel(int jobLevelId);
	/**
	 * 修改职等职级
	 * @param cjg
	 */
	public void updataJobLevel(CfgJobLevel cjl);
	/**
	 * 根据id查询职等职级信息
	 * @param jobGradeId
	 * @return
	 */
	public CfgJobLevel selectJobLevelById(int jobLevelId);
	/**
	 * 查询 CfgJobGrade中的职系名称，返回CfgJobGrade类型的list
	 * @return
	 */
	public List<CfgJobGrade> selectJobGradeName();
	/**
	 * 增加职等职级数据到cfg_post_joblevel
	 * @param pjl
	 */
	public void insertPostJoblevel(CfgPostJoblevel pjl);
	/**
	 * 修改 职等职级信息到关系表cfg_post_joblevel中
	 * @param pjl
	 */
	public void updataPostJoblevel(CfgPostJoblevel pjl);
	
}
