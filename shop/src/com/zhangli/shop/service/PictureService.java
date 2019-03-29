package com.zhangli.shop.service;


import java.util.List;

import com.zhangli.shop.pojo.Picture;

public interface PictureService {
	
	int uploadPicture(Picture picture);
	
	List<Picture> findPicturesByGoodsid(int goodsid);

}
