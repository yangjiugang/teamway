package com.teamway.prototype;

/**
 * 将一个对象作为原型 对其进行复制 克隆 产生一个和原对象类似的新对象
 * 
 * @author gaven
 *
 */
/* Cloneable 是个标识性接口 所以重新的clone()方法可以以任何方法命名 */
public class Prototype implements Cloneable {
	public Object clone() throws CloneNotSupportedException {
		Prototype proto = (Prototype) super.clone();
		return proto;
	}

}
