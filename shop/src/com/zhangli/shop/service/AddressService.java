package com.zhangli.shop.service;

import java.util.List;

import com.zhangli.shop.pojo.Address;

public interface AddressService {
	
	int addAddress(Address address);
	
	List<Address> selectAllByUserid(Integer userid);
	
	int deleteAddress(Integer addressid);
	
	int updateAddressById(Address address);
	
	Address selectByAddressid(Integer addressid);

}
