package com.zhangli.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhangli.shop.dao.CommentMapper;
import com.zhangli.shop.pojo.Comment;
import com.zhangli.shop.service.CommentService;


@Service("commentService")
public class CommentServiceImpl implements CommentService{

	
	@Autowired
	private CommentMapper commentMapper;
	@Override
	public int postComment(Comment comment) {
		int result = commentMapper.insert(comment);
		return result;
	}
	@Override
	public List<Comment> selectAllCommentsByGoodsid(Integer goodsid) {
		List<Comment> comments = commentMapper.selectAllCommentsByGoodsid(goodsid);
		return comments;
	}

}
