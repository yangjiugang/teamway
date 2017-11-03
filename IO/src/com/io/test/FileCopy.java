package com.io.test;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class FileCopy {
	
	public static void main(String[] args) {
		int b = 0;
		FileReader in = null;
		FileWriter out = null;
		
		try {
			in = new FileReader("D:/dev/test1.ini");
			out = new FileWriter("D:/dev/testio.ini");
			while((b=in.read()) != -1){
				out.write(b);
			}
			out.close();
			in.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("文件已复制");
	}
}
