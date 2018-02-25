package com.fc.brms.broker.web;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.fc.brms.common.domain.EmployeeInfo;
import com.fc.brms.common.domain.EmployeePushCash;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import jxl.write.Label;
import jxl.write.Number;
import jxl.write.WritableCell;
import jxl.write.WritableCellFormat;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

public class test {
		public static void main(String[] args) {				
//			readExcel();
			ArrayList a = new ArrayList();
			ArrayList ab = new ArrayList();
			for(int i = 0 ; i < 6 ; i++){
				a.add("nihao");
			}
			for(int i = 0 ; i < 6 ; i++){
				ab.add(a);
			}
			writeData("D:/model1.xls", "D:/excelTest.xls", ab);
	        }

	        /**
	         * 功能: 向Excel里写数据
	         *
	         * @param sourceFile
	         *            从服务器下载下来的源文件
	         * @param newFile
	         *            copy源文件得到的新文件,用于写入数据
	         * @throws Exception
	         * @author chenjian 2007-3-22 上午11:20:12
	         */
	        public static void writeData(String sourceFile, String newFile,
	                        ArrayList arr) {

	                Workbook wb = null;
	                WritableWorkbook wwb = null;
	                WritableSheet wsB = null;
	                try {
	                        // 创建只读的Excel工作薄的对象
	                		File file = new File(sourceFile);
	                        wb = Workbook.getWorkbook(file);
	                        // copy上面的Excel工作薄,创建新的可写入的Excel工作薄对象
	                        wwb = Workbook.createWorkbook(new File(newFile), wb);
	                        // 读取工作表--(注:工作表索引从0开始)
	                        wsB = wwb.getSheet(0);
	                        // 循环插入数据
	                        for (int i = 0; i < arr.size(); i++) {
	                                ArrayList rowArr = (ArrayList) arr.get(i);
	                                for (int j = 0; j < rowArr.size(); j++) {
	                                        WritableCell wc = null;
	                                        // 以第一行所有的列为模板，
	                                        wc = wsB.getWritableCell(j, 1);
	                                        WritableCellFormat wcFormat = null;
	                                        if (wc.getCellFormat() != null) {
	                                                // 获得源单元格格式
	                                                wcFormat = new WritableCellFormat(wc.getCellFormat());
	                                        } else {
	                                                wcFormat = new WritableCellFormat();
	                                        }
	                                        wc = cloneCellWithValue(j, i + 1, rowArr.get(j),wcFormat );
	                                        wsB.addCell(wc);
	                                }
	                        }
	                        // 写入Excel对象
	                        wwb.write();
	                } catch (BiffException e) {
	                        e.printStackTrace();
	                } catch (IOException e) {
	                        e.printStackTrace();
	                } catch (RowsExceededException e) {
	                        e.printStackTrace();
	                } catch (WriteException e) {
	                        e.printStackTrace();
	                } finally {
	                        // 关闭可写入的Excel对象
	                        try {
	                                if (null != wwb)
	                                        wwb.close();
	                        } catch (Exception e) {
	                                e.printStackTrace();
	                        }
	                        // 关闭只读的Excel对象
	                        if (null != wb)
	                                wb.close();
	                }
		    }
		
	        public static WritableCell cloneCellWithValue(int col, int row,
                    Object value, WritableCellFormat wcFormat) {
            WritableCell wc = null;
            // 判断数据是否为STRING类型，是用LABLE形式插入，否则用NUMBER形式插入
            if(value == null){
                    wc = new jxl.write.Blank(col, row, wcFormat);
            }
            else if (value instanceof String) {
                    jxl.write.Label label = new jxl.write.Label(col, row, value
                                    .toString(), wcFormat);
                    wc = label;
            }
            else {
                    wc = new jxl.write.Number(col, row, new Double(value.toString())
                    .doubleValue(), wcFormat);
            }
            return wc;
    }
	        
		public static void readExcel(){
			try   {
	            Workbook book  =  Workbook.getWorkbook( new File("D:/testss.xls"));
	             //  获得第一个工作表对象
	            Sheet sheet  =  book.getSheet( 0 );
	             //  得到第一列第一行的单元格
	            int columns = sheet.getColumns();
	            int row = sheet.getRows();
	            for(int y = 0 ; y < row ; y ++){
	            	for(int x = 0 ; x < columns ; x ++){
	            		if(y==0){
	            			Cell cell1 = null;
		    	            String employeeId = "";
		    	            String userName ="";
		    	            String organizationName="";
		    	            String postName="";
		    	            String pushMoney = "";
		    	            String startDate = "";
		    	            String endDate = "";
	            				if(x == 0){
	            					cell1 =  sheet.getCell(x,y);
	            					employeeId = cell1.getContents(); 
	            					}
	            				if(x == 1){ 
	            					cell1  =  sheet.getCell(x,y);
	            					userName = cell1.getContents(); 
	            				}
	            				if(x == 2){ 
	            					cell1  =  sheet.getCell(x,y);
	            					organizationName = cell1.getContents(); 
	            				}
	            				if(x == 3){ 
	            					cell1  =  sheet.getCell(x,y);
	            					postName = cell1.getContents(); 
	            				}
	            				if(x == 4){ 
	            					cell1  =  sheet.getCell(x,y);
	            					pushMoney = cell1.getContents(); 
	            				}
	            				if(x == 5){ 
	            					cell1  =  sheet.getCell(x,y);
	            					startDate = cell1.getContents(); 
	            				}
	            				if(x == 6){ 
	            					cell1  =  sheet.getCell(x,y);
	            					endDate = cell1.getContents(); 
	            				}
//	            			if(("员工编号"==employeeId||"员工编号".equals(employeeId))&&
//	            			   ("员工姓名"==userName||"员工姓名".equals(userName))&&
//	            			   ("员工部门"==organizationName||"员工部门".equals(organizationName))&&
//	            			   ("员工岗位"==)){
//	            					
//	            			}
	            		} else{
	            			int employeeId = 0;
		    	            String userName ="";
		    	            String organizationName="";
		    	            String post="";
		    	            int pushMoney = 0;
		    	            String startDate = "";
		    	            String endDate = "";
	            		}
	    	            Cell cell1  =  sheet.getCell( x ,  y );
	    	            String result  =  cell1.getContents();
	    	            System.out.println(result);
	            	}
	            }
	            book.close();
	        }   catch  (Exception e)  {
	            System.out.println(e);
	        } 
		}
		
}
