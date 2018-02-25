package com.fc.brms.common.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import com.fc.brms.common.conf.Config;

public class FileUtil {

	/**
	 * 判断路径是否存在，不存在就创建
	 * 
	 * @param path
	 */
	public static void pathExist(String path) {
		if (path.contains(".")) {
			path = path.substring(0, path.lastIndexOf(File.separator));
		}
		File file = new File(path);
		if (!file.exists()) {
			file.mkdirs();
		}
	}
	
	/**
	 * 保存文件
	 * @param is
	 * @param fileName
	 * @throws IOException
	 */
	public static void saveFile(InputStream is, String fileName) throws IOException {
		pathExist(fileName);
		OutputStream os = new FileOutputStream(new File(fileName));
		int bytesRead = 0;
		byte[] buffer = new byte[1024];
		while ((bytesRead = is.read(buffer, 0, 1024)) != -1) {
			os.write(buffer, 0, bytesRead);
		}
		os.close();
		is.close();
	}
	
	/**
	 * 删除文件
	 * @param fileName
	 */
	public static void delFile(String fileName) {
		File file = new File(fileName);
		if (file.exists())
			file.delete();
	}
	
	
	public static String getPath() {
		StringBuilder sb = new StringBuilder();
		sb.append(Config.getProperty("file.path"));
		pathExist(sb.toString());
		return sb.toString();
	}
	
	
	/**
	 * 获取文件存放的子文件夹和文件名称
	 * @param fileName
	 * @return 2个长度的字符串数组，names[0]操作系统路径格式，names[1]保存数据库的url格式
	 */
	public static String[] getFileName(String fileName) {
		String newFileName = String.valueOf(System.currentTimeMillis());
		String format = fileName.substring(fileName.indexOf('.'), fileName.length());
		String[] names = new String[2];
		names[0] = MD5.MD5Encoder(fileName + newFileName).substring(0, 2) + File.separator + newFileName + format;
		names[1] = names[0].replace(File.separator, "/");
		return names;
	}

}
