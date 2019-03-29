package com.zhangli.shop.service;

import java.util.List;

import com.zhangli.shop.pojo.Orderdetails;

public interface OrderDetailsService {
	
	int addOrderdetails(Orderdetails orderdetails);
	
	List<Integer> selectDetailsidByOrdersid(Integer ordersid);
	
	int selectGoodsidByDetailsid(Integer orderDetailesId);
	
	 List<Orderdetails> findAllByUserid(Integer userid);

}
