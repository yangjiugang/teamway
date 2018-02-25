package com.fc.flf.common.util.mail;

import com.fc.flf.common.util.StringUtils;

public class MailActivateYjb {
	/**
	 * 邮件单发
	 * @param mail
	 */
	
	public final static String URL = "http://127.0.0.1:8080/flf/yjbmailverify?key=";
	public void SingleSend(String mail){
		SimpleMail sm=new SimpleMail();
		sm.setSubject("易介宝帐号激活");
		String str = "亲爱的顾客：<p>感谢您注册成为房立方易介宝成员，请点击以下链接完成您的账户激活。</p><p><a href="+URL+mail+">点此激活易介宝账号</a>";
		System.out.println(str);
		sm.setContent(str);
		SimpleMailSender sms=new SimpleMailSender("szfanglifang@163.com","123456abcd");
		try {
			sms.send(StringUtils.decrypt(mail), sm);
			System.out.println("执行完成！！");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
