package com.zhangli.shop.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhangli.shop.pojo.Goods;
import com.zhangli.shop.pojo.Shopcart;
import com.zhangli.shop.pojo.User;
import com.zhangli.shop.service.GoodsService;
import com.zhangli.shop.service.ShopcartService;
import com.zhangli.shop.utils.UUIDUtils;

@Controller("shopcartController")
@RequestMapping("/shopcart")
public class ShopcartController {
	
	@Autowired
	private ShopcartService shopcartService;
	
	@Autowired
	private GoodsService goodsService;
	
	
	//添加购物车
	@RequestMapping("/addShopcart")
	@ResponseBody
	public String addShopcart(Shopcart shopcart,HttpSession session){	
		String message = "";
		Shopcart _shopcart = shopcartService.findShopcart(shopcart);
		if(_shopcart != null) {
			message = "您已添加该商品";
		}
		else {
			shopcart.setShopcartid(UUIDUtils.getNumUUID());
			int result = shopcartService.addToShopCart(shopcart);
			if(result>0){
				message = "添加成功！";
			}else{
				message = "添加失败！";		
			}
		}
		return message;

		
	}
	
	//查看该用户下购物车的商品
	@RequestMapping("/findGoodsid")
	public String findGoodsidByUserid(HttpSession session,Model model){
		User user = (User) session.getAttribute("user");
		int userid = user.getUserid();
		System.out.println("购物车的userid为："+userid);
		
		List<Integer> list = shopcartService.selectGoodsidByUserid(userid);
		List<Goods> goodslist = new ArrayList<>();
		for(int i=0;i<list.size();i++){
			Goods goods = goodsService.findGoodsById(list.get(i));
			System.out.println("购物车的商品有："+goods);
			goodslist.add(i, goods);
		}
		int count = goodslist.size();
		model.addAttribute("GoodsList", goodslist);
		model.addAttribute("Count", count);
		System.out.println("购物车的商品有几个："+goodslist.size());
		
		
		return "../shoppinglist";
		
		
		
	}
	
	//删除购物车中的商品
	@RequestMapping("/deleteGoods")
	@ResponseBody
	public String deleteGoodsFromShopcart(@Param("goodsid") int goodsid){
		System.out.println("要删除的的商品id为:"+goodsid);
		int result = shopcartService.deleteGoodsFromShopCart(goodsid);
		String message = "";
		if(result>0){
			message = "删除成功！";
		}else{
			message = "删除失败！";
		}
		
		return message;
		
	}

}
