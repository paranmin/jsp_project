package com.dgit.mall.dao;

import java.sql.SQLException;
import java.util.List;

import com.dgit.mall.dto.Address;
import com.dgit.mall.dto.Member;

public interface AddressDao {
	List<Address> selectByMemberNo(Member member) throws SQLException;
	Address selectHomeByMemberNo(Member member) throws SQLException;
}
