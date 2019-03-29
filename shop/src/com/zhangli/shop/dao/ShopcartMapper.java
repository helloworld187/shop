package com.zhangli.shop.dao;

import java.util.List;

import com.zhangli.shop.pojo.Shopcart;


public interface ShopcartMapper {
    int deleteByPrimaryKey(Integer shopcartid);
    
    int deleteByGoodsid(Integer goodsid);

    int insert(Shopcart record);

    int insertSelective(Shopcart record);

    Shopcart selectByPrimaryKey(Integer shopcartid);
    
    List<Integer> selectByUserid(Integer userid);
    
    Shopcart selectByGoodsid(Integer goodsid);

    int updateByPrimaryKeySelective(Shopcart record);

    int updateByPrimaryKey(Shopcart record);
    
    Shopcart selectBySelective(Shopcart record);
}