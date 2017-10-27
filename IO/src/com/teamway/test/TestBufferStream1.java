package com.teamway.test;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

public class TestBufferStream1 {
	public static void main(String[] args) {
		try {
			FileInputStream fis = new FileInputStream("d:\\dwarfs.ini");
			BufferedInputStream bis = new BufferedInputStream(fis);
			int c = 0;
			System.out.println(bis.read()+"aaa");
			System.out.println(bis.read()+"bbb");

			bis.mark(100);
			for (int i = 0; i <= 10 && (c = bis.read()) != -1; i++) {
				System.out.println((char) c + " ");
			}
			System.out.println("----------------");
			bis.reset();

			for (int i = 0; i <= 10 && (c = bis.read()) != -1; i++) {
				System.out.println((char) c + "");
			}
			bis.close();

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
