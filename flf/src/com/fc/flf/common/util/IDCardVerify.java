package com.fc.flf.common.util;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class IDCardVerify {

	/** 省、市身份证号前两位 **/
	private static final Map<Integer, String> PROVINCE_AND_CITY = new HashMap<Integer, String>();
	/** 判断规范 **/
	private static final Pattern CARD_NO_REG = Pattern
			.compile("(^\\d{15}$)|(^\\d{17}(\\d|X)$)");
	/** 身份证15位时，次序为省（3位）市（3位）年（2位）月（2位）日（2位）校验位（3位），皆为数字 **/
	private final static Pattern FIFTEEN_BIRTHDAY = Pattern
			.compile("(\\d{6})(\\d{2})(\\d{2})(\\d{2})(\\d{3})");
	/** 身份证18位时，次序为省（3位）市（3位）年（4位）月（2位）日（2位）校验位（4位），校验位末尾可能为x **/
	private final static Pattern EIGHTEEN_BIRTHDAY = Pattern
			.compile("(\\d{6})(\\d{4})(\\d{2})(\\d{2})(\\d{3})([0-9]|X)");
	/** 身份证本体位每位权值 */
	private static final int[] powers = { 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9,
			10, 5, 8, 4, 2 };
	/** 校验位候选值 */
	private static final char[] parityBits = { '1', '0', 'X', '9', '8', '7',
			'6', '5', '4', '3', '2' };

	public static boolean isValid(String cardNo) {
		return isCardNo(cardNo) && checkProvince(cardNo)
				&& checkBirthday(cardNo) && checkParity(cardNo);
	}

	/**
	 * 功能描述：判断规范
	 * 
	 * @param cardNo
	 * @return
	 */
	private static boolean isCardNo(String cardNo) {
		return CARD_NO_REG.matcher(cardNo).matches();
	}

	/**
	 * 功能描述：判断省份
	 * 
	 * @param cardNo
	 * @return
	 */
	private static boolean checkProvince(String cardNo) {
		if (PROVINCE_AND_CITY.get(Integer.valueOf(cardNo.substring(0, 2))) != null) {
			return true;
		}
		return false;
	}

	/**
	 * 功能描述：判断生日是否正确
	 * 
	 * @param cardNo
	 * @return
	 */
	private static boolean checkBirthday(String cardNo) {

		String[] groups = splitToGroups(cardNo);
		//
		if (cardNo.length() == 15) {
			int year = 1900 + Integer.valueOf(groups[2]);
			int month = Integer.valueOf(groups[3]);
			int day = Integer.valueOf(groups[4]);
			Calendar calendar = Calendar.getInstance();
			calendar.set(year, month, day);
			return verifyBirthday(year, month, day, calendar);
		}
		//
		if (cardNo.length() == 18) {

			int year = Integer.valueOf(groups[2]);
			int month = Integer.valueOf(groups[3]);
			int day = Integer.valueOf(groups[4]);
			Calendar calendar = Calendar.getInstance();
			calendar.set(year, month - 1, day);
			return verifyBirthday(year, month, day, calendar);
		}

		return false;
	}

	/**
	 * 功能：检验出生日期
	 * 
	 * @param year
	 * @param month
	 * @param day
	 * @param calendar
	 * @return
	 */
	private static boolean verifyBirthday(int year, int month, int day,
			Calendar calendar) {

		if ((calendar.get(Calendar.YEAR) == year)
				&& ((calendar.get(Calendar.MONTH) + 1) == month)
				&& (calendar.get(Calendar.DAY_OF_MONTH) == day)) {
			int currYear = Calendar.getInstance().get(Calendar.YEAR);
			int age = currYear - year;
			if ((age >= 3) && (age <= 100)) {
				return true;
			}
		}
		return false;
	}

	/**
	 * 功能：判断身份证号码的校验位是否正确
	 * 
	 * @param cardNo
	 * @return
	 */
	private static boolean checkParity(String cardNo) {
		//
		if (cardNo.length() == 15) {
			cardNo = convert15To18Bit(cardNo);
		}
		//
		int digitalCode = 0;
		if (cardNo.length() == 18) {
			for (int i = 0; i < 17; i++) {
				digitalCode += Integer.valueOf(cardNo.substring(i, i + 1))
						* powers[i];
			}
			//
			if (cardNo.substring(17, 18).equals(
					String.valueOf(parityBits[digitalCode % 11]))) {
				return true;
			}
		}
		return false;
	}

	/**
	 * 功能：将15身份证号码转换成18位
	 * 
	 * @param cardNo
	 * @return
	 */
	private static String convert15To18Bit(String cardNo) {

		cardNo = cardNo.substring(0, 6) + "19"
				+ cardNo.substring(6, cardNo.length());
		//
		int digitalCode = 0;
		for (int i = 0; i < 17; i++) {
			digitalCode += Integer.valueOf(cardNo.substring(i, i + 1))
					* powers[i];
		}
		//
		cardNo += parityBits[digitalCode % 11];
		return cardNo;
	}

	/**
	 * 功能描述：将身份证号按照正则表达式分组。
	 * 
	 * @param cardNo
	 * @return
	 */
	private static String[] splitToGroups(String cardNo) {

		List<String> groups = new ArrayList<String>();
		//
		if (cardNo.length() == 15) {
			Matcher matcher = FIFTEEN_BIRTHDAY.matcher(cardNo);
			boolean matchFound = matcher.find();
			if (matchFound) {
				for (int i = 0; i <= matcher.groupCount(); i++) {
					groups.add(matcher.group(i));
				}
			}
		}
		//
		if (cardNo.length() == 18) {
			Matcher matcher = EIGHTEEN_BIRTHDAY.matcher(cardNo);
			boolean matchFound = matcher.find();
			if (matchFound) {
				for (int i = 0; i <= matcher.groupCount(); i++) {
					groups.add(matcher.group(i));
				}
			}
		}

		return groups.toArray(new String[0]);
	}

	static {
		// 11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",
		PROVINCE_AND_CITY.put(11, "北京");
		PROVINCE_AND_CITY.put(12, "天津");
		PROVINCE_AND_CITY.put(13, "河北");
		PROVINCE_AND_CITY.put(14, "山西");
		PROVINCE_AND_CITY.put(15, "内蒙古");
		PROVINCE_AND_CITY.put(21, "辽宁");
		PROVINCE_AND_CITY.put(22, "吉林");
		PROVINCE_AND_CITY.put(23, "黑龙江");
		PROVINCE_AND_CITY.put(31, "上海");
		PROVINCE_AND_CITY.put(32, "江苏");
		// 33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",
		PROVINCE_AND_CITY.put(33, "浙江");
		PROVINCE_AND_CITY.put(34, "安徽");
		PROVINCE_AND_CITY.put(35, "福建");
		PROVINCE_AND_CITY.put(36, "江西");
		PROVINCE_AND_CITY.put(37, "山东");
		PROVINCE_AND_CITY.put(41, "河南");
		PROVINCE_AND_CITY.put(42, "湖北");
		PROVINCE_AND_CITY.put(43, "湖南");
		PROVINCE_AND_CITY.put(44, "广东");
		PROVINCE_AND_CITY.put(45, "广西");
		// 46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",
		PROVINCE_AND_CITY.put(46, "海南");
		PROVINCE_AND_CITY.put(50, "重庆");
		PROVINCE_AND_CITY.put(51, "四川");
		PROVINCE_AND_CITY.put(52, "贵州");
		PROVINCE_AND_CITY.put(53, "云南");
		PROVINCE_AND_CITY.put(54, "西藏");
		PROVINCE_AND_CITY.put(61, "陕西");
		PROVINCE_AND_CITY.put(62, "甘肃");
		PROVINCE_AND_CITY.put(63, "青海");
		PROVINCE_AND_CITY.put(64, "宁夏");
		// 65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"
		PROVINCE_AND_CITY.put(65, "新疆");
		PROVINCE_AND_CITY.put(71, "台湾");
		PROVINCE_AND_CITY.put(81, "香港");
		PROVINCE_AND_CITY.put(82, "澳门");
		PROVINCE_AND_CITY.put(91, "国外");
	}
}