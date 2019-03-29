package cn.edu.ask.utils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtil {

	public static String getTime() {
		
		Date date = new Date();
		
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		return df.format(date);
	}
}
