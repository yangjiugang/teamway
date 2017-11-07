package com.teamway.netty.httpdemo.test;

import javax.xml.bind.JAXBException;

import com.teamway.netty.common.util.JAXBUtils;
import com.teamway.netty.httpdemo.model.Order;

/**
 * ${DESCRIPTION}
 *
 * @author Ricky Fung
 * @create 2017-01-08 20:50
 */
public class TestOrder {

    private String encode2Xml(Order order) throws JAXBException {

        String xmlStr = JAXBUtils.marshal(order);

        System.out.println(xmlStr.toString());
        return xmlStr;
    }

    private Order decode2Order(String xmlBody) throws JAXBException {

        return JAXBUtils.unmarshal(xmlBody, Order.class);
    }

    public static void main(String[] args) throws JAXBException {
        TestOrder test = new TestOrder();
        Order order = OrderFactory.create(123);
        String body = test.encode2Xml(order);
        Order order2 = test.decode2Order(body);
        System.out.println(order2);

    }
}
