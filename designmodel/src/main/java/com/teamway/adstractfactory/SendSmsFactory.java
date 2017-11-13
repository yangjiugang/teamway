package com.teamway.adstractfactory;

public class SendSmsFactory implements Provider {
	public Sender produce() {
		return new SmsSender();
	}
}
