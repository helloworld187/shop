package com.zhangli.shop.utils;

import java.util.UUID;

public class UUIDUtils {
	public static String getUUID() {
		UUID uuid = UUID.randomUUID();
		return uuid.toString().replace("-", "");
	}
	public static int getNumUUID() {
		UUID uuid = UUID.randomUUID();
		int num = uuid.toString().replace("-", "").hashCode();
		return num > 0 ? num : -num;
	}
}


