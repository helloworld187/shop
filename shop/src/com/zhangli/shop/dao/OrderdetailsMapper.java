package com.zhangli.shop.dao;

import java.util.List;

import com.zhangli.shop.pojo.Orderdetails;

public interface OrderdetailsMapper {
    int deleteByPrimaryKey(Integer orderdetailesid);

    int insert(Orderdetails record);

    int insertSelective(Orderdetails record);

    Orderdetails selectByPrimaryKey(Integer orderdetailesid);
    
    List<Orderdetails> selectAllByUserid(Integer userid);
    
    List<Integer> selectDetailsidByOrdersid(Integer ordersid);
    
    int selectGoodsidByPrimaryKey(Integer orderDetailesId);

    int updateByPrimaryKeySelective(Orderdetails record);

    int updateByPrimaryKey(Orderdetails record);
}