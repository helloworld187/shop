package com.zhangli.shop.service;

import java.util.Map;

import com.zhangli.shop.pojo.User;

public interface UserService {
	
	Map<String, Object> loginUser(User user);
	
	String registerUser(User user);
	
	String checkUsername(String username);
	
	int updateUserInfo(User user);
	
	User selectByUserid(Integer userid);
	
	int uploadAvator(User user);
	 

	
	

}
