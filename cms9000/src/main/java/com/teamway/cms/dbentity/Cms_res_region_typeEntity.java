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
 * 区域类型表(CMS_RES_REGION_TYPE)
 * 
 * @author bianj
 * @version 1.0.0 2017-04-24
 */
public class Cms_res_region_typeEntity implements java.io.Serializable {
    /** 版本号 */
    private static final long serialVersionUID = 1900313032575357845L;
    
    /**  */
    private Integer id;
    
    /**  */
    private String name;
    
    /**  */
    private String code;
    
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
    public Integer getId() {
        return this.id;
    }
     
    /**
     * 设置
     * 
     * @param id
     *          
     */
    public void setId(Integer id) {
        this.id = id;
    }
    
    /**
     * 获取
     * 
     * @return 
     */
    public String getName() {
        return this.name;
    }
     
    /**
     * 设置
     * 
     * @param name
     *          
     */
    public void setName(String name) {
        this.name = name;
    }
    
    /**
     * 获取
     * 
     * @return 
     */
    public String getCode() {
        return this.code;
    }
     
    /**
     * 设置
     * 
     * @param code
     *          
     */
    public void setCode(String code) {
        this.code = code;
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