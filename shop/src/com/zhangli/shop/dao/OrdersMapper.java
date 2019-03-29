package com.zhangli.shop.dao;

import java.util.List;

import com.zhangli.shop.pojo.Orders;

public interface OrdersMapper {
    int deleteByPrimaryKey(Integer ordersid);

    int insert(Orders record);

    int insertSelective(Orders record);

    Orders selectByPrimaryKey(Integer ordersid);
    
    List<Orders> selectAllByUserid(Integer userid);

    int updateByPrimaryKeySelective(Orders record);

    int updateByPrimaryKey(Orders record);
}