package com.zhangli.shop.service;

import java.util.List;

import com.zhangli.shop.pojo.Shopcart;

public interface ShopcartService {
	
	int addToShopCart(Shopcart shopcart);
	
	List<Integer> selectGoodsidByUserid(Integer userid);
	
	Shopcart findGoodsByGoodsid(Integer goodsid);
	
	int deleteGoodsFromShopCart(int goodsid);
	
	Shopcart findShopcart(Shopcart shopcart);

}
