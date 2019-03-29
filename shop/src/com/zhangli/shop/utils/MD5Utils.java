package com.zhangli.shop.utils;

import org.apache.commons.codec.digest.DigestUtils;

public class MD5Utils {
	public static String toMd5(String password) {
		String psw ="";
		if(password != ""){
			psw = DigestUtils.md5Hex(password);
			
		}else{
			psw ="";
		}
		return psw;
	}

}
