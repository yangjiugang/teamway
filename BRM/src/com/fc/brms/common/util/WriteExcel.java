package com.fc.brms.common.util;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.fc.brms.account.web.LoginController;
import com.fc.brms.common.domain.EmployeePushCash;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.Number;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

public class WriteExcel {
	
	private static Log logger = LogFactory.getLog(LoginController.class);
	
	/**
	 * 
	 * @param sd 需要写入Excel的数据
	 * @param file 写入的目标文件
	 * @return
	 */
 public WriteExcel(List<EmployeePushCash> cashs,File file){
	 try   {
         //  打开文件
        WritableWorkbook book  =  Workbook.createWorkbook(file);
         //  生成名为“第一页”的工作表，参数0表示这是第一页
        WritableSheet sheet  =  book.createSheet( " 第一页 " ,  0 );

         //  将定义好的单元格添加到工作表中

        for(int j = 0 ; j < cashs.size() ; j++){
        	if(j == 0){ 
        		Label label  =   new  Label( 0 ,  j ,  "员工编号" ); 
        		Label label1  =   new  Label( 1 ,  j ,  "员工姓名" ); 
        		Label label2  =   new  Label( 2 ,  j ,  "员工部门" ); 
        		Label label3  =   new  Label( 3 ,  j ,  "员工岗位" ); 
        		Label label4  =   new  Label( 4 ,  j ,  "本月提成" ); 	
        		Label label5  =   new  Label( 5 ,  j ,  "提成开始日期" ); 
        		Label label6  =   new  Label( 6 ,  j ,  "提成结束日期" ); 
        		sheet.addCell(label);       			
        		sheet.addCell(label1);       			
        		sheet.addCell(label2);       			
        		sheet.addCell(label3);       			
        		sheet.addCell(label4);
        		sheet.addCell(label5);     
        		sheet.addCell(label6);         			       			
    		}else{
            	Label label = new Label(0,j,cashs.get(j).getEmployeeInfo().getEmployeeNum());
            	Label label1 = new Label(1,j,cashs.get(j).getEmployeeInfo().getUserName());
            	Label label2 = new Label(2,j,cashs.get(j).getEmployeeInfo().getOrganizationName());
            	Label label3 = new Label(3,j,cashs.get(j).getEmployeeInfo().getPostName());
            	/*
	             * 生成一个保存数字的单元格 必须使用Number的完整包路径，否则有语法歧义 
	             */
            	Number number = new Number(4,j,cashs.get(j).getPushMoney());
            	Label label4 = new Label(5,j,(new SimpleDateFormat("yyyy-MM-dd").format(cashs.get(j).getPushStartDate())));
            	Label label5 = new Label(6,j,(new SimpleDateFormat("yyyy-MM-dd").format(cashs.get(j).getPushStartDate())));
        		sheet.addCell(label);       			
        		sheet.addCell(label1);       			
        		sheet.addCell(label2);       			
        		sheet.addCell(label3);   
        		sheet.addCell(number);         			
        		sheet.addCell(label4);        			
        		sheet.addCell(label5);  
    		}			  
        	}

         //  写入数据并关闭文件
        book.write();
        book.close();

    }   catch  (Exception e)  {
    	logger.error(e);
    }
 } 
}
