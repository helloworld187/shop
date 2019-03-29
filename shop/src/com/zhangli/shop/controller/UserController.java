package com.zhangli.shop.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.zhangli.shop.pojo.Goods;
import com.zhangli.shop.pojo.User;
import com.zhangli.shop.service.UserService;
import com.zhangli.shop.utils.MD5Utils;
import com.zhangli.shop.utils.UUIDUtils;

@Controller("userController")
@RequestMapping("/user")
public class UserController {
	Logger logger = Logger.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	
	//用户注册
	@RequestMapping("/register")
	@ResponseBody
	public String register(User user,Model model){
		String message = userService.registerUser(user);
		return message;
		
		
	}
	
	//用户登录
	@RequestMapping("/login")
	@ResponseBody
	public String login(User user,Model model,HttpSession session){
		Map<String, Object> map = userService.loginUser(user);
		User _user = (User) map.get("user");
		session.setAttribute("user", _user);
		String message = map.get("message").toString();
		return message;
		
		
	}
	
	//检验用户名
	@RequestMapping("/checkusername")
	@ResponseBody
	public String checkusername(String username,Model model){
		String message  = userService.checkUsername(username);
		return message;	
	}
	
	
	//修改用户余额
	@RequestMapping("/updateMoney")
	@ResponseBody
	public String updateMoney(@Param("totalPrice") double totalPrice,HttpSession session){
		User _user = (User) session.getAttribute("user");
		int userid = _user.getUserid();
		double money = _user.getMoney()-totalPrice;
		System.out.println("余额还剩："+money);
		String message = "";
		if(money < 0){
			message = "您的余额已不足！";	
		}else{
			_user.setMoney(money);
			int res = userService.updateUserInfo(_user);
			if(res > 0){
				System.out.println("付款成功");
				message = "付款成功！";
			}else{
				message = "付款失败！";
			}
			
		}
		return message;
		
	}
	
	//修改用户信息
	@RequestMapping("/updateUserinfo")
	@ResponseBody
	public String updateByUserid(User user){
		user.setPassword(MD5Utils.toMd5(user.getPassword()));
		int result = userService.updateUserInfo(user);
		String message = "";
		if(result>0){
			message = "修改成功！";
		}else{
			message = "修改失败！";
		}
		return message;
		
	}
	
	//通过用户id查找用户信息
	@RequestMapping("/findUser")
	public String findUserByid(HttpSession session,Model model){
		User user = (User) session.getAttribute("user");
		Integer userid = user.getUserid();
		User _user = userService.selectByUserid(userid);
		model.addAttribute("User", _user);
		System.out.println("user信息："+ _user);
		return "../member_info";
		
	}
	
	//上传用户头像
	@RequestMapping("/uploadAvator")
	public String uploadpicture(HttpServletRequest req,HttpSession session,Model model) {
		String message = "";   
		String randomName = UUIDUtils.getUUID();
		String fileName;
		String fileType;
		// 设置文件存储路径
		String filePath = System.getProperty("catalina.base") + File.separatorChar + "webapps" + File.separatorChar + "shop" + File.separatorChar + "uploadFile" + File.separatorChar + "images" + File.separatorChar;
		String fileSrc;
		String fileS;
		// 转换request对象，解析文件
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) req;
		// 获取文件集合
		Map<String, MultipartFile> map = multipartRequest.getFileMap();
		// 循环遍历，取出单个文件
		for (Map.Entry<String, MultipartFile> entry : map.entrySet()) {
			// 获取单个文件
			MultipartFile mf = entry.getValue();
			// 获取原文件名
			fileName = mf.getOriginalFilename();
			// 获取文件类型
			fileType = fileName.substring(fileName.indexOf("."));
			filePath = filePath + randomName + fileType;
			fileSrc = "uploadFile" + File.separatorChar + "images" + File.separatorChar + randomName + fileType;
			fileS = "E:\\JavaeeWorkSpace\\shop\\WebContent\\uploadFile\\images\\"+ randomName + fileType;
			// 创建文件实例
            File uploadFile = new File(filePath);
            File uFile = new File(fileS);
            // 判断文件已经存在，则删除该文件
            if (uploadFile.exists()) {
                uploadFile.delete();
            }
            try {
            	// 利用spring中的FileCopyUtils.copy()将文件复制
				FileCopyUtils.copy(mf.getBytes(), uploadFile);
				FileCopyUtils.copy(mf.getBytes(), uFile);
			} catch (IOException e) {
				e.printStackTrace();
				System.out.println("上传出错！");
			}
            
            User user = (User) session.getAttribute("user");
            Integer userid = user.getUserid();
            System.out.println("获取到的用户id："+userid);
            user.setAvatar(fileSrc); 
            
            int result = userService.uploadAvator(user);
            if(result>0){
            	message = "上传成功！"; 
            	model.addAttribute("message", message);
            	model.addAttribute("path", user.getAvatar());
            }else{
            	message = "上传失败！";  
            	model.addAttribute("message", message);
            } 
		}
		return "../uploadAvator";
	}	
}



