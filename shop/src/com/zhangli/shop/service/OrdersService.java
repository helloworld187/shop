package com.zhangli.shop.service;

import java.util.List;

import com.zhangli.shop.pojo.Orders;

public interface OrdersService {
	
	int addOrder(Orders oreders);
	
	List<Orders> findAllByUserid(Integer userid);
}
