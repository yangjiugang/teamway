package com.shenzhen.teamway.websocket;

import java.io.IOException;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.fusesource.mqtt.client.Future;
import org.fusesource.mqtt.client.FutureConnection;
import org.fusesource.mqtt.client.MQTT;
import org.fusesource.mqtt.client.Message;
import org.fusesource.mqtt.client.QoS;
import org.fusesource.mqtt.client.Topic;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

/**
 * 创建websocket处理类
 * 
 * @author gaven
 *
 */
public class WebsocketEndPoint extends TextWebSocketHandler {

	private static Map<String, WebSocketSession> SESSION_MAP = new HashMap<String, WebSocketSession>();

	private Logger logger = LoggerFactory.getLogger(getClass());
	private static boolean flag = false;

	public static Topic[] topics = {

			new Topic("mqtt/aaa", QoS.EXACTLY_ONCE),

			new Topic("mqtt/bbb", QoS.AT_LEAST_ONCE),

			new Topic("mqtt/ccc", QoS.AT_MOST_ONCE) };

	@Override
	/**
	 * 建立连接后的操作
	 */
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.debug("[{} : {}] has be connected...", session.getUri(), session.getId());
		SESSION_MAP.put(session.getId(), session);
		// 用户第一次连接 启动一个线程接收MQTT 消息
		if (SESSION_MAP.size() == 1) {
			flag = true;
			new Thread(new Runnable() {
				@Override
				public void run() {
					try {
						MQTT mqtt = new MQTT();
						mqtt.setHost("tcp://127.0.0.1:61613");
						// 连接前清空会话信息
						mqtt.setCleanSession(true);
						// 设置重新连接的次数
						mqtt.setReconnectAttemptsMax(6);
						// 设置重连的间隔时间
						mqtt.setReconnectDelay(2000);
						// 设置心跳时间
						mqtt.setKeepAlive((short) 30);
						// 设置缓冲的大小
						mqtt.setSendBufferSize(2 * 1024 * 1024);
						// 设置客户端id
						mqtt.setClientId(UUID.randomUUID().toString());
						mqtt.setUserName("admin");
						mqtt.setPassword("password");
						// 获取mqtt的连接对象BlockingConnection

						final FutureConnection connection = mqtt.futureConnection();
						connection.connect();
						connection.subscribe(topics);
						while (flag) {
							Future<Message> futrueMessage = connection.receive();
							Message m = futrueMessage.await();
							System.out.println(
									"MQTTFutureClient.Receive Message " + "Topic Title :" + m.getTopic() + " context :"

											+ String.valueOf(m.getPayloadBuffer()));

							TextMessage returnMessage = new TextMessage(
									"MQTTFutureClient.Receive Message " + "Topic Title :" + m.getTopic() + " context :"
											+ String.valueOf(m.getPayloadBuffer()) + " received at server");
							for (Map.Entry<String, WebSocketSession> entry : SESSION_MAP.entrySet()) {
								if (entry.getValue().isOpen()) {
									entry.getValue().sendMessage(returnMessage);
								}
							}
						}
						logger.debug("-------------------the thread exit success------------------------------");
					} catch (URISyntaxException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}).start();

		}
		logger.debug("当前session个数:" + SESSION_MAP.size());
	}

	@Override
	/**
	 * 消息处理，在客户端通过Websocket API发送的消息会经过这里，然后进行相应的处理
	 */
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		super.handleTextMessage(session, message);

	}

	/**
	 * 连接关闭后的操作
	 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
		SESSION_MAP.remove(session.getId());
		logger.debug("删除后sessiong个数:\" + SESSION_MAP.size()");
		if (SESSION_MAP.size() == 0) {
			flag = false;
		}
	}

	@Override
	public boolean supportsPartialMessages() {
		return false;
	}

}