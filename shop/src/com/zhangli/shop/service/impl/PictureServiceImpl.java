package com.zhangli.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhangli.shop.dao.PictureMapper;
import com.zhangli.shop.pojo.Goods;
import com.zhangli.shop.pojo.Picture;
import com.zhangli.shop.service.PictureService;
import com.zhangli.shop.utils.UUIDUtils;


@Service("pictureService")
public class PictureServiceImpl implements PictureService{
	
	@Autowired
	private PictureMapper pictureMapper;

	@Override
	public int uploadPicture(Picture picture) {
		picture.setPictureid(UUIDUtils.getNumUUID());
		int result = pictureMapper.insertSelective(picture);
		return result;
	}

	@Override
	public List<Picture> findPicturesByGoodsid(int goodsid) {
		List<Picture> list =  pictureMapper.selectByGoodsid(goodsid);
		return list;
	}

	

}
