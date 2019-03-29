package com.zhangli.shop.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.sun.istack.internal.logging.Logger;
import com.zhangli.shop.pojo.Goods;
import com.zhangli.shop.pojo.Page;
import com.zhangli.shop.pojo.Picture;
import com.zhangli.shop.pojo.User;
import com.zhangli.shop.service.GoodsService;
import com.zhangli.shop.service.PictureService;
import com.zhangli.shop.utils.UUIDUtils;



@Controller("goodsController")
@RequestMapping("/goods")
public class GoodsController {
	Logger logger = Logger.getLogger(GoodsController.class);
	
	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private PictureService pictureService;
	
	
	//通过商品id查找商品
	@RequestMapping("/find")
	public String selectGoods(@Param("goodsid") int goodsid,Model model) {
		System.out.println("goodsid是："+goodsid);
		Goods goods = goodsService.findGoodsById(goodsid);
		model.addAttribute("GoodsList", goods);
		List<Picture> list = (List<Picture>) pictureService.findPicturesByGoodsid(goodsid);
		model.addAttribute("Pictures", list);
		System.out.println("图片地址："+list.get(0).getPath()+"---"+list.get(1).getPath());
		return "../goods";
		
	}
	
	//通过分类查找商品
	@RequestMapping("/findbycategoryid")
	public String findGoodsByCategory(@Param("categoryid") int categoryid, Model model,Page page) {
		System.out.println("categoryid是："+categoryid);
		int total = goodsService.selectAllCount(categoryid);
		System.out.println("查找出的总条数："+total);
		HashMap <String,Object> map = new HashMap<String,Object>();
		map.put("categoryid", categoryid);
		map.put("page", page);
		List<Goods> pagelist = goodsService.selectAllForPage(map);
		System.out.println("当前页的商品："+pagelist.toString());
		System.out.println("当前页的商品数量："+pagelist.size());
		page.setTotalMessage(total);
		model.addAttribute("Page", page);
		model.addAttribute("Goods", pagelist);
		return "../list";
	}
	
	@RequestMapping("touploadgoods")
	public String touploadgoods(){
		return "../uploadgoods";
		
	}
	
	//上传商品
	@RequestMapping("/uploadgoods")
	public String uploadgoods(Goods goods,HttpSession session){
		User user = (User) session.getAttribute("user");
		goods.setUserid(user.getUserid());
		goods.setGoodsid(UUIDUtils.getNumUUID());
		System.out.println(goods.toString());
		int result = goodsService.uploadGoods(goods);
		session.setAttribute("Goods", goods);
		return "../uploadpicture";
	}
	
	//上传商品图片
	@RequestMapping("uploadpicture")
	public String uploadpicture(HttpServletRequest req, HttpSession session,@Param("goodsid") int goodsid,Model model) {
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
            
            Goods goods = (Goods) session.getAttribute("Goods");
            System.out.println(goods);
            goods.setPhoto(fileSrc);
            goodsService.uploadPicture(goods);
            model.addAttribute("message","上传成功！");
            
		}
		return "../morepictures";
	}

}
