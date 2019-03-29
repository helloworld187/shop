package com.zhangli.shop.dao;

import java.util.HashMap;
import java.util.List;

import com.zhangli.shop.pojo.Goods;
import com.zhangli.shop.pojo.Page;

public interface GoodsMapper {
    int deleteByPrimaryKey(Integer goodsid);

    int insert(Goods record);

    int insertSelective(Goods record);

    Goods selectByPrimaryKey(Integer goodsid);
    
    Goods selectGoodsForPage(HashMap map);
    
    List<Goods> selectByCategoryid(Integer categoryid);
    
    List<Goods> selectAllForPage(HashMap map);
    
    int selectAllCount(Integer categoryid);
    
    List<Goods> selectAllForFavoritePage(HashMap map);
    

    int updateByPrimaryKeySelective(Goods record);

    int updateByPrimaryKey(Goods record);
}