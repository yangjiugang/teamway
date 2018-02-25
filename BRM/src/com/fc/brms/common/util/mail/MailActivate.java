package com.fc.brms.common.util.mail;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import com.fc.brms.common.domain.RecruitOffer;


public class MailActivate {
	
	public static void sendVisitorFansEmail(String fMail,String sendName,RecruitOffer recruitOffer){
		SimpleMail sm=new SimpleMail();
		sm.setSubject("尊敬的&nbsp;"+sendName+":");
		String str = "我是 hr "+recruitOffer.getContactUser()+"，代表我公司通知您，通过和您的交流沟通，我们认为您符合我公司"+recruitOffer.getPostName()+" 的任职条件，特此通知您于到公司办理入职手续。有任何问题，请及时联系我！";
		sm.setContent(str);
		SimpleMailSender sms=new SimpleMailSender("szfanglifang@163.com","123456abcd");
		try {
			sms.send(fMail, sm);
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
