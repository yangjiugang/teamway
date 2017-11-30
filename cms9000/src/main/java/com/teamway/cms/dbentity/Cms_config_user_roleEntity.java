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
 * 用户-角色关联表(CMS_CONFIG_USER_ROLE)
 * 
 * @author bianj
 * @version 1.0.0 2017-04-24
 */
public class Cms_config_user_roleEntity implements java.io.Serializable {
    /** 版本号 */
    private static final long serialVersionUID = 3384012725483423204L;
    
    /**  */
    private String id;
    
    /**  */
    private String user_id;
    
    /**  */
    private Long role_id;
    
    /**  */
    private Date gmt_create;
    
    /**  */
    private Date gmt_modified;
    
    /**
     * 获取
     * 
     * @return 
     */
    public String getId() {
        return this.id;
    }
     
    /**
     * 设置
     * 
     * @param id
     *          
     */
    public void setId(String id) {
        this.id = id;
    }
    
    /**
     * 获取
     * 
     * @return 
     */
    public String getUser_id() {
        return this.user_id;
    }
     
    /**
     * 设置
     * 
     * @param user_id
     *          
     */
    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }
    
    /**
     * 获取
     * 
     * @return 
     */
    public Long getRole_id() {
        return this.role_id;
    }
     
    /**
     * 设置
     * 
     * @param role_id
     *          
     */
    public void setRole_id(Long role_id) {
        this.role_id = role_id;
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
}