package com.fc.flf.common.util;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ContextLoader;

public class ContextUtil {

	public static ApplicationContext getCtx() {
		ApplicationContext ctx = ContextLoader.getCurrentWebApplicationContext();
		return ctx;
	}

	public static Object getBean(String name) {
		return getCtx().getBean(name);
	}

	public static <T> T getBean(String name, Class<T> clazz) {
		return getCtx().getBean(name, clazz);
	}

}
