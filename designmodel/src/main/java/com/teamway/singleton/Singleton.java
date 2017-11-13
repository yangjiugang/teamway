package com.teamway.singleton;

public class Singleton {
	private static Singleton singleton = new Singleton();

	// 私有话构造方法
	private Singleton() {

	}

	public static Singleton getSingleton() {
		return singleton;
	}
}
