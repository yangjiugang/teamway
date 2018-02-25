package com.fc.flf.common.util;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;


/**
 * 
 * Get session info.
 * 
 * @author eddy song
 * @version 1.0 2012-01-12
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
     * @param orgId   访问者ID
     */
    public static void setVisitorId(HttpServletRequest request, int visitorId) {

    	setSessionAttribute(request, SessionKey.VISITOR_ID, visitorId);
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
     * @param orgId   访问者姓名
     */
    public static void setVisitorName(HttpServletRequest request, String visitorName) {

        setSessionAttribute(request, SessionKey.VISITOR_NAME, visitorName);
    }
    
    /**
     * Get session's 电子邮件
     * @param request 
     * @return
     * @throws Exception
     */
    public static String getEmail(HttpServletRequest request) throws Exception {

        return getSessionAttributeToStringNotNull(request, SessionKey.EMAIL);
    }
    
    /**
     * 
     * Set session's 电子邮件
     * 
     * @param request
     * @param orgId   电子邮件
     */
    public static void setEmail(HttpServletRequest request, String email) {

        setSessionAttribute(request, SessionKey.EMAIL, email);
    }
    
    /**
     * Get session's 电话
     * @param request 
     * @return
     * @throws Exception
     */
    public static String getPhone(HttpServletRequest request) throws Exception {

        return getSessionAttributeToStringNotNull(request, SessionKey.PHONE);
    }
    
    /**
     * 
     * Set session's 电话
     * 
     * @param request
     * @param orgId   电话
     */
    public static void setPhone(HttpServletRequest request, String phone) {

        setSessionAttribute(request, SessionKey.PHONE, phone);
    }
    
    /**
     * Get session's 用户状态
     * @param request 
     * @return
     * @throws Exception
     */
    public static int getVisitorStatus(HttpServletRequest request) throws Exception {

        return getSessionAttributeToInt(request, SessionKey.VISITOR_STATUS);
    }
    
    /**
     * 
     * Set session's 用户状态
     * 
     * @param request
     * @param orgId   用户状态
     */
    public static void setVisitorStatus(HttpServletRequest request, int visitorStatus) {
        setSessionAttribute(request, SessionKey.VISITOR_STATUS, visitorStatus);
    }
    
    /**
     * Get session's 用户类型
     * @param request 
     * @return
     * @throws Exception
     */
    public static String getVisitorType(HttpServletRequest request) throws Exception {

        return getSessionAttributeToStringNotNull(request, SessionKey.VISITOR_TYPE);
    }
    
    /**
     * 
     * Set session's 用户类型
     * 
     * @param request
     * @param orgId   用户类型
     */
    public static void setVisitorType(HttpServletRequest request, String visitorType) {
        setSessionAttribute(request, SessionKey.VISITOR_TYPE, visitorType);
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
     * @param orgId   登陆时间
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
     * @param orgId   登陆IP
     */
    public static void setLoginIP(HttpServletRequest request, String loginIP) {

        setSessionAttribute(request, SessionKey.LOGIN_IP, loginIP);
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
         * 访问者名称
         */
        VISITOR_NAME("VISITOR_NAME"),
        
        /**
         * 电子邮件 
         */
        EMAIL("EMAIL"),
        
        /**
         * 电话
         */
        PHONE("PHONE"),
        
        /**
         * 用户状态
         */
        VISITOR_STATUS("VISITOR_STATUS"),
        
        /**
         * 用户类型
         */
        VISITOR_TYPE("VISITOR_TYPE"),
        
        /**
         *登陆时间 
         */
        LOGIN_TIME("LOGIN_TIME"),
        
        /**
         * 登陆ip
         */
        LOGIN_IP("LOGIN_IP"),
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
    
    /**
     * 获取易介宝session中存放的模块名
     * @param request
     * @return
     */
    public static String getEagentModule(HttpServletRequest request) {
    	return (String)request.getSession().getAttribute(Constants.EAGENT_MODULE_SESSION);
    }
}
