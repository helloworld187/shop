package com.zhangli.shop.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhangli.shop.dao.UserMapper;
import com.zhangli.shop.pojo.User;
import com.zhangli.shop.service.UserService;
import com.zhangli.shop.utils.MD5Utils;
import com.zhangli.shop.utils.TimeUtils;
import com.zhangli.shop.utils.UUIDUtils;

@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public String registerUser(User user) {
		String message = "";
		if(!"".equals(user.getUsername()) && !"".equals(user.getPassword())){
			user.setUserid(UUIDUtils.getNumUUID());
			user.setUsername(user.getUsername().trim());
			user.setPassword(MD5Utils.toMd5(user.getPassword()));
			user.setCreatetime(new Date());
			user.setMoney(1000.00);
			int result = userMapper.insert(user);
			if(result > 0){
				message = "注册成功！";
			}else{
				message = "注册失败！";
			}
			
		}
		return message;
	}

	
	@Override
	public Map<String, Object> loginUser(User user) {
		Map<String, Object> map = new HashMap<>();
		String message = "";
		user.setUsername(user.getUsername().trim());
		user.setPassword(MD5Utils.toMd5(user.getPassword()));
		User _user = userMapper.selectByUsernameAndPassword(user);
		if(null !=_user){
			map.put("message", "登录成功！");
			map.put("user", _user);
		}else{
			map.put("message", "用户名或密码错误！");
		}
		return map;
		
	}

	
	@Override
	public String checkUsername(String username) {
		String message = "";
		User _user = userMapper.selectByUsername(username);
		if(_user!=null){
			message =  "该用户名已存在";
		}else{
			message = "该用户名可以用";
		}
		return message;
	}


	@Override
	public int updateUserInfo(User user) {
		int result = userMapper.updateByPrimaryKeySelective(user);
		return result;
	}


	@Override
	public User selectByUserid(Integer userid) {
		User user = userMapper.selectByPrimaryKey(userid);
		return user;
	}


	@Override
	public int uploadAvator(User user) {
		int result = userMapper.updateByPrimaryKeySelective(user);
		return result;
	}



	
}
