package com.teamway.factory2;

public class FactoryTest {
	public static void main(String[] args) {
		SendFactory factory = new SendFactory();
		Sender sender = factory.mailSend();
		sender.send();
	}
}
