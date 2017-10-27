package com.teamway.test;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.Date;

public class TestPrintStream3 {
	public static void main(String[] args) {
		String s = null;
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		try {
			File f = new File("d:\\bak");
			if(!f.exists()) {
				f.mkdir();
			}
			File file = new File("d:\\bak\\logfile.log");
			if(!file.exists()) {
				file.createNewFile();
			}
			FileWriter fw = new FileWriter("d:\\bak\\logfile.log",true);
			PrintWriter log = new PrintWriter(fw);
			while((s = br.readLine()) != null) {
				if(s.equalsIgnoreCase("exit"))
					break;
					System.out.println(s.toUpperCase());
					log.println("--------------");
					log.println(s.toUpperCase());
					log.flush();
			}
			log.println("==="+new Date()+"==="); 
		      log.flush();
		      log.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
