package com.zhangli.shop.dao;

import java.util.List;

import com.zhangli.shop.pojo.Address;

public interface AddressMapper {
    int deleteByPrimaryKey(Integer addressid);

    int insert(Address record);

    int insertSelective(Address record);

    Address selectByPrimaryKey(Integer addressid);
    
    List<Address> selectByUserid(Integer userid);

    int updateByPrimaryKeySelective(Address record);

    int updateByPrimaryKey(Address record);
}