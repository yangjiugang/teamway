package com.fc.brms.common.util;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;


/**
 * 
 * Get session info.
 * 
 * @author eddy song
 * @version 1.0 2012-03-27
 */
public class SessionInfo {

	private static Logger logger = Logger.getLogger(SessionInfo.class);
  
    /**
     * Get session's 访问者ID
     * @param request 
     * @return
     * @throws Exception
     */
    public static int getVisitorId(HttpServletRequest request) throws Exception {

        return getSessionAttributeToInt(request, SessionKey.VISITOR_ID);
    }
    
    /**
     * 
     * Set session's 访问者ID.
     * 
     * @param request
     * @param visitorId   访问者ID
     */
    public static void setVisitorId(HttpServletRequest request, int visitorId) {

    	setSessionAttribute(request, SessionKey.VISITOR_ID, visitorId);
    }
    
    /**
     * Get session's 公司ID
     * @param request 
     * @return
     * @throws Exception
     */
    public static int getCompanyId(HttpServletRequest request) throws Exception {

        return getSessionAttributeToInt(request, SessionKey.COMPANY_ID);
    }
    
    /**
     * 
     * Set session's 公司ID.
     * 
     * @param request
     * @param companyId  公司ID
     */
    public static void setCompanyId(HttpServletRequest request, int companyId) {

    	setSessionAttribute(request, SessionKey.COMPANY_ID, companyId);
    }
    
    /**
     * Get session's 公司名称
     * @param request 
     * @return
     * @throws Exception
     */
    public static String getCompanyName(HttpServletRequest request) throws Exception {

        return getSessionAttributeToStringNotNull(request, SessionKey.COMPANY_NAME);
    }
    
    /**
     * 
     * Set session's 公司ID.
     * 
     * @param request
     * @param companyId  公司ID
     */
    public static void setCompanyName(HttpServletRequest request, String companyName) {

    	setSessionAttribute(request, SessionKey.COMPANY_NAME, companyName);
    }
    
    /**
     * Get session's 访问者姓名
     * @param request 
     * @return
     * @throws Exception
     */
    public static String getVisitorName(HttpServletRequest request) throws Exception {

        return getSessionAttributeToStringNotNull(request, SessionKey.VISITOR_NAME);
    }
    
    /**
     * 
     * Set session's 访问者姓名
     * 
     * @param request
     * @param visitorName   访问者姓名
     */
    public static void setVisitorName(HttpServletRequest request, String visitorName) {

        setSessionAttribute(request, SessionKey.VISITOR_NAME, visitorName);
    }
    
    /**
     * Get session's 用户状态
     * @param request 
     * @return
     * @throws Exception
     */
    public static int getUserStatus(HttpServletRequest request) throws Exception {

        return getSessionAttributeToInt(request, SessionKey.USER_STATUS);
    }
    
    /**
     * 
     * Set session's 用户状态
     * 
     * @param request
     * @param userStatus   用户状态
     */
    public static void setUserStatus(HttpServletRequest request, int userStatus) {
        setSessionAttribute(request, SessionKey.USER_STATUS, userStatus);
    }
    
    /**
     * Get session's 登陆时间
     * @param request 
     * @return
     * @throws Exception
     */
    public static String getLoginTime(HttpServletRequest request) throws Exception {

        return getSessionAttributeToStringNotNull(request, SessionKey.LOGIN_TIME);
    }
    
    /**
     * 
     * Set session's 登陆时间
     * 
     * @param request
     * @param loginTime   登陆时间
     */
    public static void setLoginTime(HttpServletRequest request, String loginTime) {

        setSessionAttribute(request, SessionKey.LOGIN_TIME, loginTime);
    }
    
    /**
     * Get session's 登陆IP
     * @param request 
     * @return
     * @throws Exception
     */
    public static String getLoginIP(HttpServletRequest request) throws Exception {

        return getSessionAttributeToStringNotNull(request, SessionKey.LOGIN_IP);
    }
    
    /**
     * 
     * Set session's 登陆IP
     * 
     * @param request
     * @param loginIP   登陆IP
     */
    public static void setLoginIP(HttpServletRequest request, String loginIP) {

        setSessionAttribute(request, SessionKey.LOGIN_IP, loginIP);
    }
    
    /**
     * Get session's 部门ID
     * @param request 
     * @return
     * @throws Exception
     */
    public static int getOrganizationId(HttpServletRequest request) throws Exception {
        return getSessionAttributeToInt(request, SessionKey.ORGANIZATION_ID);
    }
    
    /**
     * Set session's 部门ID
     * @param request
     * @param organizationId  
     */
    public static void setOrganizationId(HttpServletRequest request, int organizationId) {
        setSessionAttribute(request, SessionKey.ORGANIZATION_ID, organizationId);
    }
    
    /**
     * Get session's 部门名字
     * @param request 
     * @return
     * @throws Exception
     */
    public static String getOrganizationName(HttpServletRequest request) throws Exception {
        return getSessionAttributeToStringNotNull(request, SessionKey.ORGANIZATION_NAME);
    }
    
    /**
     * Set session's 部门名字
     * @param request
     * @param organizationName 
     */
    public static void setOrganizationName(HttpServletRequest request, String organizationName) {
        setSessionAttribute(request, SessionKey.ORGANIZATION_NAME, organizationName);
    }
    
    /**
     * 
     * @param helper
     * @param key
     * @return
     * @throws Exception
     */
    private static String getSessionAttributeToStringNotNull(HttpServletRequest request, SessionKey key)
        throws Exception {

        try {
            return getSessionAttribute(request, key.getKey()).toString();
        }
        catch (NullPointerException npe) {
            logger.error("Session error : user is null!", npe);
            throw new Exception("Session error : user is null!");
        }
    }
    
    /**
     * 
     * @param helper
     * @param key
     * @return
     * @throws Exception
     */
    private static int getSessionAttributeToInt(HttpServletRequest request, SessionKey key)
        throws Exception {

        try {
            return (Integer)request.getSession().getAttribute(key.getKey());
        }
        catch (NullPointerException npe) {
            logger.error("Session error : user is null!", npe);
            throw new Exception("Session error : user is null!");
        }
    }
    
    /**
     * 
     * @param request
     * @param key
     * @return
     */
    private static String getSessionAttribute(HttpServletRequest request, String key) {

        return (String) request.getSession().getAttribute(key);
    }

    /**
     * 
     * @param request
     * @param key
     * @return
     */
    private static void setSessionAttribute(HttpServletRequest request, SessionKey key, String value) {
        request.getSession().setAttribute(key.getKey(), value);
    }
    
    /**
     * 
     * @param request
     * @param key
     * @return
     */
    private static void setSessionAttribute(HttpServletRequest request, SessionKey key, int value) {
        request.getSession().setAttribute(key.getKey(), value);
    }
    
    
    private enum SessionKey {

        /**
         * 访问者ID
         */
        VISITOR_ID("VISITOR_ID"),
        
        /**
         * 公司ID
         */
        COMPANY_ID("COMPANY_ID"),
        
        /**
         * 公司名称
         */
        COMPANY_NAME("COMPANY_NAME"),
        
        /**
         * 访问者名称
         */
        VISITOR_NAME("VISITOR_NAME"),
        
        /**
         * 用户状态
         */
        USER_STATUS("USER_STATUS"),
        
        /**
         *登陆时间 
         */
        LOGIN_TIME("LOGIN_TIME"),
        
        /**
         * 登陆ip
         */
        LOGIN_IP("LOGIN_IP"),
        /**
         * 部门ID
         */
        ORGANIZATION_ID("ORGANIZATION_ID"),
        /**
         * 部门名字
         */
        ORGANIZATION_NAME("ORGANIZATION_NAME"),
        ;
        private String key;

        private SessionKey(String key) {
            this.key = key;
        }

        private String getKey() {
            return this.key;
        }
    }
    
    /**
     * 设置session值
     * @param request
     * @param name
     * @param value
     */
    public static void setSessionAttribute(HttpServletRequest request, String name, String value) {
        request.getSession().setAttribute(name, value);
    }
    
    /**
     * 删除session值
     * @param request
     * @param name
     * @param value
     */
    public static void removeSessionAttribute(HttpServletRequest request, String name) {
        request.getSession().removeAttribute(name);
    }
}
