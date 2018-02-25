package com.fc.flf.common.util;

public class Constants {

	/**
	 * '记住我的登录状态'功能的cookie名称
	 */
	public final static String REMEMBER_ME_COOKIE_NAME = "FLFREMEMBERME";
	
	/**
	 * 访问者类型 易介宝
	 */
	public final static String LOGIN_TYPE = "login_type";
	
	/**
	 * 访问者类型 易介宝
	 */
	public final static String ROLE_EAGENT = "ROLE_0";
	
	/**
	 * 访问者类型 房乐会
	 */
	public final static String ROLE_FPARTY = "ROLE_1";
	
	/**
	 * 访问者类型 系统
	 */
	public final static String ROLE_SYS = "ROLE_2";
	
	/**
	 * session记录当前易介宝访问模块
	 */
	public final static String EAGENT_MODULE_SESSION = "eagent_module_session";
	public static enum EAGENT_MODULES {
		HOME("home"),        // 个人主页
		CLIENT("client"),    // 客户
		HOUSE("house"),      // 房源
		ORDER("order"),      // 订单
		STUDY("study"),      // 学习
		FRIEND("friend"),    // 好友
		PLAY("play"),        // 吃喝玩乐
		MESSAGE("message"),  // 消息
        ;

        public String name;

        private EAGENT_MODULES(String name) {
            this.name = name;
        }
    }
	
}
