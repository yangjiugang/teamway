package teamway.shenzhen.utils;

import java.io.File;
import java.io.IOException;

public class TestConfig {
	public static void main(String[] args) throws IOException {
		
		String path = "D:\\dwarfs4.ini";
		File f  = new File(path);
		if(!f.exists()) {
			f.createNewFile();
		}
		Config c = new Config();
		
		//测试加载
		c.initConfig(path);
		
		//测试增加数据
		for(int i = 0; i <=10;i++) {
			String section = "section"+i;
			String key = "key"+i;
//			String value = "测试增加数据"+i;
			c.setValue(section, key,"http://www.baidu.com:8080+++     :: ///   ## 測試注釋和其他功能 、、、、、、、\\\\   % @ ￥ $ ^ ** ！* ~%------ ++  ======");
		}
		
		//测试读取数据

		System.out.println(c.getValue("section3","kfjakfakfj"));
//		System.out.println(c.getValue("db","user"));
//		System.out.println(c.getValue("db","password"));
		
	}

}
