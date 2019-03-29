package com.zhangli.shop.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhangli.shop.dao.GoodsMapper;
import com.zhangli.shop.pojo.Goods;
import com.zhangli.shop.pojo.Page;
import com.zhangli.shop.service.GoodsService;
import com.zhangli.shop.utils.UUIDUtils;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService{
	
	@Autowired
	private GoodsMapper goodsMapper;

	@Override
	public Goods findGoodsById(Integer goodsid) {
		Goods goods = goodsMapper.selectByPrimaryKey(goodsid);
		return goods;
	} 
	
	@Override
	public List<Goods> selectGoodsByCategoryid(int categoryid) {
		List<Goods> list = (List<Goods>) goodsMapper.selectByCategoryid(categoryid);
		return list;
	}

	
	@Override
	public int selectAllCount(int categoryid) {
		int total = goodsMapper.selectAllCount(categoryid);
		return total;
	}

	@Override
	public int uploadGoods(Goods goods) {
		int result = goodsMapper.insertSelective(goods);
		return result;
	}

	@Override
	public int uploadPicture(Goods goods) {
		int result = goodsMapper.updateByPrimaryKey(goods);
		return result;
	}

	@Override
	public List<Goods> selectAllForPage(HashMap map) {
		List<Goods> pagelist = goodsMapper.selectAllForPage(map);
		return pagelist;
	}

	

	@Override
	public List<Goods> selectAllForFavorite(HashMap map) {
		List<Goods> pagelist = goodsMapper.selectAllForFavoritePage(map);
		return pagelist;
	}

	@Override
	public Goods selectGoodsById(HashMap map) {
		Goods goods = goodsMapper.selectGoodsForPage(map);
		return goods;
	}

	


	

	

	

	
	

}
