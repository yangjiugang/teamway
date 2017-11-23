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

import java.util.Date;

/**
 * 角色信息表(CMS_CONFIG_ROLE_VIEWS)
 * 
 * @author bianj
 * @version 1.0.0 2017-04-24
 */
public class Cms_config_role_viewsEntity implements java.io.Serializable {
    /** 版本号 */
    private static final long serialVersionUID = 5132514789454557114L;
    
    /**  */
    private Long id;
    
    /**  */
    private String role_id;
    
    /**  */
    private String camera_codes;
    
    /**  */
    private Date gmt_create;
    
    /**  */
    private Date gmt_modified;
    
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
     * 获取
     * 
     * @return 
     */
    public String getRole_id() {
        return this.role_id;
    }
     
    /**
     * 设置
     * 
     * @param role_id
     *          
     */
    public void setRole_id(String role_id) {
        this.role_id = role_id;
    }
    
    /**
     * 获取
     * 
     * @return 
     */
    public String getCamera_codes() {
        return this.camera_codes;
    }
     
    /**
     * 设置
     * 
     * @param camera_codes
     *          
     */
    public void setCamera_codes(String camera_codes) {
        this.camera_codes = camera_codes;
    }
    
    /**
     * 获取
     * 
     * @return 
     */
    public Date getGmt_create() {
        return this.gmt_create;
    }
     
    /**
     * 设置
     * 
     * @param gmt_create
     *          
     */
    public void setGmt_create(Date gmt_create) {
        this.gmt_create = gmt_create;
    }
    
    /**
     * 获取
     * 
     * @return 
     */
    public Date getGmt_modified() {
        return this.gmt_modified;
    }
     
    /**
     * 设置
     * 
     * @param gmt_modified
     *          
     */
    public void setGmt_modified(Date gmt_modified) {
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