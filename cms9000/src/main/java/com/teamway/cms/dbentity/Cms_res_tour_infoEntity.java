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
 * 轮巡信息表 (CMS_RES_TOUR_INFO)
 * 
 * @author bianj
 * @version 1.0.0 2017-04-24
 */
public class Cms_res_tour_infoEntity implements java.io.Serializable {
    /** 版本号 */
    private static final long serialVersionUID = 1650226951247094052L;
    
    /** 默认保留：id=0，空节点；id=1，虚拟根节点，这样可以兼容多棵数形结构，id >= 2开始 */
    private Long id;
    
    /**  */
    private String name;
    
    /** 轮巡间隔 */
    private Integer interval;
    
    /**  */
    private Date gmt_create;
    
    /**  */
    private Date gmt_modifield;
    
    /**  */
    private String remark;
    
    /**
     * 获取默认保留：id=0，空节点；id=1，虚拟根节点，这样可以兼容多棵数形结构，id >= 2开始
     * 
     * @return 默认保留：id=0
     */
    public Long getId() {
        return this.id;
    }
     
    /**
     * 设置默认保留：id=0，空节点；id=1，虚拟根节点，这样可以兼容多棵数形结构，id >= 2开始
     * 
     * @param id
     *          默认保留：id=0，空节点；id=1，虚拟根节点，这样可以兼容多棵数形结构，id >= 2开始
     */
    public void setId(Long id) {
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
     * 获取轮巡间隔
     * 
     * @return 轮巡间隔
     */
    public Integer getInterval() {
        return this.interval;
    }
     
    /**
     * 设置轮巡间隔
     * 
     * @param interval
     *          轮巡间隔
     */
    public void setInterval(Integer interval) {
        this.interval = interval;
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
    public Date getGmt_modifield() {
        return this.gmt_modifield;
    }
     
    /**
     * 设置
     * 
     * @param gmt_modifield
     *          
     */
    public void setGmt_modifield(Date gmt_modifield) {
        this.gmt_modifield = gmt_modifield;
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