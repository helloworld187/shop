package com.zhangli.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhangli.shop.dao.ShopcartMapper;
import com.zhangli.shop.pojo.Shopcart;
import com.zhangli.shop.service.ShopcartService;

@Service("shopcartService")
public class ShopcartServiceImpl implements ShopcartService {
	
	@Autowired
	private ShopcartMapper shopcartMapper;
	

	@Override
	public int addToShopCart(Shopcart shopcart) {
		int result = shopcartMapper.insert(shopcart);
		return result;
	}

	@Override
	public List<Integer> selectGoodsidByUserid(Integer userid) {
		List<Integer> list = shopcartMapper.selectByUserid(userid);
		return list;
	}

	@Override
	public int deleteGoodsFromShopCart(int goodsid) {
		int result = shopcartMapper.deleteByGoodsid(goodsid);
		return result;
	}

	@Override
	public Shopcart findGoodsByGoodsid(Integer goodsid) {
		Shopcart shopcart = shopcartMapper.selectByGoodsid(goodsid);
		return shopcart;
	}

	@Override
	public Shopcart findShopcart(Shopcart shopcart) {
		Shopcart _shopcart = shopcartMapper.selectBySelective(shopcart);
		return _shopcart;
	}

}
