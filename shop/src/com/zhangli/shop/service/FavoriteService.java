package com.zhangli.shop.service;

import java.util.HashMap;
import java.util.List;

import com.zhangli.shop.pojo.Favorite;

public interface FavoriteService {
	
	int addFavorite(Favorite favorite);
	
	Favorite findGoodsByGoodsid(Integer goodsid);
	
	List<Integer> findGoodsByUserid(HashMap map);
	
	List<Integer> findGidByUserid(Integer userid);
	
	int slectAllCountForFavorite(Integer userid);
	
	Favorite selectFavorite(Favorite favorite);
}
