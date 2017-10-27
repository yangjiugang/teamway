package com.teamway.test;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.PushbackInputStream;

public class TestPushbackInputStream {

	public static void main(String[] args) {
		try {
			PushbackInputStream push = new PushbackInputStream(new FileInputStream("D:\\bak\\log.log"));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
