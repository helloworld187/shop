package com.zhangli.shop.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhangli.shop.pojo.Address;
import com.zhangli.shop.pojo.Goods;
import com.zhangli.shop.pojo.User;
import com.zhangli.shop.service.AddressService;
import com.zhangli.shop.service.GoodsService;
import com.zhangli.shop.service.ShopcartService;
import com.zhangli.shop.service.UserService;
import com.zhangli.shop.utils.UUIDUtils;

@Controller("addressController")
@RequestMapping("/address")
public class AddressController {
	
	@Autowired
	private AddressService addressService;
	
	@Autowired
	private ShopcartService shopcartService;
	
	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private UserService userService;
	
	
	//添加收货地址
	@RequestMapping("/addAddress")
	@ResponseBody
	public String addAddress(Address address,HttpSession session,Model model){
		address.setAddressid(UUIDUtils.getNumUUID());
		User user = (User) session.getAttribute("user");
		int userid = user.getUserid();
		address.setUserid(userid);
		int result = addressService.addAddress(address);
		String message = "";
		if(result > 0){
			message = "地址添加成功！";
		}else{
			message = "地址添加失败！";
		}
		return message;
		
	}
	
	//查找该用户收货地址
	@RequestMapping("/selectAllAddress")
	public String findAllAddress(@Param("skip") String skip,HttpSession session,Model model){
		User user = (User) session.getAttribute("user");
		int userid = user.getUserid();
		List<Address> addressList = addressService.selectAllByUserid(userid);
		
		List<Integer> list = shopcartService.selectGoodsidByUserid(userid);
		List<Goods> goodslist = new ArrayList<>();
		for(int i=0;i<list.size();i++){
			Goods goods = goodsService.findGoodsById(list.get(i));
			goodslist.add(i, goods);
		}
		
		model.addAttribute("GoodsList", goodslist);
		model.addAttribute("Address", addressList);
		System.out.println("收货地址有几个："+addressList.size());
			
		if("2".equals(skip)){
			return "../address";
		}else{
			return "../confirm_shoppinglist";
		}
		
		
	}
	
	//删除收货地址
	@RequestMapping("deleteAddress")
	@ResponseBody
	public String deleteAddressById(@Param("addressid") int addressid){
		System.out.println("addressid为:"+addressid);
		int result = addressService.deleteAddress(addressid);
		System.out.println("删除结果为："+result);
		String message = "";
		if(result > 0){
			message = "删除成功！";
		}else{
			message = "删除失败！";
		}
		return message;
		
	}
	
	//修改收货地址
	@RequestMapping("updateAddress")
	@ResponseBody
	public String updateAddressById(Address address){
		int result = addressService.updateAddressById(address);
		System.out.println("修改结果为："+result);
		String message = "";
		if(result > 0){
			message = "修改成功！";
		}else{
			message = "修改失败！";
		}
		return message;
		
	}
	
	//查看收货地址
	@RequestMapping("findAddressByid")
	public String findAddressByid(Model model,@Param("addressid") String addressid){
		Address address = addressService.selectByAddressid(Integer.valueOf(addressid));
		model.addAttribute("Address", address);
		return "../address_edit";
		
	}
	

}
