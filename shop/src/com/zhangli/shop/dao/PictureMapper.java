package com.zhangli.shop.dao;

import java.util.List;

import com.zhangli.shop.pojo.Picture;

public interface PictureMapper {
    int deleteByPrimaryKey(Integer pictureid);

    int insert(Picture record);

    int insertSelective(Picture record);

    Picture selectByPrimaryKey(Integer pictureid);
    
    List<Picture> selectByGoodsid(Integer goodsid);

    int updateByPrimaryKeySelective(Picture record);

    int updateByPrimaryKey(Picture record);
    
}