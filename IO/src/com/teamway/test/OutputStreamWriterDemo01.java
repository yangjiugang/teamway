package com.teamway.test;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;

public class OutputStreamWriterDemo01 {
	
	public static void main(String[] args) throws IOException {
		File f = new File ("d:"+File.separator+"test.txt");
		Writer  out = null;
		out = new OutputStreamWriter(new FileOutputStream(f));
		out.write("Hello World : !!");
		out.flush();
		out.close();;
	}
}
