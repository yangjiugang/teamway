package com.teamway.singleton;

public class SingletonTest {
	public static void main(String[] args) {
		Singleton s1 = Singleton.getSingleton();
		Singleton s2 = Singleton.getSingleton();
		
		System.out.println(s1==s2);
	}
}
