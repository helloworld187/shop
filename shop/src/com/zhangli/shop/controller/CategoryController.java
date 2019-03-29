package com.zhangli.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhangli.shop.pojo.Category;
import com.zhangli.shop.service.CategoryService;

@Controller("categoryController")
@RequestMapping("/category")
public class CategoryController {
	
	@Autowired
	public CategoryService categoryService;
	
	
	
	//查找所有分类
	@RequestMapping("/find")
	@ResponseBody
	public List<Category> findAllCategory(Model model){
		List<Category> list = categoryService.findAllCategory();
		model.addAttribute("CategoryList", list);
		return list;
		
	}
	
	
}
