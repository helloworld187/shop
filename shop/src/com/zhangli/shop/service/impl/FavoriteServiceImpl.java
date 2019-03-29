package com.zhangli.shop.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhangli.shop.dao.FavoriteMapper;
import com.zhangli.shop.pojo.Favorite;
import com.zhangli.shop.service.FavoriteService;
import com.zhangli.shop.utils.UUIDUtils;



@Service("favoriteService")
public class FavoriteServiceImpl implements FavoriteService{
	
	@Autowired
	private FavoriteMapper favoriteMapper;

	@Override
	public int addFavorite(Favorite favorite) {
		favorite.setFavoriteid(UUIDUtils.getNumUUID());
		int result = favoriteMapper.insert(favorite);
		return result;
	}

	@Override
	public Favorite findGoodsByGoodsid(Integer goodsid) {
		Favorite favorite = favoriteMapper.selectByGoodsid(goodsid);
		return favorite;
	}

	@Override
	public List<Integer> findGoodsByUserid(HashMap map) {
		List<Integer> list = favoriteMapper.selectGoodsidByUserid(map);
		return list;
	}

	@Override
	public int slectAllCountForFavorite(Integer userid) {
		int total = favoriteMapper.selectAllCountForFavorite(userid);
		return total;
	}

	@Override
	public List<Integer> findGidByUserid(Integer userid) {
		List<Integer> list = favoriteMapper.selectGidByUserid(userid);
		return list;
	}

	@Override
	public Favorite selectFavorite(Favorite favorite) {
		Favorite _favorite = favoriteMapper.selectFavorite(favorite);
		return _favorite;
	}

}
