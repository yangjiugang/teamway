package com.teamway.test;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;

public class TestTransForm1 {
	public static void main(String[] args) {
		try {
			File f = new File("d:\\bak\\char.txt");
			if(!f.exists()) {
				f.createNewFile();
			}
			OutputStreamWriter osw = new OutputStreamWriter(new FileOutputStream("d:\\bak\\char.txt"));
			osw.write("mircosoftibmsunapplehp");
			System.out.println(osw.getEncoding());
			String s = new String("this is my first programing");
			osw.append(s, 0, s.length());
			osw.write("======hello,world!=====");
			osw.flush();
			osw.close();
			osw = new OutputStreamWriter(new FileOutputStream("d:\\bak\\char.txt", true),"ISO8859_1");
			osw.write("mircosoftibmsunapplehp");
		    System.out.println(osw.getEncoding());
		    osw.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
