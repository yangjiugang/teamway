package com.teamway.factory2;

import com.teamway.factory2.Sender;

public class SmsSender implements Sender {

	public void send() {
		System.out.println("this is sms send!");
	}

}
