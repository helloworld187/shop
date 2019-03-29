package com.zhangli.shop.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhangli.shop.pojo.Favorite;
import com.zhangli.shop.pojo.Goods;
import com.zhangli.shop.pojo.Page;
import com.zhangli.shop.pojo.User;
import com.zhangli.shop.service.FavoriteService;
import com.zhangli.shop.service.GoodsService;
import com.zhangli.shop.utils.UUIDUtils;

@Controller("/favoriteController")
@RequestMapping("favorite")
public class FavoriteController {

	@Autowired
	private FavoriteService favoriteService;
	
	@Autowired
	private GoodsService goodsService;
	
	
	//收藏商品
	@RequestMapping("addfavorite")
	@ResponseBody
	public String addFavorite(Favorite favorite,HttpSession session){
		String message = "";
		Favorite _favorite = favoriteService.selectFavorite(favorite);
		if(_favorite != null){
			message = "您已收藏该商品！";
		}
		else {
			favorite.setFavoriteid(UUIDUtils.getNumUUID());
			int result = favoriteService.addFavorite(favorite);	
			if(result>0){
				message = "收藏成功！";		
			}else{
				message = "收藏失败！";
			}
		}
		
		return message;
		
	}
	
	//查找收藏的商品
	@RequestMapping("/findFavoriteGoods")
	public String findGoodsByUserid(HttpSession session,Model model,Page page){
		User user = (User) session.getAttribute("user");
		int userid = user.getUserid();
		System.out.println("收藏的userid为："+userid);
		
		HashMap <String,Object> map = new HashMap<String,Object>();
		map.put("userid", userid);
		map.put("page", page);
		int count = favoriteService.slectAllCountForFavorite(userid);
		//通过找到的商品id进行分页
		List<Integer> goodsid = favoriteService.findGoodsByUserid(map);
		//总条数
		page.setTotalMessage(count);
		//页面需要的信息
		List<Goods> goodslists = new ArrayList<>();
		for(int i=0;i<goodsid.size();i++){
			Goods good = goodsService.findGoodsById(goodsid.get(i));
			goodslists.add(i, good);
		}	
		
		model.addAttribute("Page", page);
		model.addAttribute("GoodsList", goodslists);
		System.out.println("收藏的商品个数"+count);
		
//		List<Goods> goodslist = new ArrayList<>();
//		List<Integer> goodsid = favoriteService.findGoodsByUserid(userid);
//		for(int i=0;i<goodsid.size();i++){
//			Goods goods = goodsService.findGoodsById(goodsid.get(i));
//			goodslist.add(i, goods);
//			System.out.println("收藏的商品有"+goods);
//		}
//		System.out.println("收藏的商品个数"+goodslist.size());
//		model.addAttribute("GoodsList", goodslist);
		return "../favorite";
		
	}
}
