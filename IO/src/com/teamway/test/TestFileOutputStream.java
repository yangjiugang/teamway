package com.teamway.test;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class TestFileOutputStream {
	public static void main(String[] args) {
		int b = 0;
		FileInputStream in = null;
		FileOutputStream out = null;
		
		File f = new File("D:\\dwarfs_fileOutputStream.ini");
		try {
			if( !f.exists()) {
				f.createNewFile();
			}
			in = new FileInputStream("d:\\dwarfs.ini");
			out = new FileOutputStream("d:\\dwarfs_fileOutputStream.ini");
			while((b = in.read()) != -1) {
				out.write(b);
			}
			in.close();
			out.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
