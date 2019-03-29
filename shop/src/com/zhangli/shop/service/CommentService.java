package com.zhangli.shop.service;

import java.util.List;

import com.zhangli.shop.pojo.Comment;

public interface CommentService {
	
	int postComment(Comment comment);
	
	List<Comment> selectAllCommentsByGoodsid(Integer goodsid);

}
