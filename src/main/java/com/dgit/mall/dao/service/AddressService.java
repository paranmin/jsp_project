package com.dgit.mall.dao.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dgit.mall.dto.Address;
import com.dgit.mall.dto.Member;
import com.dgit.mall.util.MySqlSessionFactory;

public class AddressService {
	private static AddressService instance = new AddressService();
	private final String namespace = "com.dgit.mall.dao.AddressDao.";

	public static AddressService getInstance() {
		return instance;
	}

	private AddressService() {
	}

	public List<Address> selectByMemberNo(Member member) { //주소 다
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectList(namespace + "selectByMemberNo", member);
		}
	}

	public Address selectHomeByMemberNo(Member member) {//자택
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectOne(namespace + "selectHomeByMemberNo", member);
		}
	}

	public int insertByMemberNo(Address address) {//주소넣는거
		int res = 0;
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			res = sqlSession.insert(namespace + "insertByMemberNo", address);
			sqlSession.commit();
		}
		return res;
	}

	public int modifyByMemberNo(Address address) {
		int res = 0;
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			res = sqlSession.insert(namespace + "modifyByMemberNo", address);
			sqlSession.commit();
		}
		return res;
	}
}
