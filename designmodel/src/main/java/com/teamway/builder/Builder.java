package com.teamway.builder;

import java.util.ArrayList;
import java.util.List;

import com.teamway.adstractfactory.Mailsender;
import com.teamway.adstractfactory.Sender;
import com.teamway.adstractfactory.SmsSender;

public class Builder {
	private List<Sender> list = new ArrayList<Sender>();

	public void produceMailSender(int count) {
		for (int i = 0; i < count; i++) {
			list.add(new Mailsender());
		}
	}

	public void produceSmsSender(int count) {
		for (int i = 0; i < count; i++) {
			list.add(new SmsSender());
		}
	}
}
