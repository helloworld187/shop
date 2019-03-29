package com.zhangli.shop.dao;

import java.util.List;

import com.zhangli.shop.pojo.Comment;

public interface CommentMapper {
    int deleteByPrimaryKey(Integer commentid);

    int insert(Comment record);

    int insertSelective(Comment record);

    Comment selectByPrimaryKey(Integer commentid);
    
    List<Comment> selectAllCommentsByGoodsid(Integer goodsid);

    int updateByPrimaryKeySelective(Comment record);

    int updateByPrimaryKey(Comment record);
}