package com.zhangli.shop.controller;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.zhangli.shop.pojo.Goods;
import com.zhangli.shop.pojo.Picture;
import com.zhangli.shop.pojo.User;
import com.zhangli.shop.service.PictureService;
import com.zhangli.shop.utils.UUIDUtils;

@Controller("pictureController")
@RequestMapping("/picture")
public class PictureController {
	
	@Autowired
	private PictureService pictureService;
	
	//上传更多商品图片
	@RequestMapping("/uploadpictures")
	public String uploadPictureByGoodsid(HttpServletRequest req, HttpSession session,@Param("goodsid") int goodsid,Model model){
		String randomName = UUIDUtils.getUUID();
		String fileName;
		String fileType;
		// 设置文件存储路径
		String filePath = System.getProperty("catalina.base") + File.separatorChar + "webapps" + File.separatorChar + "shop" + File.separatorChar + "uploadFile" + File.separatorChar + "image" + File.separatorChar;
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
			fileSrc = "uploadFile" + File.separatorChar + "image" + File.separatorChar + randomName + fileType;
			fileS = "E:\\JavaeeWorkSpace\\shop\\WebContent\\uploadFile\\image\\"+ randomName + fileType;
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
            Picture picture = new Picture();
            picture.setGoodsid(goodsid);
            picture.setUserid(user.getUserid());
            picture.setPath(fileSrc);
            pictureService.uploadPicture(picture);
            model.addAttribute("message","上传成功！");
		}
		return "../morepictures";
		
	}

}
