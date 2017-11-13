package com.teamway.factory2;

public class SendFactory {
	public Sender mailSend() {
		return new MailSender();
	}
	public Sender smsSend() {
		return new SmsSender();
	}
}
