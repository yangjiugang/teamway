package com.teamway.factory;

public class FactoryTest {
	public static void main(String[] args) {
		SendFactory factory = new SendFactory();
		Sender send = factory.produce("sms");
		send.send();
	}
}
