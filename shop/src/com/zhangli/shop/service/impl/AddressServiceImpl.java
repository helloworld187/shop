package com.zhangli.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhangli.shop.dao.AddressMapper;
import com.zhangli.shop.pojo.Address;
import com.zhangli.shop.service.AddressService;
import com.zhangli.shop.utils.UUIDUtils;

@Service("addressService")
public class AddressServiceImpl implements AddressService {

	
	@Autowired
	private AddressMapper addressMapper;
	
	@Override
	public int addAddress(Address address) {
		int result = addressMapper.insertSelective(address);
		return result;
	}

	@Override
	public List<Address> selectAllByUserid(Integer userid) {
		List<Address> list = addressMapper.selectByUserid(userid);
		return list;
	}

	@Override
	public int deleteAddress(Integer addressid) {
		int result = addressMapper.deleteByPrimaryKey(addressid);
		return result;
	}

	@Override
	public int updateAddressById(Address address) {
		int result = addressMapper.updateByPrimaryKeySelective(address);
		return result;
	}

	@Override
	public Address selectByAddressid(Integer addressid) {
		Address address = addressMapper.selectByPrimaryKey(addressid);
		return address;
	}

	
}
