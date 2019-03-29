package com.zhangli.shop.dao;

import java.util.List;

import com.zhangli.shop.pojo.Category;

public interface CategoryMapper {
    int deleteByPrimaryKey(Integer categoryid);

    int insert(Category record);

    int insertSelective(Category record);

    Category selectByPrimaryKey(Integer categoryid);
    
    List<Category> selectAll();

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);
}