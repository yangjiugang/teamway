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
 * 服务器信息表（通讯控制器，NVR， 动环代理）(CMS_RES_STREAM_INFO)
 * 
 * @author bianj
 * @version 1.0.0 2017-04-24
 */
public class Cms_res_stream_infoEntity implements java.io.Serializable {
    /** 版本号 */
    private static final long serialVersionUID = -1836128504864166774L;
    
    /**  */
    private Integer id;
    
    /**  */
    private Integer type;
    
    /**  */
    private String name;
    
    /**  */
    private String username;
    
    /**  */
    private String password;
    
    /**  */
    private String ip;
    
    /**  */
    private Integer port;
    
    /**  */
    private Integer state;
    
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
    public Integer getType() {
        return this.type;
    }
     
    /**
     * 设置
     * 
     * @param type
     *          
     */
    public void setType(Integer type) {
        this.type = type;
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
    public String getUsername() {
        return this.username;
    }
     
    /**
     * 设置
     * 
     * @param username
     *          
     */
    public void setUsername(String username) {
        this.username = username;
    }
    
    /**
     * 获取
     * 
     * @return 
     */
    public String getPassword() {
        return this.password;
    }
     
    /**
     * 设置
     * 
     * @param password
     *          
     */
    public void setPassword(String password) {
        this.password = password;
    }
    
    /**
     * 获取
     * 
     * @return 
     */
    public String getIp() {
        return this.ip;
    }
     
    /**
     * 设置
     * 
     * @param ip
     *          
     */
    public void setIp(String ip) {
        this.ip = ip;
    }
    
    /**
     * 获取
     * 
     * @return 
     */
    public Integer getPort() {
        return this.port;
    }
     
    /**
     * 设置
     * 
     * @param port
     *          
     */
    public void setPort(Integer port) {
        this.port = port;
    }
    
    /**
     * 获取
     * 
     * @return 
     */
    public Integer getState() {
        return this.state;
    }
     
    /**
     * 设置
     * 
     * @param state
     *          
     */
    public void setState(Integer state) {
        this.state = state;
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