package com.fc.flf.common.util;

import java.sql.Timestamp;

public class OrderSerialNumber {

	public static void main(String[] args) throws InterruptedException {
		System.out.println(getSerialNumber());
	}

	public static String getSerialNumber() {
		Timestamp curDate = DateTools.getCurrDateTime();
		String[] a = DateTools.dateToString(curDate).split("-");
		String str = "KF";
		a[0] = a[0].substring(2, a.length + 1);
		for (int i = 0; i < a.length; i++) {
			str += a[i];
		}
		return str;
	}

	// public static String getOrderNo() {
	// String strYear = getYear();
	// long No = 0;
	// SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	// String nowdate = sdf.format(new Date());
	// No = Long.parseLong(nowdate) * 10000;// 这里如果一天订单多的话可以用一万或更大
	// System.out.println("nowdate="+nowdate);
	// No += getNo();
	// return strYear + No;
	// }

	// public static int getNo() {// 返回当天的订单数+1
	// return 001;
	// }
	//
	// public static String getUserId() {
	// return "";
	// }

}
