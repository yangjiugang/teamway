package com.teamway.test;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class TestTirm {

	public static void main(String[] args) {

		// String s = new String(" sss123 ");
		// System.out.println(s.trim()+"--");
		String str = new String("yulv#123456#yulv@21cn.com");
		Matcher matcher = Pattern.compile("#").matcher(str);
		if (matcher.find()) {
			System.out.println(matcher.start());
		} else {
			System.out.println("null");
		}
		//String receiverName=str.substring(0,matcher.start()).trim();
		 //System.out.println(receiverName);
	}

}
