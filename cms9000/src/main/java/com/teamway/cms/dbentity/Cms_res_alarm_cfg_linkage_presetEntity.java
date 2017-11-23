/*
 * Welcome to use the TableGo Tools.
 * 
 * http://vipbooks.iteye.com
 * http://blog.csdn.net/vipbooks
 * http://www.cnblogs.com/vipbooks
 * 
 * Author:bianj
 * Email:edinsker@163.com
 * Version:4.1.2
 */

package com.teamway.cms.dbentity;

/**
 * (CMS_RES_ALARM_CFG_LINKAGE_PRESET)
 * 
 * @author bianj
 * @version 1.0.0 2017-04-24
 */
public class Cms_res_alarm_cfg_linkage_presetEntity implements java.io.Serializable {
    /** 版本号 */
    private static final long serialVersionUID = -2621834720483520016L;
    
    /**  */
    private Long id;
    
    /** 告警资源类型  1-摄像机  2-IO设备 3-动环设备 */
    private Long cfg_id;
    
    /**  */
    private Integer preset_id;
    
    /**  */
    private Integer is_record;
    
    /**  */
    private String gmt_create;
    
    /**  */
    private String gmt_modified;
    
    /**  */
    private String remark;
    
    /**
     * 获取
     * 
     * @return 
     */
    public Long getId() {
        return this.id;
    }
     
    /**
     * 设置
     * 
     * @param id
     *          
     */
    public void setId(Long id) {
        this.id = id;
    }
    
    /**
     * 获取告警资源类型  1-摄像机  2-IO设备 3-动环设备
     * 
     * @return 告警资源类型  1-摄像机  2-IO设备 3-动环设备
     */
    public Long getCfg_id() {
        return this.cfg_id;
    }
     
    /**
     * 设置告警资源类型  1-摄像机  2-IO设备 3-动环设备
     * 
     * @param cfg_id
     *          告警资源类型  1-摄像机  2-IO设备 3-动环设备
     */
    public void setCfg_id(Long cfg_id) {
        this.cfg_id = cfg_id;
    }
    
    /**
     * 获取
     * 
     * @return 
     */
    public Integer getPreset_id() {
        return this.preset_id;
    }
     
    /**
     * 设置
     * 
     * @param preset_id
     *          
     */
    public void setPreset_id(Integer preset_id) {
        this.preset_id = preset_id;
    }
    
    /**
     * 获取
     * 
     * @return 
     */
    public Integer getIs_record() {
        return this.is_record;
    }
     
    /**
     * 设置
     * 
     * @param is_record
     *          
     */
    public void setIs_record(Integer is_record) {
        this.is_record = is_record;
    }
    
    /**
     * 获取
     * 
     * @return 
     */
    public String getGmt_create() {
        return this.gmt_create;
    }
     
    /**
     * 设置
     * 
     * @param gmt_create
     *          
     */
    public void setGmt_create(String gmt_create) {
        this.gmt_create = gmt_create;
    }
    
    /**
     * 获取
     * 
     * @return 
     */
    public String getGmt_modified() {
        return this.gmt_modified;
    }
     
    /**
     * 设置
     * 
     * @param gmt_modified
     *          
     */
    public void setGmt_modified(String gmt_modified) {
        this.gmt_modified = gmt_modified;
    }
    
    /**
     * 获取
     * 
     * @return 
     */
    public String getRemark() {
        return this.remark;
    }
     
    /**
     * 设置
     * 
     * @param remark
     *          
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }
}