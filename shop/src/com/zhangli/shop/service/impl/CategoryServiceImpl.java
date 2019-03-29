package com.zhangli.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhangli.shop.dao.CategoryMapper;
import com.zhangli.shop.pojo.Category;
import com.zhangli.shop.service.CategoryService;

@Service("CategoryService")
public class CategoryServiceImpl implements CategoryService{
	
	@Autowired
	private CategoryMapper categoryMapper;

	@Override
	public List<Category> findAllCategory() {
		List<Category> list  = categoryMapper.selectAll();
		return list;
	}
	

}
