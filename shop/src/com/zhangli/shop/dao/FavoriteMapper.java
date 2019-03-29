package com.zhangli.shop.dao;

import java.util.HashMap;
import java.util.List;

import com.zhangli.shop.pojo.Favorite;

public interface FavoriteMapper {
    int deleteByPrimaryKey(Integer favoriteid);

    int insert(Favorite record);

    int insertSelective(Favorite record);

    Favorite selectByPrimaryKey(Integer favoriteid);
    
    Favorite selectByGoodsid(Integer favoriteid);
    
    List<Integer> selectGoodsidByUserid(HashMap map);
    
    List<Integer> selectGidByUserid(Integer userid);
    
    Favorite selectFavorite(Favorite record);
    
    int selectAllCountForFavorite(Integer userid);

    int updateByPrimaryKeySelective(Favorite record);

    int updateByPrimaryKey(Favorite record);
}