package com.fc.brms.broker.service;

import java.util.List;
import java.util.Map;

import com.fc.brms.common.domain.CfgJobGrade;
import com.fc.brms.common.domain.CfgJobLevel;
import com.fc.brms.common.domain.CfgOrganization;
import com.fc.brms.common.domain.EmployeeInfo;
import com.fc.brms.common.domain.EmployeePushCash;

public interface IEmployeePushService {

/**
 * 查询提成信息
 * @param map 条件 分页参数
 * @return List<EmployeePushCash>
 */
public List<EmployeePushCash> findPushForDate(Map<String,Object> map);

/**
 * 根据提成Id查询
 * @param map
 * @return
 */
public EmployeePushCash findPushForPushId(EmployeePushCash pushCash);

/**
 * 提成调整
 * @param cash
 */
public void updatePush(Map<String, Object> map);
/**
 * 查询职系
 * @return List<CfgJobGrade>
 */
public List<CfgJobGrade> findJobGrade();

/**
 * 根据职系查询职级信息
 * @param jobGradeId
 * @return List<CfgJobGrade>
 */
public List<CfgJobLevel> findJobLevelForGrade(int jobGradeId);

/**
 * 查询部门信息
 * @return List<CfgOrganization>
 */
public List<CfgOrganization> findOrganization();

/**
 * 根据PushId查询employeeId
 * @param pushId
 * @return
 */
public int findEmployeeId(int pushId);

/**
 * 根据employeeId查询信息
 * @param employeeId
 * @return
 */
public List<EmployeePushCash> findPushForEmployeeId(int employeeId);

/**
 * 根据employeeId查询employeeInfo信息
 * @param employeeId
 * @return
 */
public List<EmployeeInfo> findEmployeeForEployeeId(String items);


/**
 * 添加提成
 * @param pushCash
 */
public void insertPushCash(Map<String,Object> map);

/**
 * 根据登陆Id查询部门Id
 * @param employeeId
 * @return
 */
public int findOrganizationId(int employeeId);

/**
 * 历史提成结构分析
 * @param map
 * @return
 */
public List<EmployeePushCash> historyPushAnalyse(Map<String, Object> map);


public Double historyPushAnalyseAvg(Map<String, Object> map);

public int historyPushAnalyseSum(Map<String, Object> map);

/**
 * 查看该提成记录是否存在
 * @param map
 * @return
 */
public Boolean findEmployeePushIsTrue(Map<String, Object> map);
}
