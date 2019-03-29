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

import com.zhangli.shop.pojo.Goods;
import com.zhangli.shop.pojo.Orderdetails;
import com.zhangli.shop.pojo.Orders;
import com.zhangli.shop.pojo.User;
import com.zhangli.shop.service.GoodsService;
import com.zhangli.shop.service.OrderDetailsService;

@Controller("/orderDetailsService")
@RequestMapping("/orderDetails")
public class OrderDetailsController {
	
	@Autowired
	private OrderDetailsService orderDetailsService;
	
	@Autowired
	private GoodsService goodsService;
	
	//查看订单详情
	@RequestMapping("/findDtailsByOrdersid")
	public String findGoodsByUserid(HttpSession session,Model model,@Param("ordersid") String ordersid){
		User user = (User) session.getAttribute("user");
		int userid = user.getUserid();
		List<Integer> Detailsidlist = orderDetailsService.selectDetailsidByOrdersid(Integer.parseInt(ordersid));
		List<Goods> goodslist = new ArrayList<>();
		System.out.println("详情id:"+Detailsidlist.get(0));
		for(int i=0;i<Detailsidlist.size();i++){
			int goodsid = orderDetailsService.selectGoodsidByDetailsid(Detailsidlist.get(i));
			Goods goods = goodsService.findGoodsById(goodsid);
			goodslist.add(i, goods);
			System.out.println(goods.toString());
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("Ordersid", ordersid);
		map.put("Goodslist", goodslist);
		model.addAttribute("map",map);
		return "../orderlist";
		
	}
	
	//查询该用户的所有订单
		@RequestMapping("findAllOrderdetails")
		public String findAllByuserid(HttpSession session,Model model){
			User user = (User) session.getAttribute("user");
			Integer userid = user.getUserid();
			List<Orderdetails> ordersdetails = orderDetailsService.findAllByUserid(userid);
			model.addAttribute("ordersdetails", ordersdetails);
		
			return "../myorders.jsp";

	}
}
