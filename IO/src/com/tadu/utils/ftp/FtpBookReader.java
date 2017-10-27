package com.tadu.utils.ftp;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
/**
 * 
 * @author gaven
 *

public class FtpBookReader extends FtpCmsReader {

	public FtpBookReader(File f) {super(f);}

	@Override
	public void readLine(){
		List<String> attrList = new ArrayList<String>();//获得每一行的属性集合 通过反射成对象 默认为字符串
		try{	
			FileInputStream reader = new FileInputStream(f);
			byte [] bs = new byte[reader.available()];//读入全部数据
			reader.read(bs);//读入数据到bs数组中
			int pointer = 0 ;//定义游标
			int len= bs.length; //初始化长度
			int line = 1; //定义到读取到多少行
			boolean flag = false;//标志是否是中文
			String sqlTemplate = null;//sql 
			Connection con = JdbcUtil.getConnection();
			con.setAutoCommit(false);
			Statement statement = con.createStatement();
			while(pointer<len){
				b=bs[pointer++];//获得字节
				m=bs[pointer];
				flag=Math.isChinese(b, m);//判断是否是中文
				String str = Math.bytesToHexString(b);//获得字节的16进制编码
				if("80".equals(str)){
					attrList.add(new String(bf.array(),0,bf.position(),"GBK"));
					bf.clear();
				}else if("0d".equals(Math.bytesToHexString(b))){//遇到換行符		
					if("0a".equals(Math.bytesToHexString(bs[pointer]))){
						attrList.add(new String(bf.array(),0,bf.position(),"GBK"));
						sqlTemplate = SqlUtil.sqlExtator("books.xml", SqlUtil.SQL_INSERT, attrList);
						statement.addBatch(sqlTemplate);//批量更新
						System.out.println(len + "----------"+ pointer);
					 if(line%1000==0||len == pointer+1){
					    statement.executeBatch();
					con.commit();
				 }
				System.out.println("同步 全量文件 ------正在读取文件 " + f.getName()+"读取到行"+ line +"------------"+"属性长度为"+attrList.size());
						System.out.println("插入一条数据成功--------------------------------------------------------------- sql" + sqlTemplate);				
						bf.clear();//清空缓存区
						attrList.clear();//清空集合数据
						pointer++;//游标前移
						line++;//记录行数增加
					}else{
						bf.put(b);
					}
				}else{
					 if(flag == true){//如果是中文 双字节放入缓冲区 游标前移一位
						 bf.put(b);
						 bf.put(m);
						 pointer++;
					}else{
						bf.put(b);
					 }								
			  }
			}
			JdbcUtil.close(statement,con);//释放连接
			reader.close();//关闭流
	      }catch(Exception e){
			System.out.println("同步全量文件出错 出错在" +attrList.get(2).toString());
			e.printStackTrace();
		}
	}
	}

 */









