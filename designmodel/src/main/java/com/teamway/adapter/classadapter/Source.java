package com.teamway.adapter.classadapter;

/**
 * 类适配器
 * 核心思想就是：有一个Source类，拥有一个方法，待适配，目标接口时Targetable，通过Adapter类，将Source的功能扩展到Targetable里
 * @author gaven
 *
 */
public class Source {
	public void method1() {
		System.out.println("this is original method");
	}
}
