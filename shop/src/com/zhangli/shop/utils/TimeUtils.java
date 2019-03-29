package com.zhangli.shop.utils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtils {
public static String getTime() {
		
		Date date = new Date();
		
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		return df.format(date);
	}
public static String getTimeByYMD(Date date) {

	DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

	return df.format(date);
}

}
