package com.fc.flf.common.util.mail;

import com.fc.flf.common.util.StringUtils;

public class MailActivate {
	/**
	 * 邮件单发
	 * @param mail
	 */
	
	public final static String URL = "http://127.0.0.1:8080/flf/mailverify?key=";
	public void SingleSend(String mail){
		SimpleMail sm=new SimpleMail();
		sm.setSubject("房乐会帐号激活");
		String str = "亲爱的顾客：<p>感谢您注册成为房立方房乐会成员，请点击以下链接完成您的账户激活。</p><p><a href="+URL+mail+">点此激活房乐会账号</a>";
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
