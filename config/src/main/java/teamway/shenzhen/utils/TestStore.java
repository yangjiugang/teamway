package teamway.shenzhen.utils;

import java.io.File;
import java.io.IOException;

import org.ini4j.Ini;

public class TestStore {

	public static void main(String[] args) throws IOException {
		File file = new File("d:\\ini");
		if (!file.exists()) {
			file.mkdirs();
		}
		file = new File("d:ini\\testStore.ini");
		if (!file.exists()) {
			file.createNewFile();
		}
		
		Ini ini = new Ini();
		ini.add("hello");
		ini.add(":$#￥hello%","world1","http://www.baidu.com:8080+++   ::   :: ///   ## 測試注釋和其他功能 、、、、、、、\\\\   % @ ￥ $ ^ ** ！* ~%------ ++  ======");
//		ini.getConfig().setEscape(false); //默认true 表示对所有内容进行转义
//		ini.getConfig().setEscapeKeyOnly(true);//默认false  是否只对key进行转义
		ini.store(file);
		
//		EscapeTool es =  EscapeTool.getInstance();
//		System.out.println(es.escape(":world2"));
//		System.out.println(es.unescape(":world2"));
	}
	

}
