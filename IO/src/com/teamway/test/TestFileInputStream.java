package com.teamway.test;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

public class TestFileInputStream {
	public static void main(String[] args) {
		int b = 0;
		FileInputStream in = null;

		try {
			in = new FileInputStream("d:\\dwarfs3.ini");

		} catch (FileNotFoundException e) {
			System.out.println("找不到指定文件");
			System.exit(-1);
			e.printStackTrace();
		}

		try {
			long num = 0;
			System.out.println("总共可读取字节:"+in.available());
			while ((b = in.read()) != -1) {
				System.out.println((char)b);
				num ++;
			}
			in.close();
			System.out.println();
			System.out.println("共读取了 "+num+" 个字节");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("文件读取错误"); System.exit(-1);
		}
	}
}
