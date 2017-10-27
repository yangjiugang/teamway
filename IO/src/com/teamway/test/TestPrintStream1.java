package com.teamway.test;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.PrintStream;

public class TestPrintStream1 {
	public static void main(String[] args) {
		PrintStream ps = null;
		try {
			FileOutputStream fos = new FileOutputStream("d:\\testobjectio.dat");
			ps = new PrintStream(fos);

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		if (ps != null) {
			System.setOut(ps);
		}
		int in = 0;

		for (char c = 0; c <= 60000; c++) {
			System.out.println(c + " ");
			if (in++ >= 100) {
				System.out.println();
				in = 0;
			}
		}

	}
}
