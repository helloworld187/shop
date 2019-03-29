package com.zhangli.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhangli.shop.dao.OrderdetailsMapper;
import com.zhangli.shop.pojo.Orderdetails;
import com.zhangli.shop.service.OrderDetailsService;

@Service("/orderdetailsService")
public class OrderDetailsServiceImpl implements OrderDetailsService{
	
	@Autowired
	private OrderdetailsMapper orderdetailsMapper;

	@Override
	public int addOrderdetails(Orderdetails orderdetails) {
		int result = orderdetailsMapper.insertSelective(orderdetails);
		return result;
	}

	@Override
	public List<Integer> selectDetailsidByOrdersid(Integer ordersid) {
		List<Integer> Detailsid = orderdetailsMapper.selectDetailsidByOrdersid(ordersid);
		return Detailsid;
	}

	@Override
	public int selectGoodsidByDetailsid(Integer orderDetailesId) {
		int goodsid = orderdetailsMapper.selectGoodsidByPrimaryKey(orderDetailesId);
		return goodsid;
	}

	@Override
	public List<Orderdetails> findAllByUserid(Integer userid) {
		List<Orderdetails> list = orderdetailsMapper.selectAllByUserid(userid);
		return list;
	}

	

}
