
package teamway.shenzhen.utils;

import java.io.File;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.ini4j.Ini;
import org.ini4j.InvalidFileFormatException;

/*
    配置文件读写
    配置文件采用 ini 文件格式
 */
public class Config
{
  private  Ini ini = new Ini();
  private File file =null;
    /*
        初始化配置文件
        path - 配置文件路径
     */
    public boolean initConfig(String path)
    {
    	try {
		    ini = new Ini();
		    file = new File(path);
//		    org.ini4j.Config config =  new org.ini4j.Config();
//		   // 设置Section允许出现重复
//		    config.setMultiSection(true); 
		    ini.getConfig().setEscape(false);
		    ini.getConfig().setMultiOption(false);
			ini.load(file);
			
		} catch (InvalidFileFormatException e) {
			e.printStackTrace();
			return false;
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
        return true;
    }

    /*
        读配置项
     */
    public String getValue(String section, String key)
    {
//    	System.out.println("获得的值为："+ini.get(section, key));
    	String value = ini.get(section, key);
    	try {
    		if(null != value) {
    			Matcher matcher=Pattern.compile("#").matcher(value);
    			if(matcher.find()) {
    				value = value.substring(0,matcher.start()).trim();
    			}else {
    				value = value.trim();
    			}
    		}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
    	return value;
    }

    /*
        设置配置项
     */
    public boolean setValue(String section, String key, String value)
    {
    	try {
//    		if(!ini.containsKey(section)) {
//    			ini.add(section);
//    		}
//    		Section s = ini.get(section);
//    		if(s.containsKey(key)) {
//    			s.add(key, value);
//    		}else {
//    			s.put(key, value);
//    		}
			ini.put(section, key, value);
			ini.store(file);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
    }

}
