package com.dgit.mall.dao;

import java.util.List;

import com.dgit.mall.dto.Address;
import com.dgit.mall.dto.Member;

public interface AddressDao {
	List<Address> selectByMemberNo(Member member);

	Address selectHomeByMemberNo(Member member);
	
	List<Address> selectByMemberNoandName(Member member);
	int insertByMemberNo(Address address);

	int modifyByMemberNo(Address address);
	
	int deleteAddressByaddrNo(int addrNo);
}
