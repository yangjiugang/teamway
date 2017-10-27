package com.teamway.test;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class TestFileReader {
	public static void main(String[] args) {
		FileReader fr = null;
		int c = 0;
		
		try {
			fr= new FileReader("d:\\dwarfs.ini");
			int in = 0;
			while((c = fr.read())!=-1) {
				System.out.println((char)c);
			}
			fr.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
