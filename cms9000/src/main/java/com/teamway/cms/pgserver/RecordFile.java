package com.teamway.cms.pgserver;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.teamway.cms.pgutils.PG;
import com.teamway.cms.pgutils.PG.CPTYPE_STORAGEFILE;
import com.teamway.cms.pgutils.PGPojo;
import com.teamway.cms.pgutils.PGUtil;

public class RecordFile {
  
	
	public static List<CPTYPE_STORAGEFILE> get_recode_file(int chan , byte[] start, byte[] end) throws Exception
	{
		SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd HH"); 
		Date start_time = sf.parse(new String(start));
		Date end_time = sf.parse(new String(end));
		
		Long __start = start_time.getTime();
	    List<CPTYPE_STORAGEFILE>  list = new ArrayList<CPTYPE_STORAGEFILE>();
		for(__start= start_time.getTime();__start < end_time.getTime(); __start+= 3600000){
		  String begin_date=	sf.format(new Date(__start))+":00:00";  
		  String end_date=	sf.format(new Date(__start+=3600000))+":00:00";  
		  String name = __start+".mp4";
		  CPTYPE_STORAGEFILE file = new 	CPTYPE_STORAGEFILE(chan,1,1250000,begin_date.getBytes(),end_date.getBytes(),name.getBytes());	
		  list.add(file);
		}
		return list;
	}
	
	
	public static PGPojo  getPGPojoRecordFile(int session, int seq, int chan , byte[] start, byte[] end) throws Exception
	{
		List<CPTYPE_STORAGEFILE>  list = get_recode_file( chan ,  start, end) ;
		byte[] Types = new byte[list.size()];
		for(int i = 0; i< Types.length;i++){
			Types[i]=PG.CPTYPE_STORAGEFILE;
		}
		Object[] objs = new Object[list.size()];
		for(int i = 0; i< objs.length;i++){
			objs[i]=list.get(i);
		}
		return PGUtil.newInstancePGObject(PG.CTL_FINDFILE_RES, session, seq, Types, objs);
	}
	
	
	
}
