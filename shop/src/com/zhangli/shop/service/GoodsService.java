package com.zhangli.shop.service;

import java.util.HashMap;
import java.util.List;

import com.zhangli.shop.pojo.Goods;
import com.zhangli.shop.pojo.Page;

public interface GoodsService {
	
	Goods findGoodsById(Integer goodsid);
	
	Goods selectGoodsById(HashMap map);

	List<Goods> selectGoodsByCategoryid(int categoryid);
	
	List<Goods> selectAllForPage(HashMap map);
	
	int selectAllCount(int categoryid);
	
	List<Goods> selectAllForFavorite(HashMap map);
	
	int uploadGoods(Goods goods);
	
	int uploadPicture(Goods goods);
}
