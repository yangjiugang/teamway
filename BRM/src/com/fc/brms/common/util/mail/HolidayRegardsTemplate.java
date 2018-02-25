package com.fc.brms.common.util.mail;

public class HolidayRegardsTemplate {
	public String getTemplate(String userName,String companyName,
			String sendUserName,String HolidayDate,String HolidayName){
		String mailContent="<div style='width: 590px; border: 1px solid #C5E4F9; color: #898989; padding: 10px 18px 16px 16px; margin-bottom: 20px; font-size: 12px; position: relative; margin: 0 auto;'>"+
		"<p>尊敬的<span style='color: #000; border-bottom: 1px solid #C5E4F9; padding-bottom: 2px;'>"+userName+"</span>： </p>"+
		"<p style='text-indent: 2em;'>我是"+
		"<span style='color: #000; border-bottom: 1px solid #C5E4F9; padding-bottom: 2px;'>"+companyName+"</span>hr"+
		"<span style='color: #000; border-bottom: 1px solid #C5E4F9; padding-bottom: 2px;'>"+sendUserName+"</span>，"+
		"<span style='color: #000; border-bottom: 1px solid #C5E4F9; padding-bottom: 2px;'>"+HolidayDate+"</span>是我国传统佳节"+
		"<span style='color: #000; border-bottom: 1px solid #C5E4F9; padding-bottom: 2px;'>"+HolidayName+"</span>，特此提醒您！"+
		"</p>"+
		"<h5 style='font-size: 12px; font-weight: normal; text-align: right; padding: 30px 150px 0 0;'>祝愉快!</h5>"+
		"</div>";
		return mailContent;
	}
	
	public static String getBirthModel(String userName,String companyName,String sendUserName,String birthday){
		String mailContent="<div style='width: 590px; border: 1px solid #C5E4F9; color: #898989; padding: 10px 18px 16px 16px; margin-bottom: 20px; font-size: 12px; position: relative; margin: 0 auto;'>"+
				"<p>尊敬的<span style='color: #000; border-bottom: 1px solid #C5E4F9; padding-bottom: 2px;'>"+userName+"</span>： </p>"+
				"<p style='text-indent: 2em;'>我是"+
				"<span style='color: #000; border-bottom: 1px solid #C5E4F9; padding-bottom: 2px;'>"+companyName+"</span>hr"+
				"<span style='color: #000; border-bottom: 1px solid #C5E4F9; padding-bottom: 2px;'>"+sendUserName+"</span>，"+
				"<span style='color: #000; border-bottom: 1px solid #C5E4F9; padding-bottom: 2px;'>"+birthday+"</span>日是您的生日，我仅代表公司祝贺你 生日快乐！"+
				"</p>"+
				"<h5 style='font-size: 12px; font-weight: normal; text-align: right; padding: 30px 150px 0 0;'>祝愉快!</h5>"+
				"</div>";
		return mailContent;	
	}
}
