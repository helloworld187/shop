package com.zhangli.shop.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhangli.shop.pojo.Comment;
import com.zhangli.shop.pojo.User;
import com.zhangli.shop.service.CommentService;
import com.zhangli.shop.service.UserService;
import com.zhangli.shop.utils.TimeUtils;
import com.zhangli.shop.utils.UUIDUtils;

@Controller("/commentController")
@RequestMapping("comment")
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private UserService userService;
	
	
	//发表评论
	@RequestMapping("/postComment")
	@ResponseBody
	public List<String> postComment(Comment comment){
		comment.setCommentid(UUIDUtils.getNumUUID());
		comment.setCcreattime(new Date());
		int result = commentService.postComment(comment);
		User user =userService.selectByUserid(comment.getUserid());
		String username = user.getUsername();
		List<String> list = new ArrayList<>();
		String message = "";
		if(result>0){
			message = "发表成功！";
			list.add(0, message);
			list.add(1, comment.getCcreattime());
			list.add(2, username);
			System.out.println("评论创建时间："+comment.getCcreattime());
		}else{
			message = "发表失败！";
			list.add(0, message);
		}
		return list;
		
	}
	
	
	//评论列表
	@RequestMapping("/findAll")
	@ResponseBody
	public List<Comment> findAllComment(@Param("goodsid") String goodsid){
		int gid = Integer.parseInt(goodsid);
		List<Comment> comments = commentService.selectAllCommentsByGoodsid(gid);
		System.out.println("comments"+comments);
		return comments;
		
	}

}
