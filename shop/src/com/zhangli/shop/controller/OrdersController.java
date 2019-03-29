package com.zhangli.shop.controller;

import java.util.ArrayList;
import java.util.Date;
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
import com.zhangli.shop.pojo.Orderdetails;
import com.zhangli.shop.pojo.Orders;
import com.zhangli.shop.pojo.User;
import com.zhangli.shop.service.GoodsService;
import com.zhangli.shop.service.OrderDetailsService;
import com.zhangli.shop.service.OrdersService;
import com.zhangli.shop.service.ShopcartService;
import com.zhangli.shop.service.UserService;
import com.zhangli.shop.utils.UUIDUtils;

@Controller("/orderController")
@RequestMapping("/order")
public class OrdersController {
	
	@Autowired
	private OrdersService ordersService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private OrderDetailsService orderDetailsService;
	
	@Autowired
	private ShopcartService shopcartService;
	
	//生成订单表和订单详情表
	@RequestMapping("addOrder")
	@ResponseBody
	public List<String> addOrder(Orders orders,Orderdetails orderdetails,HttpSession session,@Param("addressid") int addressid,@Param("totalPrice") double totalPrice,Model model){
		User _user = (User) session.getAttribute("user");
		int userid = _user.getUserid();
		orders.setUserid(userid);
		orders.setOrdersid(UUIDUtils.getNumUUID());
		orders.setOrdertime(new Date());
		orders.setTotalprice(totalPrice);
		orders.setAddressid(addressid);
		System.out.println(orders);
		int result = ordersService.addOrder(orders);
		

		List<Integer> list = shopcartService.selectGoodsidByUserid(userid);
		List<Goods> goodslist = new ArrayList<>();
		int resul = 0;
		for(int i=0;i<list.size();i++){
			orderdetails.setGoodsid(list.get(i));
			orderdetails.setOrderdetailesid(UUIDUtils.getNumUUID());
			orderdetails.setUserid(userid);
			orderdetails.setOrdersid(orders.getOrdersid());
			orderdetails.setCounts(1);
			resul = orderDetailsService.addOrderdetails(orderdetails);
		}
		
		String message = "";
		List<String> lists = new ArrayList<>();
		if(resul>0){
			message = "订单提交成功！";
			System.out.println("总计价格为："+totalPrice);
			lists.add(0, message);
			lists.add(1, String.valueOf(totalPrice));
			lists.add(2, String.valueOf(orders.getOrdersid()));
			System.out.println("ordersid为："+orders.getOrdersid());
		}else{
			message = "订单提交失败！";
			lists.add(0, message);
		}
		
		return lists;
	}
	
	//查询该用户的所有订单
	@RequestMapping("findAllOrders")
	public String findAllByuserid(HttpSession session,Model model){
		User user = (User) session.getAttribute("user");
		Integer userid = user.getUserid();
		List<Orders> orders = ordersService.findAllByUserid(userid);
		model.addAttribute("orders", orders);
	
		return "../myorders";
		
	}

}
