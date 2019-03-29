package com.zhangli.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.zhangli.shop.dao.OrdersMapper;
import com.zhangli.shop.pojo.Orders;
import com.zhangli.shop.service.OrdersService;


@Service("ordersService")
public class OrdersServiceImpl implements OrdersService{
	
	@Autowired
	private OrdersMapper ordersMapper;

	@Override
	public int addOrder(Orders orders) {
		int result = ordersMapper.insert(orders);
		return result;
	}

	@Override
	public List<Orders> findAllByUserid(Integer userid) {
		List<Orders> orders = ordersMapper.selectAllByUserid(userid);
		return orders;
	}
}
