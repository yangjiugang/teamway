package com.teamway.adstractfactory;

public class SendMailFactory implements Provider {

	public Sender produce() {
		return new Mailsender();
	}

}
