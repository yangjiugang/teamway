package com.tadu.utils.ftp;


import java.io.FileInputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class FtpCmsReader {

	private FileInputStream reader = null;
	private int pointer;
	private ByteBuffer bf  = ByteBuffer.allocate(1024);
	
	private int len;
	private byte b;
	
	/**
	 * 指定文件名的构造函数
	 * 
	 * @param filename
	 * @throws FileNotFoundException
	 */
	public FtpCmsReader(FileInputStream reader){
		this.reader = reader;
	}
	
	/**
	 * 读取一行数据
	 * 
	 * @return 数据分割好的数组
	 * @throws IOException 
	 * @throws IOException
	 * @throws DocumentException 
	
	public <T> List<T> readLine(Class c) throws IOException, DocumentException {		
		List<T> resultList = new ArrayList<T>();//构造泛型集合
		List<String> attrList = new ArrayList<String>();//获得每一行的属性集合 通过反射成对象 默认为字符串
		String fileName = c.getSimpleName();// 获得实体的名称 创建规则 根据实体的名称 创建对应xml book.java -- book.xml
		List<Map<String, String>> beanAttrList = FileFtpUtil.parseXml(fileName + ".xml");
		byte [] bs = new byte[reader.available()];//直接构造文件大小字节数的字节数组
		reader.read(bs);//读入数据到bs数组中
		int len = bs.length;
		int pointer = 0;
		while(pointer<len){
			b = bs[pointer++];
			System.out.println(b);
			if(b == -128){//当是特殊字符的时候 那么根据缓存区 构造字符串对象
				attrList.add(StringUtils.trim(new String(bf.array(), 0, bf.position(),"GBK")));
				System.out.println(new String(bf.array(), 0, bf.position(),"GBK"));
				bf.clear();
			}else if(b==10||pointer==len){//如果遇到换行符号 那么 降缓存区的最后一个属性加入到属性集合中 如果当前的pointer+ 和 len 相等 那么证明读取到完毕 封装最后一个实体对象
				attrList.add(StringUtils.trim(new String(bf.array(), 0, bf.position(),"GBK")));
				System.out.println(new String(bf.array(), 0, bf.position(),"GBK"));
				System.out.println("______________________________________________________________");
				bf.clear();//清空缓存区
				//T  t  = FileFtpUtil.transAttrToBean(attrList, c,beanAttrList);
				//resultList.add(t);
				attrList.clear();//清空集合
			}else{
				bf.put(b);
			}
		}
		reader.close();
		return resultList;
	}
	public static void main(String[] args) {
		try{
			FtpCmsReader reader = new FtpCmsReader(new FileInputStream("c:\\11.txt"));
			List<Books> list = reader.readLine(Books.class);
			}catch(FileNotFoundException e){
			e.printStackTrace();
		}catch (IOException e){
			e.printStackTrace();
		}catch(DocumentException e){
			e.printStackTrace();
		}
		
	}
	} */
}
