package com.teamway.test;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class TestBufferStream2 {
	public static void main(String[] args) {
		try {
			BufferedWriter bw = new BufferedWriter(new FileWriter("d:\\dwarfs_io_test.ini"));
			File f = new File("d:\\dwarfs_io_test.ini");
			if(!f.exists()) {
				f.createNewFile();
			}
			BufferedReader br = new BufferedReader(new FileReader("d:\\dwarfs3.ini"));
			String s = null;
			for (int i = 1; i <= 100; i++) {
				s = String.valueOf(Math.random());
				bw.write(s);
				bw.newLine();
			}
			bw.flush();
			while ((s = br.readLine()) != null) {
				System.out.println(s);
			}
			bw.close();
			br.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
