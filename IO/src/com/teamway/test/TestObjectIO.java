package com.teamway.test;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;

public class TestObjectIO {
	public static void main(String[] args) {
		T t = new T();
		t.k = 8;
		try {
			File f = new File("d:\\testobjectio.dat");
			if(!f.exists()) {
				f.createNewFile();
			}
			FileOutputStream fos = new FileOutputStream("d:\\testobjectio.dat");
			ObjectOutputStream oos = new ObjectOutputStream(fos);
			oos.writeObject(t);
			oos.flush();
			oos.close();
			
			FileInputStream fis = new FileInputStream("d:\\testobjectio.dat");
			ObjectInputStream ois = new ObjectInputStream(fis);
			T  tReaded = (T)ois.readObject();
			System.out.println(tReaded.i+""+tReaded.j+""+tReaded.d+""+tReaded.k);
			ois.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
}

class  T implements Serializable {
	int i = 10;
	int j = 9;
	double d = 2.3;
	transient int k = 15;
}
